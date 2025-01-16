# Libwebsockets.jl

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://bhftbootcamp.github.io/Libwebsockets.jl/stable/)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://bhftbootcamp.github.io/Libwebsockets.jl/dev/)
[![Build Status](https://github.com/bhftbootcamp/Libwebsockets.jl/actions/workflows/CI.yml/badge.svg?branch=master)](https://github.com/bhftbootcamp/Libwebsockets.jl/actions/workflows/CI.yml?query=branch%3Amaster)
[![Coverage](https://codecov.io/gh/bhftbootcamp/Libwebsockets.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/bhftbootcamp/Libwebsockets.jl)
[![Registry](https://img.shields.io/badge/registry-General-4063d8)](https://github.com/JuliaRegistries/General)

Libwebsockets is a Julia wrapper for the [libwebsockets](https://libwebsockets.org/) library, providing verstile tooling for setting up WebSocket and HTTP clients and servers, managing SSL connections, and handling data efficiently in a variety of applications.

## Installation

To install Libwebsockets, simply use the Julia package manager:

```julia
] add Libwebsockets
```

## Usage

With Libwebsockets, you can quickly connect to a WebSocket stream in Julia. In just a few lines, set up a client, handle incoming events, and process data.

```julia
using Libwebsockets

mutable struct UserData
    callback::Function
end

function ws_callback(wsi::Ptr{Cvoid}, reason::Cint, user::Ptr{Cvoid}, data::Ptr{Cvoid}, len::Csize_t)
    if reason == LWS_CALLBACK_CLIENT_RECEIVE && data != C_NULL
        ctx = lws_get_context(wsi)
        user_ctx = unsafe_pointer_to_objref(lws_context_user(ctx))
        user_ctx.callback(unsafe_wrap(Vector{UInt8}, Ptr{UInt8}(data), len))
    end
    return lws_callback_http_dummy(wsi, reason, user, data, len)
end

function ws_open(callback::Function, addr::String, port::Int, path::String)
    lws_set_log_level(0, C_NULL)
    
    callback_ptr = @cfunction(ws_callback, Cint, (Ptr{Cvoid}, Cint, Ptr{Cvoid}, Ptr{Cvoid}, Csize_t))
    protocols = [
        LwsProtocols(pointer("ws"), callback_ptr, 0, 0, 0, C_NULL, 0),
        LwsProtocols(C_NULL, C_NULL, 0, 0, 0, C_NULL, 0)
    ]
    user = UserData(callback)

    ctx_info = LwsContextCreationInfo()
    ctx_info.options = LWS_SERVER_OPTION_DO_SSL_GLOBAL_INIT
    ctx_info.port = CONTEXT_PORT_NO_LISTEN
    ctx_info.user = Base.unsafe_convert(Ptr{UserData}, Ref(user))
    ctx_info.protocols = pointer(protocols)
    ws_ctx = lws_create_context(Ref(ctx_info))

    conn_info = LwsClientConnectInfo()
    conn_info.context = ws_ctx
    conn_info.port = port
    conn_info.address = pointer(addr)
    conn_info.path = pointer(path)
    conn_info.host = conn_info.address
    conn_info.ssl_connection = LCCSCF_USE_SSL | LCCSCF_ALLOW_SELFSIGNED
    lws_client_connect_via_info(Ref(conn_info))

    while true
        lws_service(ws_ctx, 0)
    end
end

ws_open("stream.binance.com", 9443, "/stream?streams=adausdt@depth5@100ms") do message
    println("Received message: ", String(message))
end
```

## Useful Links

1. [Libwebsockets](https://libwebsockets.org/) – detailed library docs.
2. [libwebsockets_jll](https://github.com/JuliaBinaryWrappers/libwebsockets_jll.jl) – latest wrapper version.

## Contributing

Contributions to Libwebsockets are welcome! If you encounter a bug, have a feature request, or would like to contribute code, please open an issue or a pull request on GitHub.
