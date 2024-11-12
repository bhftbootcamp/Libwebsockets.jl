# runtests

using Test
using Libwebsockets

mutable struct UserData
    f::Function
    done::Bool
end

function http_callback(wsi::Ptr{Cvoid}, reason::Cint, user::Ptr{Cvoid}, data::Ptr{UInt8}, len::Csize_t)::Cint 
    if reason == LWS_CALLBACK_RECEIVE_CLIENT_HTTP_READ && user != C_NULL
        user_ctx = unsafe_pointer_to_objref(user)
        response = unsafe_wrap(Vector{UInt8}, data, len)
        user_ctx.f(response)
        user_ctx.done = true
    elseif reason == LWS_CALLBACK_RECEIVE_CLIENT_HTTP 
        buffer = Vector{UInt8}(undef, 1024 + LWS_PRE)
        px = pointer(buffer, LWS_PRE + 1)
        lenx = Ref{Cint}(1024)
        lws_http_client_read(wsi, px, lenx)
    end
    return 0
end

function http_get(cb::Function, addr::String, port::Int, path::String)
    ctx = LwsContextCreationInfo()
    callback_function = @cfunction(http_callback, Cint, (Ptr{Cvoid}, Cint, Ptr{Cvoid}, Ptr{UInt8}, Csize_t))
    protocols = [
        LwsProtocols(pointer("http"), callback_function, 0, 0, 0, C_NULL, 0),
        LwsProtocols(C_NULL, C_NULL, 0, 0, 0, C_NULL, 0)
    ]
    ctx.port = CONTEXT_PORT_NO_LISTEN
    ctx.protocols = Base.unsafe_convert(Ptr{LwsProtocols}, Ref(protocols[1]))
    ws_ctx = lws_create_context(Ref(ctx))

    user = UserData(cb, false)
    user_ptr = pointer_from_objref(user)

    conn = LwsClientConnectInfo()
    conn.context = ws_ctx
    conn.port = port
    conn.address = pointer(addr)
    conn.path = pointer(path)
    conn.host = conn.address
    conn.userdata = user_ptr
    conn.method = pointer("GET")
    conn.protocol = pointer("http")
    lws_client_connect_via_info(Ref(conn))
    
    GC.@preserve user begin
        while !user.done
            lws_service(ws_ctx, 0)
        end
    end
end

@testset "Optional interface" begin
    server_setup = quote
        using Sockets

        port_hint = 9000 + (getpid() % 1000)
        port::UInt64, uv_server = listenany(port_hint)

        println(stdout, port)
        flush(stdout)

        while isopen(uv_server)
            sock = accept(uv_server)
            @async while isopen(sock)
                echo = Sockets.readavailable(sock)
                println(String(echo))
                write(
                    sock,
                    "HTTP/1.1 200 OK\r\n" *
                    "Server: TestServer\r\n" *
                    "Content-Type: text/html; charset=utf-8\r\n" *
                    "User-Agent: Libwebsockets.jl\r\n" *
                    "\r\n" *
                    "<h1>Hello, Test!</h1>\n",
                )
                close(sock)
            end
        end
    end

    server_procs = open(`$(Base.julia_cmd()) -e $server_setup`, "w+")
    port_str = readline(server_procs)
    port = parse(Int, port_str)

    http_get("127.0.0.1", port, "/") do response
        @test response == b"<h1>Hello, Test!</h1>\n"
    end

    kill(server_procs, Base.SIGKILL)
end