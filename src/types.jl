# types.jl

export Lws,
    LwsAc,
    LwsAcmeCertAgingArgs,
    LwsClientConnectInfo,
    LwsContext,
    LwsContextCreationInfo,
    LwsDsh,
    LwsEventLoopOps,
    LwsExtOptionArg,
    LwsExtOptions,
    LwsExtension,
    LwsHttpMount,
    LwsLogCx,
    LwsLogCxUnion,
    LwsMetricPolicy,
    LwsPlatFileOps,
    LwsPlugin,
    LwsPluginEvlib,
    LwsPluginHeader,
    LwsPluginProtocol,
    LwsPluginUnion,
    LwsPollargs,
    LwsPollfd,
    LwsProcessHtmlArgs,
    LwsProcessHtmlState,
    LwsProtocolVhostOptions,
    LwsProtocols,
    LwsSequencer,
    LwsSpa,
    LwsSpaCreateInfo,
    LwsSsPlugin,
    LwsSsPolicy,
    LwsSslInfo,
    LwsTlsCertInfoResults,
    LwsTlsSessionDump,
    LwsTokenLimits,
    LwsTokens,
    LwsVhost,
    LwsWritePassthru,
    LwsX509Cert,
    LwsSslCtxSt,
    LwsSystemOpts,
    LwsRetryBo,
    LwsDll2,
    LwsStateNotifyLink

struct LwsContext end
struct LwsVhost end
struct Lws end
struct LwsDsh end
struct LwsEventLoopOps end
struct LwsSsPolicy end
struct LwsSsPlugin end
struct LwsMetricPolicy end
struct LwsPlatFileOps end
struct LwsSequencer end
struct LwsSpa end
struct LwsAc end
struct LwsX509Cert end
struct LwsSslCtxSt end

Base.@kwdef mutable struct LwsLogCxUnion
    emit::Ptr{Cvoid} = C_NULL
    emit_cx::Ptr{Cvoid} = C_NULL
end

Base.@kwdef mutable struct LwsLogCx
    u::LwsLogCxUnion = LwsLogCxUnion()
    refcount_cb::Ptr{Cvoid} = C_NULL
    prepend::Ptr{Cvoid} = C_NULL
    parent::Ptr{LwsLogCx} = C_NULL
    opaque::Ptr{Cvoid} = C_NULL
    stg::Ptr{Cvoid} = C_NULL
    lll_flags::Cuint = 0
    refcount::Cint = 0
end

Base.@kwdef mutable struct LwsPollargs
    fd::Cint = 0
    events::Cint = 0
    prev_events::Cint = 0
end

Base.@kwdef mutable struct LwsSslInfo
    _where::Cint = 0
    ret::Cint = 0
end

Base.@kwdef mutable struct LwsAcmeCertAgingArgs
    vh::Ptr{LwsVhost} = C_NULL
    element_overrides::Ptr{Ptr{Cchar}} = C_NULL# max_len = LWS_TLS_TOTAL_COUNT
end

Base.@kwdef mutable struct LwsExtOptions
    name::Ptr{Cchar} = C_NULL
    type::Cuint = 0
end

Base.@kwdef mutable struct LwsExtOptionArg
    option_name::Ptr{Cchar} = C_NULL
    option_index::Cint = 0
    start::Ptr{Cchar} = C_NULL
    len::Cint = 0
end

Base.@kwdef mutable struct LwsExtension
    name::Ptr{Cchar} = C_NULL
    callback::Ptr{Cvoid} = C_NULL
    client_offer::Ptr{Cchar} = C_NULL
end

Base.@kwdef struct LwsProtocols
    name::Ptr{Cchar} = C_NULL
    callback::Ptr{Cvoid} = C_NULL
    per_session_data_size::Csize_t = 0
    rx_buffer_size::Csize_t = 0
    id::Cuint = 0
    user::Ptr{Cvoid} = C_NULL
    tx_packet_size::Csize_t = 0
end

Base.@kwdef mutable struct LwsProtocolVhostOptions
    next::Ptr{LwsProtocolVhostOptions} = C_NULL
    options::Ptr{LwsProtocolVhostOptions} = C_NULL
    name::Ptr{Cchar} = C_NULL
    value::Ptr{Cchar} = C_NULL
end

Base.@kwdef mutable struct LwsPluginHeader
    name::Ptr{Cchar} = C_NULL
    _class::Ptr{Cchar} = C_NULL
    lws_build_hash::Ptr{Cchar} = C_NULL
    api_magic::Cuint = 0
end

Base.@kwdef mutable struct LwsPluginProtocol
    hdr::LwsPluginHeader = LwsPluginHeader()
    protocols::Ptr{LwsProtocols} = C_NULL
    extensions::Ptr{LwsExtension} = C_NULL
    count_protocols::Cint = 0
    count_extensions::Cint = 0
end

Base.@kwdef mutable struct LwsPluginUnion
    l::Ptr{Cvoid} = C_NULL
end

Base.@kwdef mutable struct LwsPlugin
    list::Ptr{LwsPlugin} = C_NULL
    hdr::Ptr{LwsPluginHeader} = C_NULL
    u::LwsPluginUnion = LwsPluginUnion()
end

Base.@kwdef mutable struct LwsPluginEvlib
    hdr::LwsPluginHeader = LwsPluginHeader()
    ops::Ptr{LwsEventLoopOps} = C_NULL
end

Base.@kwdef mutable struct LwsTokenLimits
    token_limit::Vector{Cushort} = fill(Cushort(0), WSI_TOKEN_COUNT)# max_len = WSI_TOKEN_COUNT
end

Base.@kwdef mutable struct LwsHttpMount
    mount_next::Ptr{LwsHttpMount} = C_NULL
    mountpoint::Ptr{Cchar} = C_NULL
    origin::Ptr{Cchar} = C_NULL
    def::Ptr{Cchar} = C_NULL
    protocol::Ptr{Cchar} = C_NULL
    cgienv::Ptr{LwsProtocolVhostOptions} = C_NULL
    extra_mimetypes::Ptr{LwsProtocolVhostOptions} = C_NULL
    interpret::Ptr{LwsProtocolVhostOptions} = C_NULL
    cgi_timeout::Cint = 0
    cache_max_age::Cint = 0
    auth_mask::Cuint = 0
    cache_reusable::Cuint = 0
    cache_revalidate::Cuint = 0
    cache_intermediaries::Cuint = 0
    origin_protocol::Cuchar = 0
    mountpoint_len::Cuchar = 0
    basic_auth_login_file::Ptr{Cchar} = C_NULL
end

struct LwsSystemOpts
    reboot::Ptr{Cvoid}
    set_clock::Ptr{Cvoid}
    attach::Ptr{Cvoid}
    captive_portal_detect_request::Ptr{Cvoid}
    metric_report::Ptr{Cvoid}
    jit_trust_query::Ptr{Cvoid}
    wake_latency_us::UInt32
end

struct LwsRetryBo
    retry_ms_table::Ptr{UInt32}
    retry_ms_table_count::UInt16
    conceal_count::UInt16
    secs_since_valid_ping::UInt16
    secs_since_valid_hangup::UInt16
    jitter_percent::UInt8
end

struct LwsDll2
    prev::Ptr{LwsDll2}
    next::Ptr{LwsDll2}
    owner::Ptr{Cvoid} # owner::Ptr{lws_dll2_owner}
end

struct LwsStateNotifyLink
    list::LwsDll2
    notify_cb::Ptr{Cvoid}
    name::Ptr{Cchar}
end

Base.@kwdef mutable struct LwsContextCreationInfo
    iface::Ptr{Cchar} = C_NULL
    protocols::Ptr{LwsProtocols} = C_NULL
    extensions::Ptr{LwsExtension} = C_NULL
    token_limits::Ptr{LwsTokenLimits} = C_NULL
    http_proxy_address::Ptr{Cchar} = C_NULL
    headers::Ptr{LwsProtocolVhostOptions} = C_NULL
    reject_service_keywords::Ptr{LwsProtocolVhostOptions} = C_NULL
    pvo::Ptr{LwsProtocolVhostOptions} = C_NULL
    log_filepath::Ptr{Cchar} = C_NULL
    mounts::Ptr{LwsHttpMount} = C_NULL
    server_string::Ptr{Cchar} = C_NULL
    error_document_404::Ptr{Cchar} = C_NULL
    port::Cint = 0
    http_proxy_port::Cuint = 0
    max_http_header_data2::Cuint = 0
    max_http_header_pool2::Cuint = 0
    keepalive_timeout::Cint = 0
    http2_settings::NTuple{7,UInt32} = ntuple(i -> UInt32(0), 7)
    max_http_header_data::Cushort = 0
    max_http_header_pool::Cushort = 0
    ssl_private_key_password::Ptr{Cchar} = C_NULL
    ssl_cert_filepath::Ptr{Cchar} = C_NULL
    ssl_private_key_filepath::Ptr{Cchar} = C_NULL
    ssl_ca_filepath::Ptr{Cchar} = C_NULL
    ssl_cipher_list::Ptr{Cchar} = C_NULL
    ecdh_curve::Ptr{Cchar} = C_NULL
    tls1_3_plus_cipher_list::Ptr{Cchar} = C_NULL
    server_ssl_cert_mem::Ptr{Cvoid} = C_NULL
    server_ssl_private_key_mem::Ptr{Cvoid} = C_NULL
    server_ssl_ca_mem::Ptr{Cvoid} = C_NULL
    ssl_options_set::Clong = 0
    ssl_options_clear::Clong = 0
    simultaneous_ssl_restriction::Cint = 0
    simultaneous_ssl_handshake_restriction::Cint = 0
    ssl_info_event_mask::Cint = 0
    server_ssl_cert_mem_len::Cuint = 0
    server_ssl_private_key_mem_len::Cuint = 0
    server_ssl_ca_mem_len::Cuint = 0
    alpn::Ptr{Cchar} = C_NULL
    client_ssl_private_key_password::Ptr{Cchar} = C_NULL
    client_ssl_cert_filepath::Ptr{Cchar} = C_NULL
    client_ssl_cert_mem::Ptr{Cvoid} = C_NULL
    client_ssl_cert_mem_len::Cuint = 0
    client_ssl_private_key_filepath::Ptr{Cchar} = C_NULL
    client_ssl_key_mem::Ptr{Cvoid} = C_NULL
    client_ssl_ca_filepath::Ptr{Cchar} = C_NULL
    client_ssl_ca_mem::Ptr{Cvoid} = C_NULL
    client_ssl_cipher_list::Ptr{Cchar} = C_NULL
    client_tls_1_3_plus_cipher_list::Ptr{Cchar} = C_NULL
    ssl_client_options_set::Clong = 0
    ssl_client_options_clear::Clong = 0
    client_ssl_ca_mem_len::Cuint = 0
    client_ssl_key_mem_len::Cuint = 0
    provided_client_ssl_ctx::Ptr{LwsSslCtxSt} = Ptr{LwsSslCtxSt}(C_NULL)
    ka_time::Cint = 0
    ka_probes::Cint = 0
    ka_interval::Cint = 0
    timeout_secs::Cuint = 0
    connect_timeout_secs::Cuint = 0
    bind_iface::Cint = 0
    timeout_secs_ah_idle::Cuint = 0
    tls_session_timeout::Cuint = 0
    tls_session_cache_max::Cuint = 0
    gid::Cuint = 0
    uid::Cuint = 0
    options::Cuintmax_t = 0
    user::Ptr{Cvoid} = C_NULL
    count_threads::Cuint = 0
    fd_limit_per_thread::Cuint = 0
    vhost_name::Ptr{Cchar} = C_NULL
    external_baggage_free_on_destroy::Ptr{Cvoid} = C_NULL
    pt_serv_buf_size::Cuint = 0
    fops::Ptr{LwsPlatFileOps} = C_NULL
    foreign_loops::Ptr{Ptr{Cvoid}} = C_NULL
    signal_cb::Ptr{Cvoid} = C_NULL
    pcontext::Ptr{Ptr{LwsContext}} = C_NULL
    finalize::Ptr{Cvoid} = C_NULL
    finalize_arg::Ptr{Cvoid} = C_NULL
    listen_accept_role::Ptr{Cchar} = C_NULL
    listen_accept_protocol::Ptr{Cchar} = C_NULL
    pprotocols::Ptr{Ptr{LwsProtocols}} = C_NULL
    username::Ptr{Cchar} = C_NULL
    groupname::Ptr{Cchar} = C_NULL
    unix_socket_perms::Ptr{Cchar} = C_NULL
    system_ops::Ptr{LwsSystemOpts} = Ptr{LwsSystemOpts}(C_NULL)
    retry_and_idle_policy::Ptr{LwsRetryBo} = Ptr{LwsRetryBo}(C_NULL)
    register_notifier_list::Ptr{Ptr{LwsStateNotifyLink}} = Ptr{Ptr{LwsStateNotifyLink}}(C_NULL)
    rlimit_nofile::Cint = 0
    early_smd_cb::Ptr{Cvoid} = C_NULL
    early_smd_opaque::Ptr{Cvoid} = C_NULL
    early_smd_class_filter::Cint = 0
    smd_ttl_us::Cintmax_t = 0
    smd_queue_depth::Cushort = 0
    fo_listen_queue::Cint = 0
    event_lib_custom::Ptr{LwsPluginEvlib} = C_NULL
    log_cx::Ptr{LwsLogCx} = C_NULL
    http_nsc_filepath::Ptr{Cchar} = C_NULL
    http_nsc_heap_max_footprint::Csize_t = 0
    http_nsc_heap_max_items::Csize_t = 0
    http_nsc_heap_max_payload::Csize_t = 0
    _unused::NTuple{2,Ptr{Cvoid}} = (Ptr{Nothing}(C_NULL), Ptr{Nothing}(C_NULL))
end

Base.@kwdef mutable struct LwsClientConnectInfo
    context::Ptr{LwsContext} = C_NULL
    address::Ptr{Cchar} = C_NULL
    port::Cint = 0
    ssl_connection::Cint = 0
    path::Ptr{Cchar} = C_NULL
    host::Ptr{Cchar} = C_NULL
    origin::Ptr{Cchar} = C_NULL
    protocol::Ptr{Cchar} = C_NULL
    ietf_version_or_minus_one::Cint = 0
    userdata::Ptr{Cvoid} = C_NULL
    client_exts::Ptr{Cvoid} = C_NULL
    method::Ptr{Cchar} = C_NULL
    parent_wsi::Ptr{Lws} = C_NULL
    uri_replace_from::Ptr{Cchar} = C_NULL
    uri_replace_to::Ptr{Cchar} = C_NULL
    vhost::Ptr{LwsVhost} = C_NULL
    pwsi::Ptr{Ptr{Lws}} = C_NULL
    iface::Ptr{Cchar} = C_NULL
    local_protocol_name::Ptr{Cchar} = C_NULL
    alpn::Ptr{Cchar} = C_NULL
    seq::Ptr{LwsSequencer} = C_NULL
    opaque_user_data::Ptr{Cvoid} = C_NULL
    retry_and_idle_policy::Ptr{LwsRetryBo} = C_NULL
    manual_initial_tx_credit::Cint = 0
    sys_tls_client_cert::Cuchar = 0
    priority::Cuchar = 0
    mqtt_cp::Ptr{Cvoid} = C_NULL
    fi_wsi_name::Ptr{Cchar} = C_NULL
    keep_warm_secs::Cushort = 0
    log_cx::Ptr{LwsLogCx} = C_NULL
    _unused::NTuple{4,Ptr{Cvoid}} = (Ptr{Nothing}(C_NULL), Ptr{Nothing}(C_NULL), Ptr{Nothing}(C_NULL), Ptr{Nothing}(C_NULL))
end

Base.@kwdef mutable struct LwsProcessHtmlArgs
    p::Ptr{Cchar} = C_NULL
    len::Cint = 0
    max_len::Cint = 0
    final::Cint = 0
    chunked::Cint = 0
end

Base.@kwdef mutable struct LwsProcessHtmlState
    start::Ptr{Cchar} = C_NULL
    swallow::Ptr{Cchar} = C_NULL# max_len = 16
    pos::Cint = 0
    data::Ptr{Cvoid} = C_NULL
    vars::Ptr{Ptr{Cchar}} = C_NULL
    count_vars::Cint = 0
    replace::Ptr{Cvoid} = C_NULL
end

Base.@kwdef mutable struct LwsTokens
    token::Ptr{Cuchar} = C_NULL
    len::Cint = 0
end

Base.@kwdef mutable struct LwsSpaCreateInfo
    param_names::Ptr{Ptr{Cchar}} = C_NULL
    count_params::Cint = 0
    max_storage::Cint = 0
    opt_cb::Ptr{Cvoid} = C_NULL
    opt_data::Ptr{Cvoid} = C_NULL
    param_names_stride::Csize_t = 0
    ac::Ptr{Ptr{LwsAc}} = C_NULL
    ac_chunk_size::Csize_t = 0
end

Base.@kwdef mutable struct LwsWritePassthru
    wsi::Ptr{Lws} = C_NULL
    buf::Ptr{Cuchar} = C_NULL
    len::Csize_t = 0
    wp::Cuint = 0
end

Base.@kwdef mutable struct LwsTlsCertInfoResults
    verified::Cuint = 0
    time::Clong = 0
    usage::Cuint = 0
    len::Cint = 0
    name::Ptr{Cchar} = C_NULL
end

Base.@kwdef mutable struct LwsTlsSessionDump
    tag::Ptr{Cchar} = C_NULL # max_len = LWS_SESSION_TAG_LEN
    blob::Ptr{Cvoid} = C_NULL
    opaque::Ptr{Cvoid} = C_NULL
    blob_len::Csize_t = 0
end

Base.@kwdef mutable struct LwsPollfd
    fd::Cint = 0
    events::Cshort = 0
    revents::Cshort = 0
end
