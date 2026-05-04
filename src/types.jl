# __types

struct LwsContext end
struct Lws end
struct LwsDsh end
struct LwsEventLoopOps end
struct LwsSsPolicy end
struct LwsSsPlugin end
struct LwsMetricPolicy end
struct LwsSequencer end
struct LwsSpa end
struct LwsAc end
struct LwsX509Cert end
struct LwsSslCtxSt end
struct LwsTransportProxyOps end
struct LwsTransportClientOps end

const LWS_PLAT_FILE_OPS_SIZE = 88

Base.@kwdef struct LwsFopsIndex
    sig::Ptr{Cchar} = C_NULL
    len::UInt8 = 0
end

Base.@kwdef struct LwsPlatFileOps
    LWS_FOP_OPEN::Ptr{Cvoid} = C_NULL
    LWS_FOP_CLOSE::Ptr{Cvoid} = C_NULL
    LWS_FOP_SEEK_CUR::Ptr{Cvoid} = C_NULL
    LWS_FOP_READ::Ptr{Cvoid} = C_NULL
    LWS_FOP_WRITE::Ptr{Cvoid} = C_NULL
    fi::NTuple{3, LwsFopsIndex} = ntuple(_ -> LwsFopsIndex(), 3)
    next::Ptr{Cvoid} = C_NULL
    cx::Ptr{Cvoid} = C_NULL
end

Base.@kwdef mutable struct LwsLogCxUnion
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

Base.@kwdef struct LwsProtocols
    name::Ptr{Cchar} = C_NULL
    callback::Ptr{Cvoid} = C_NULL
    per_session_data_size::Csize_t = 0
    rx_buffer_size::Csize_t = 0
    id::Cuint = 0
    _pad_h2::NTuple{4, UInt8} = ntuple(_ -> UInt8(0), 4)
    user::Ptr{Cvoid} = C_NULL
    tx_packet_size::Csize_t = 0
end

Base.@kwdef struct LwsDll2
    prev::Ptr{LwsDll2} = C_NULL
    next::Ptr{LwsDll2} = C_NULL
    owner::Ptr{Cvoid} = C_NULL
end

Base.@kwdef struct LwsDll2Owner
    tail::Ptr{LwsDll2} = C_NULL
    head::Ptr{LwsDll2} = C_NULL
    count::UInt32 = 0
end

Base.@kwdef struct LwsLifecycle
    gutag::NTuple{64, UInt8} = ntuple(_ -> UInt8(0), 64)
    list::LwsDll2 = LwsDll2()
    us_creation::UInt64 = 0
    log_cx::Ptr{Cvoid} = C_NULL
    recycle_len::UInt8 = 0
end

const H2SET_COUNT = 36

Base.@kwdef struct Http2Settings
    s::NTuple{H2SET_COUNT, UInt8} = ntuple(_ -> UInt8(0), H2SET_COUNT)
end

Base.@kwdef struct LwsVhostRoleH2
    set::Http2Settings = Http2Settings()
end

Base.@kwdef struct LwsVhostRoleWs
    extensions::Ptr{Cvoid} = C_NULL
end

Base.@kwdef struct AlpnCtx
    data::NTuple{23, UInt8} = ntuple(_ -> UInt8(0), 23)
    len::UInt8 = 0
end

Base.@kwdef struct LwsVhostTls
    ssl_ctx::Ptr{Cvoid} = C_NULL
    ssl_client_ctx::Ptr{Cvoid} = C_NULL
    tcr::Ptr{Cvoid} = C_NULL
    alpn::Ptr{Cchar} = C_NULL
    ss::Ptr{Cvoid} = C_NULL
    alloc_cert_path::Ptr{Cchar} = C_NULL
    key_path::Ptr{Cchar} = C_NULL
    ecdh_curve::NTuple{16, UInt8} = ntuple(_ -> UInt8(0), 16)
    alpn_ctx::AlpnCtx = AlpnCtx()
    use_ssl::Cint = 0
    allow_non_ssl_on_ssl_port::Cint = 0
    ssl_info_event_mask::Cint = 0
    flags::Cuint = 0
end

Base.@kwdef mutable struct LwsProtocolVhostOptions
    next::Ptr{LwsProtocolVhostOptions} = C_NULL
    options::Ptr{LwsProtocolVhostOptions} = C_NULL
    name::Ptr{Cchar} = C_NULL
    value::Ptr{Cchar} = C_NULL
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
    cache_flags::Cuchar = 0
    origin_protocol::Cuchar = 0
    mountpoint_len::Cuchar = 0
    basic_auth_login_file::Ptr{Cchar} = C_NULL
    cgi_chroot_path::Ptr{Cchar} = C_NULL
    cgi_wd::Ptr{Cchar} = C_NULL
end

Base.@kwdef struct LwsVhostRoleHttp
    http_proxy_address::NTuple{128, UInt8} = ntuple(_ -> UInt8(0), 128)
    mount_list::Ptr{LwsHttpMount} = C_NULL
    error_document_404::Ptr{Cchar} = C_NULL
    http_proxy_port::Cuint = 0
end

Base.@kwdef mutable struct LwsVhost
    proxy_basic_auth_token::NTuple{128, UInt8} = ntuple(i -> UInt8(0), 128)
    h2::LwsVhostRoleH2 = LwsVhostRoleH2()
    _pad_h2::NTuple{4, UInt8} = ntuple(_ -> UInt8(0), 4)
    http::LwsVhostRoleHttp = LwsVhostRoleHttp()
    ws::LwsVhostRoleWs = LwsVhostRoleWs()
    lc::LwsLifecycle = LwsLifecycle()
    vh_being_destroyed_list::LwsDll2 = LwsDll2()
    socks_proxy_address::NTuple{128, UInt8} = ntuple(i -> UInt8(0), 128)
    socks_user::NTuple{96, UInt8} = ntuple(i -> UInt8(0), 96)
    socks_password::NTuple{96, UInt8} = ntuple(i -> UInt8(0), 96)
    tls_sessions::LwsDll2Owner = LwsDll2Owner()
    options::UInt64 = 0
    context::Ptr{Cvoid} = C_NULL
    vhost_next::Ptr{Cvoid} = C_NULL
    retry_policy::Ptr{Cvoid} = C_NULL
    ss_handle::Ptr{Cvoid} = C_NULL
    listen_wsi::LwsDll2Owner = LwsDll2Owner()
    name::Ptr{Cchar} = C_NULL
    iface::Ptr{Cchar} = C_NULL
    listen_accept_role::Ptr{Cchar} = C_NULL
    listen_accept_protocol::Ptr{Cchar} = C_NULL
    unix_socket_perms::Ptr{Cchar} = C_NULL
    finalize::Ptr{Cvoid} = C_NULL
    finalize_arg::Ptr{Cvoid} = C_NULL
    protocols::Ptr{LwsProtocols} = C_NULL
    protocol_vh_privs::Ptr{Ptr{Cvoid}} = C_NULL
    pvo::Ptr{Cvoid} = C_NULL
    headers::Ptr{Cvoid} = C_NULL
    same_vh_protocol_owner::Ptr{LwsDll2Owner} = C_NULL
    no_listener_vhost_list::Ptr{Cvoid} = C_NULL
    abstract_instances_owner::LwsDll2Owner = LwsDll2Owner()
    dll_cli_active_conns_owner::LwsDll2Owner = LwsDll2Owner()
    vh_awaiting_socket_owner::LwsDll2Owner = LwsDll2Owner()
    tls::LwsVhostTls = LwsVhostTls()
    user::Ptr{Cvoid} = C_NULL
    listen_port::Cint = 0
    bind_iface::Cint = 0
    socks_proxy_port::Cuint = 0
    count_protocols::Cint = 0
    ka_time::Cint = 0
    ka_probes::Cint = 0
    ka_interval::Cint = 0
    keepalive_timeout::Cint = 0
    timeout_secs_ah_idle::Cint = 0
    connect_timeout_secs::Cint = 0
    fo_listen_queue::Cint = 0
    count_bound_wsi::Cint = 0
    log_fd::Cint = 0
    tls_session_cache_max::UInt32 = 0
    protocol_init::UInt32 = 0
    flags::UInt8 = 0
    default_protocol_index::UInt8 = 0
    raw_protocol_index::UInt8 = 0
end

Base.@kwdef mutable struct LwsAcmeCertAgingArgs
    vh::Ptr{LwsVhost} = C_NULL
    element_overrides::NTuple{11, Ptr{Cchar}} = ntuple(_ -> Ptr{Cchar}(C_NULL), 11)
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

Base.@kwdef struct LwsExtension
    name::Ptr{Cchar} = C_NULL
    callback::Ptr{Cvoid} = C_NULL
    client_offer::Ptr{Cchar} = C_NULL
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
    token_limit::NTuple{97, Cushort} = ntuple(_ -> Cushort(0), 97)
end

Base.@kwdef struct LwsSystemOpts
    reboot::Ptr{Cvoid} = C_NULL
    set_clock::Ptr{Cvoid} = C_NULL
    attach::Ptr{Cvoid} = C_NULL
    captive_portal_detect_request::Ptr{Cvoid} = C_NULL
    metric_report::Ptr{Cvoid} = C_NULL
    jit_trust_query::Ptr{Cvoid} = C_NULL
    stdin_rx::Ptr{Cvoid} = C_NULL
    wake_latency_us::UInt32 = 0
end

Base.@kwdef mutable struct LwsRetryBo
    retry_ms_table::Ptr{UInt32} = C_NULL
    retry_ms_table_count::UInt16 = 0
    conceal_count::UInt16 = 0
    secs_since_valid_ping::UInt16 = 0
    secs_since_valid_hangup::UInt16 = 0
    jitter_percent::UInt8 = 0
end

Base.@kwdef struct LwsStateNotifyLink
    list::LwsDll2 = LwsDll2()
    notify_cb::Ptr{Cvoid} = C_NULL
    name::Ptr{Cchar} = C_NULL
end

Base.@kwdef struct LwsSortedUsecList
    list::LwsDll2 = LwsDll2()
    us::Int64 = 0
    cb::Ptr{Cvoid} = C_NULL
    latency_us::UInt32 = UInt32(0)
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
    http2_settings::NTuple{7, UInt32} = ntuple(i -> UInt32(0), 7)
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
    provided_client_ssl_ctx::Ptr{Cvoid} = C_NULL
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
    options::UInt64 = 0
    user::Ptr{Cvoid} = C_NULL
    count_threads::Cuint = 0
    fd_limit_per_thread::Cuint = 0
    vhost_name::Ptr{Cchar} = C_NULL
    external_baggage_free_on_destroy::Ptr{Cvoid} = C_NULL
    pt_serv_buf_size::Cuint = 0
    fops::Ptr{LwsPlatFileOps} = C_NULL
    socks_proxy_address::Ptr{Cchar} = C_NULL
    socks_proxy_port::Cuint = 0
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
    pss_policies_json::Ptr{Cchar} = C_NULL
    pss_plugins::Ptr{Ptr{LwsSsPlugin}} = Ptr{Ptr{LwsSsPlugin}}(C_NULL)
    ss_proxy_bind::Ptr{Cchar} = C_NULL
    ss_proxy_address::Ptr{Cchar} = C_NULL
    ss_proxy_port::Cushort = 0
    txp_ops_ssproxy::Ptr{LwsTransportProxyOps} = Ptr{LwsTransportProxyOps}(C_NULL)
    txp_ssproxy_info::Ptr{Cvoid} = C_NULL
    txp_ops_sspc::Ptr{LwsTransportClientOps} = Ptr{LwsTransportClientOps}(C_NULL)
    rlimit_nofile::Cint = 0
    early_smd_cb::Ptr{Cvoid} = C_NULL
    early_smd_opaque::Ptr{Cvoid} = C_NULL
    early_smd_class_filter::UInt32 = UInt32(0)
    smd_ttl_us::UInt64 = 0
    smd_queue_depth::Cushort = 0
    fo_listen_queue::Cint = 0
    event_lib_custom::Ptr{LwsPluginEvlib} = C_NULL
    log_cx::Ptr{LwsLogCx} = C_NULL
    http_nsc_filepath::Ptr{Cchar} = C_NULL
    http_nsc_heap_max_footprint::Csize_t = 0
    http_nsc_heap_max_items::Csize_t = 0
    http_nsc_heap_max_payload::Csize_t = 0
    default_loglevel::Cint = 0
    vh_listen_sockfd::Cint = 0
    wol_if::Ptr{Cchar} = C_NULL
    argc::Cint = 0
    argv::Ptr{Ptr{Cchar}} = C_NULL
    _unused::NTuple{2, Ptr{Cvoid}} = (C_NULL, C_NULL)
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
    local_port::Cint = 0
    local_protocol_name::Ptr{Cchar} = C_NULL
    alpn::Ptr{Cchar} = C_NULL
    opaque_user_data::Ptr{Cvoid} = C_NULL
    retry_and_idle_policy::Ptr{LwsRetryBo} = C_NULL
    manual_initial_tx_credit::Cint = 0
    sys_tls_client_cert::Cuchar = 0
    priority::Cuchar = 0
    mqtt_cp::Ptr{Cvoid} = C_NULL
    fi_wsi_name::Ptr{Cchar} = C_NULL
    keep_warm_secs::Cushort = 0
    log_cx::Ptr{LwsLogCx} = C_NULL
    auth_username::Ptr{Cchar} = C_NULL
    auth_password::Ptr{Cchar} = C_NULL
    _unused::NTuple{4, Ptr{Cvoid}} = (Ptr{Nothing}(C_NULL), Ptr{Nothing}(C_NULL), Ptr{Nothing}(C_NULL), Ptr{Nothing}(C_NULL))
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
    swallow::NTuple{16, Cchar} = ntuple(_ -> Cchar('\0'), 16)
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

Base.@kwdef struct _ns
    len::Cint = 0
    name::NTuple{64, Cchar} = ntuple(_ -> Cchar('\0'), 64)
end

Base.@kwdef mutable struct LwsTlsCertInfoResults
    data::NTuple{72, UInt8} = ntuple(_ -> UInt8(0), 72)
end

Base.@kwdef mutable struct LwsTlsSessionDump
    tag::NTuple{96, Cchar} = ntuple(_ -> Cchar(0), 96)
    blob::Ptr{Cvoid} = C_NULL
    opaque::Ptr{Cvoid} = C_NULL
    blob_len::Csize_t = 0
end

Base.@kwdef mutable struct LwsPollfd
    fd::Cint = 0
    events::Cshort = 0
    revents::Cshort = 0
end

const LWS_SYSBLOB_TYPE_COUNT = 11

Base.@kwdef struct LwsSystemBlob
    u_ptr::Ptr{Cvoid} = C_NULL
    u_len::Csize_t = 0
    is_direct::Cchar = 0
end

const PTHREAD_MUTEX_SIZE = 64

Base.@kwdef struct LwsSmd
    owner_messages::LwsDll2Owner = LwsDll2Owner()
    lock_messages::NTuple{PTHREAD_MUTEX_SIZE, UInt8} = ntuple(_ -> UInt8(0), PTHREAD_MUTEX_SIZE)
    owner_peers::LwsDll2Owner = LwsDll2Owner()
    lock_peers::NTuple{PTHREAD_MUTEX_SIZE, UInt8} = ntuple(_ -> UInt8(0), PTHREAD_MUTEX_SIZE)
    _class_filter::UInt32 = 0
    delivering::Cchar = 0
    _pad1::NTuple{3, UInt8} = ntuple(_ -> UInt8(0), 3)
    tid_holding::UInt64 = 0
end

Base.@kwdef struct LwsLifecycleGroup
    owner::LwsDll2Owner = LwsDll2Owner()
    ordinal::UInt64 = 0
    tag_prefix::Ptr{Cchar} = C_NULL
end

const LWSLCG_COUNT = 11

Base.@kwdef struct LwsContextTls
    alpn_discovered::NTuple{32, UInt8} = ntuple(_ -> UInt8(0), 32)
    alpn_default::Ptr{Cchar} = C_NULL
    last_cert_check_s::Clong = 0
    cc_owner::LwsDll2Owner = LwsDll2Owner()
    count_client_contexts::Cint = 0
end

Base.@kwdef struct LwsStateManager
    notify_list::LwsDll2Owner = LwsDll2Owner()
    context::Ptr{Cvoid} = C_NULL
    parent::Ptr{Cvoid} = C_NULL
    smd_class::UInt32 = 0
    state_names::Ptr{Ptr{Cchar}} = C_NULL
    name::Ptr{Cchar} = C_NULL
    state::Cint = 0
end

const LWS_CONTEXT_PER_THREAD_SIZE = 680

Base.@kwdef struct LwsPtTls
    dll_pending_tls_owner::LwsDll2Owner = LwsDll2Owner()
end

Base.@kwdef struct LwsPtRoleWs
    rx_draining_ext_list::Ptr{Cvoid} = C_NULL
    tx_draining_ext_list::Ptr{Cvoid} = C_NULL
end

Base.@kwdef struct LwsPtRoleHttp
    ah_list::Ptr{Cvoid} = C_NULL
    ah_wait_list::Ptr{Cvoid} = C_NULL
    ah_wait_list_length::Cint = 0
    ah_pool_length::UInt32 = 0
    ah_count_in_use::Cint = 0
    _pad::NTuple{4, UInt8} = ntuple(_ -> UInt8(0), 4)
end

const LWS_COUNT_PT_SUL_OWNERS = 2

Base.@kwdef struct LwsContextPerThread
    dll_buflist_owner::LwsDll2Owner = LwsDll2Owner()
    attach_owner::LwsDll2Owner = LwsDll2Owner()
    ss_owner::LwsDll2Owner = LwsDll2Owner()
    pt_sul_owner::NTuple{LWS_COUNT_PT_SUL_OWNERS, LwsDll2Owner} = ntuple(_ -> LwsDll2Owner(), LWS_COUNT_PT_SUL_OWNERS)
    pre_natal_wsi_owner::LwsDll2Owner = LwsDll2Owner()
    sul_ah_lifecheck::LwsSortedUsecList = LwsSortedUsecList()
    sul_tls::LwsSortedUsecList = LwsSortedUsecList()
    sul_plat::LwsSortedUsecList = LwsSortedUsecList()
    fake_wsi::Ptr{Cvoid} = C_NULL
    tls::LwsPtTls = LwsPtTls()
    context::Ptr{Cvoid} = C_NULL
    serv_buf::Ptr{Cuchar} = C_NULL
    fds::Ptr{Cvoid} = C_NULL
    foreign_pfd_list::Ptr{Cvoid} = C_NULL
    dummy_pipe_fds::NTuple{2, Cint} = (0, 0)
    pipe_wsi::Ptr{Cvoid} = C_NULL
    ws::LwsPtRoleWs = LwsPtRoleWs()
    http::LwsPtRoleHttp = LwsPtRoleHttp()
    evlib_pt::Ptr{Cvoid} = C_NULL
    count_conns::Culong = 0
    fds_count::Cuint = 0
    service_tid::Cint = 0
    service_tid_detected::Cint = 0
    count_event_loop_static_asset_handles::Cint = 0
    inside_poll::Cuchar = 0
    foreign_spinlock::Cuchar = 0
    tid::Cuchar = 0
    bitflags::Cuchar = 0
    _pad_end::NTuple{4, UInt8} = ntuple(_ -> UInt8(0), 4)
end

Base.@kwdef struct LwsContextView
    canonical_hostname::NTuple{96, UInt8} = ntuple(_ -> UInt8(0), 96)
    keylog_file::NTuple{96, UInt8} = ntuple(_ -> UInt8(0), 96)
    fops_platform::LwsPlatFileOps = LwsPlatFileOps()
    system_blobs::NTuple{LWS_SYSBLOB_TYPE_COUNT, LwsSystemBlob} = ntuple(_ -> LwsSystemBlob(), LWS_SYSBLOB_TYPE_COUNT)
    smd::LwsSmd = LwsSmd()
    ss_cpd::Ptr{Cvoid} = C_NULL
    sul_cpd_defer::LwsSortedUsecList = LwsSortedUsecList()
    fonts::LwsDll2Owner = LwsDll2Owner()
    dlo_file::LwsDll2Owner = LwsDll2Owner()
    active_assets::LwsDll2Owner = LwsDll2Owner()
    pt::LwsContextPerThread = LwsContextPerThread()
    default_retry::LwsRetryBo = LwsRetryBo()
    sul_system_state::LwsSortedUsecList = LwsSortedUsecList()
    lcg::NTuple{LWSLCG_COUNT, LwsLifecycleGroup} = ntuple(_ -> LwsLifecycleGroup(), LWSLCG_COUNT)
    protocols_copy::Ptr{Cvoid} = C_NULL
    extensions::Ptr{Cvoid} = C_NULL
    set::Http2Settings = Http2Settings()
    owner_vh_being_destroyed::LwsDll2Owner = LwsDll2Owner()
    mt_service::Ptr{Cvoid} = C_NULL
    metrics_policies::Ptr{Cvoid} = C_NULL
    metrics_prefix::Ptr{Cchar} = C_NULL
    mth_srv::Ptr{Cvoid} = C_NULL
    tls::LwsContextTls = LwsContextTls()
    l1::Ptr{Cvoid} = C_NULL
    nsc::Ptr{Cvoid} = C_NULL
    hss_fetch_policy::Ptr{Cvoid} = C_NULL
    server_der_list::Ptr{Cvoid} = C_NULL
    mgr_system::LwsStateManager = LwsStateManager()
    protocols_notify::LwsStateNotifyLink = LwsStateNotifyLink()
    vhost_list::Ptr{Cvoid} = C_NULL
    no_listener_vhost_list::Ptr{Cvoid} = C_NULL
    vhost_pending_destruction_list::Ptr{Cvoid} = C_NULL
    vhost_system::Ptr{Cvoid} = C_NULL
    server_string::Ptr{Cchar} = C_NULL
    event_loop_ops::Ptr{Cvoid} = C_NULL
    tls_ops::Ptr{Cvoid} = C_NULL
    lws_lookup::Ptr{Ptr{Cvoid}} = C_NULL
    wol_if::Ptr{Cchar} = C_NULL
    log_cx::Ptr{Cvoid} = C_NULL
    name::Ptr{Cchar} = C_NULL
    argc::Cint = 0
    argv::Ptr{Ptr{Cchar}} = C_NULL
    stdin_argc::Cint = 0
    stdin_argv::NTuple{16, Ptr{Cchar}} = ntuple(_ -> Ptr{Cchar}(C_NULL), 16)
    stdin_buflist::Ptr{Cvoid} = C_NULL
    stdin_linear::Ptr{Cchar} = C_NULL
    stdin_linear_size::Csize_t = 0
    stdin_flags::Cuint = 0
    fops::Ptr{Cvoid} = C_NULL
    pcontext_finalize::Ptr{Ptr{Cvoid}} = C_NULL
    username::Ptr{Cchar} = C_NULL
    groupname::Ptr{Cchar} = C_NULL
    system_ops::Ptr{Cvoid} = C_NULL
    pss_policies_json::Ptr{Cchar} = C_NULL
    ac_policy::Ptr{Cvoid} = C_NULL
    pol_args::Ptr{Cvoid} = C_NULL
    pss_policies::Ptr{Cvoid} = C_NULL
    pss_auths::Ptr{Cvoid} = C_NULL
    sinks::LwsDll2Owner = LwsDll2Owner()
    external_baggage_free_on_destroy::Ptr{Cvoid} = C_NULL
    token_limits::Ptr{Cvoid} = C_NULL
    user_space::Ptr{Cvoid} = C_NULL
    reject_service_keywords::Ptr{Cvoid} = C_NULL
    deprecation_cb::Ptr{Cvoid} = C_NULL
    eventlib_signal_cb::Ptr{Cvoid} = C_NULL
    time_up::Int64 = 0
    smd_ttl_us::Int64 = 0
    options::UInt64 = 0
    last_ws_ping_pong_check_s::Clong = 0
    last_policy::Clong = 0
    max_fds::Cuint = 0
    uid::Cuint = 0
    gid::Cuint = 0
    fd_random::Cint = 0
    count_cgi_spawned::Cint = 0
    fd_limit_per_thread::Cuint = 0
    timeout_secs::Cuint = 0
    pt_serv_buf_size::Cuint = 0
    max_http_header_data::Cuint = 0
    max_http_header_pool::Cuint = 0
    simultaneous_ssl_restriction::Cint = 0
    simultaneous_ssl::Cint = 0
    simultaneous_ssl_handshake_restriction::Cint = 0
    simultaneous_ssl_handshake::Cint = 0
    smd_queue_depth::UInt16 = 0
    tls_gate_accepts::Cchar = 0
    context_flags::Cuint = 0
    count_threads::UInt16 = 0
    undestroyed_threads::UInt16 = 0
    plugin_protocol_count::Int16 = 0
    plugin_extension_count::Int16 = 0
    server_string_len::Int16 = 0
    deprecation_pending_listen_close_count::UInt16 = 0
    us_wait_resolution::UInt16 = 0
    max_fi::UInt8 = 0
    captive_portal_detect::UInt8 = 0
    captive_portal_detect_type::UInt8 = 0
    destroy_state::UInt8 = 0
end
