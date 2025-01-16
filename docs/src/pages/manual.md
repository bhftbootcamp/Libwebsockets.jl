# WebSocket Client Example

Here we demonstrate how to create a WebSocket client using **Libwebsockets** in Julia.
The client connects to data stream and receives updates for a specified trading pair.
A callback function processes each incoming message, making it easy to handle data as it arrives.
The client is configured with SSL support for secure communication, and you can customize the handler function to suit your data-processing needs.

- Firstly we need to define User Data Structure:

`UserData` is a struct holding a function `callback`, which will process the incoming WebSocket messages.

```julia
using Libwebsockets

mutable struct UserData
    callback::Function
end
```

- Then we define WebSocket Callback Function:

`ws_callback` is a function that gets triggered on various WebSocket events and calls the user-defined function `callback` on the message data.

```julia
function ws_callback(wsi::Ptr{Cvoid}, reason::Cint, user::Ptr{Cvoid}, data::Ptr{Cvoid}, len::Csize_t)
    if reason == LWS_CALLBACK_CLIENT_RECEIVE && data != C_NULL
        ctx = lws_get_context(wsi)
        user_ctx = unsafe_pointer_to_objref(lws_context_user(ctx))
        user_ctx.callback(unsafe_wrap(Vector{UInt8}, Ptr{UInt8}(data), len))
    end
    return lws_callback_http_dummy(wsi, reason, user, data, len)
end
```

Now we can define main `ws_open` function to open and initialize WebSocket connection. 
It is possible to set the log level using the `lws_set_log_level` function; in this example, logging is disabled. The `ws_open` function consists of three main steps:

- Setup WebSocket Protocol and Callback:

It defines a WebSocket callback function `ws_callback` that handles incoming WebSocket events.
A `protocol` structure is created to specify which function should be used for WebSocket events.
User data is also set up, containing the callback function the user wants to use to process incoming messages.

- Configure and Create WebSocket Context:

`LwsContextCreationInfo` is initialized with options for SSL and non-listening mode (indicating this is a client).
This configuration is passed to `lws_create_context`, which creates the WebSocket context needed to manage the connection.

- Establish the WebSocket Connection and Event Loop:

`LwsClientConnectInfo` is set up with server details like the `address`, `port`, `path`, `user`, and SSL options, and the connection is initiated using `lws_client_connect_via_info`.
The function then enters an infinite loop, continuously calling `lws_service` to handle WebSocket events (such as receiving messages) and process them via the user-defined callback.

```julia
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
```

- User-defined Callback:

Finally `ws_open` is called with a user-defined callback function that simply prints any received messages.

```julia
ws_open("stream.binance.com", 9443, "/stream?streams=adausdt@depth5@100ms") do message
    println("Received message: ", String(message))
end
```
