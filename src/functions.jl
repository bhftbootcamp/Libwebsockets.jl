# functions.jl

export lws_add_http_common_headers,
    lws_add_http_header_by_name,
    lws_add_http_header_by_token,
    lws_add_http_header_content_length,
    lws_add_http_header_status,
    lws_adjust_protocol_psds,
    lws_callback_all_protocol,
    lws_callback_all_protocol_vhost,
    lws_callback_all_protocol_vhost_args,
    lws_callback_http_dummy,
    lws_callback_on_writable,
    lws_callback_on_writable_all_protocol,
    lws_callback_on_writable_all_protocol_vhost,
    lws_callback_vhost_protocols,
    lws_callback_vhost_protocols_vhost,
    lws_cancel_service,
    lws_cancel_service_pt,
    lws_chunked_html_process,
    lws_client_connect_via_info,
    lws_client_http_body_pending,
    lws_client_http_multipart,
    lws_close_reason,
    lws_context_deprecate,
    lws_context_destroy,
    lws_context_is_being_destroyed,
    lws_context_is_deprecated,
    lws_context_user,
    lws_create_context,
    lws_create_vhost,
    lws_ext_parse_options,
    lws_extension_callback_pm_deflate,
    lws_finalize_http_header,
    lws_finalize_startup,
    lws_finalize_write_http_header,
    lws_frame_is_binary,
    lws_get_context,
    lws_get_mimetype,
    lws_get_peer_write_allowance,
    lws_get_protocol,
    lws_get_reserved_bits,
    lws_get_socket_fd,
    lws_get_urlarg_by_name,
    lws_get_urlarg_by_name_safe,
    lws_get_vhost,
    lws_get_vhost_by_name,
    lws_get_vhost_iface,
    lws_get_vhost_name,
    lws_get_vhost_port,
    lws_get_vhost_user,
    lws_h2_client_stream_long_poll_rxonly,
    lws_h2_get_peer_txcredit_estimate,
    lws_h2_update_peer_txcredit,
    lws_handle_POLLOUT_event,
    lws_hdr_copy,
    lws_hdr_copy_fragment,
    lws_hdr_custom_copy,
    lws_hdr_custom_length,
    lws_hdr_custom_name_foreach,
    lws_hdr_fragment_length,
    lws_hdr_total_length,
    lws_http_basic_auth_gen,
    lws_http_check_retry_after,
    lws_http_client_http_response,
    lws_http_client_read,
    lws_http_compression_apply,
    lws_http_cookie_get,
    lws_http_date_parse_unix,
    lws_http_date_render_from_unix,
    lws_http_get_uri_and_method,
    lws_http_headers_detach,
    lws_http_is_redirected_to_get,
    lws_http_mark_sse,
    lws_http_redirect,
    lws_http_transaction_completed,
    lws_init_vhost_client_ssl,
    lws_is_be,
    lws_is_final_fragment,
    lws_is_first_fragment,
    lws_json_dump_context,
    lws_json_dump_vhost,
    lws_log_emit_cx_file,
    lws_log_prepend_context,
    lws_log_prepend_vhost,
    lws_log_prepend_wsi,
    lws_log_use_cx_file,
    lws_partial_buffered,
    lws_plugins_destroy,
    lws_plugins_init,
    lws_protocol_get,
    lws_protocol_init,
    lws_protocol_vh_priv_get,
    lws_protocol_vh_priv_zalloc,
    lws_pvo_get_str,
    lws_pvo_search,
    lws_raw_transaction_completed,
    lws_return_http_status,
    lws_send_pipe_choked,
    lws_serve_http_file,
    lws_serve_http_file_fragment,
    lws_service,
    lws_service_adjust_timeout,
    lws_service_fd,
    lws_service_fd_tsi,
    lws_service_tsi,
    lws_set_extension_option,
    lws_set_log_level,
    lws_set_proxy,
    lws_set_socks,
    lws_spa_create,
    lws_spa_create_via_info,
    lws_spa_destroy,
    lws_spa_finalize,
    lws_spa_get_length,
    lws_spa_get_string,
    lws_spa_process,
    lws_tls_acme_sni_cert_create,
    lws_tls_acme_sni_csr_create,
    lws_tls_cert_updated,
    lws_tls_client_vhost_extra_cert_mem,
    lws_tls_peer_cert_info,
    lws_tls_session_dump_load,
    lws_tls_session_dump_save,
    lws_tls_session_is_reused,
    lws_tls_vhost_cert_info,
    lws_token_to_string,
    lws_urldecode,
    lws_urlencode,
    lws_vh_tag,
    lws_vhd_find_by_pvo,
    lws_vhost_destroy,
    lws_vhost_name_to_protocol,
    lws_vhost_user,
    lws_write,
    lws_write_ws_flags,
    lws_wsi_tag,
    lws_wsi_tx_credit,
    lws_x509_create,
    lws_x509_destroy,
    lws_x509_info,
    lws_x509_parse_from_pem,
    lws_x509_verify,
    lwsl_context_get_cx,
    lwsl_emit_stderr,
    lwsl_emit_stderr_notimestamp,
    lwsl_emit_syslog,
    lwsl_hexdump,
    lwsl_hexdump_level,
    lwsl_hexdump_level_cx,
    lwsl_refcount_cx,
    lwsl_timestamp,
    lwsl_vhost_get_cx,
    lwsl_visible,
    lwsl_wsi_get_cx,
    lwsws_get_config_globals,
    lwsws_get_config_vhosts,
    lws_sul_schedule,
    lws_retry_sul_schedule,
    lws_retry_sul_schedule_retry_wsi,
    lws_remaining_packet_payload

function lwsl_context_get_cx(cx)
    ccall((:lwsl_context_get_cx, libwebsockets), Ptr{LwsLogCx}, (Ptr{LwsContext},), cx)
end

function lws_log_prepend_context(cx, obj, p, e)
    ccall((:lws_log_prepend_context, libwebsockets), Cvoid, (Ptr{LwsLogCx}, Ptr{Cvoid}, Ptr{Ptr{Cchar}}, Ptr{Cchar}), cx, obj, p, e)
end

function lwsl_vhost_get_cx(vh)
    ccall((:lwsl_vhost_get_cx, libwebsockets), Ptr{LwsLogCx}, (Ptr{LwsVhost},), vh)
end

function lws_log_prepend_vhost(cx, obj, p, e)
    ccall((:lws_log_prepend_vhost, libwebsockets), Cvoid, (Ptr{LwsLogCx}, Ptr{Cvoid}, Ptr{Ptr{Cchar}}, Ptr{Cchar}), cx, obj, p, e)
end

function lwsl_wsi_get_cx(wsi)
    ccall((:lwsl_wsi_get_cx, libwebsockets), Ptr{LwsLogCx}, (Ptr{Lws},), wsi)
end

function lws_log_prepend_wsi(cx, obj, p, e)
    ccall((:lws_log_prepend_wsi, libwebsockets), Cvoid, (Ptr{LwsLogCx}, Ptr{Cvoid}, Ptr{Ptr{Cchar}}, Ptr{Cchar}), cx, obj, p, e)
end

function _lws_log(filter, format, args...)
    ccall((:_lws_log, libwebsockets), Cvoid, (Cint, Ptr{Cchar}, Any...), filter, format, args...)
end

function lwsl_hexdump_level_cx(cx, prep, obj, hexdump_level, vbuf, len)
    ccall((:lwsl_hexdump_level_cx, libwebsockets), Cvoid, (Ptr{LwsLogCx}, Ptr{Cvoid}, Ptr{Cvoid}, Cint, Ptr{Cvoid}, Csize_t), cx, prep, obj, hexdump_level, vbuf, len)
end

function lwsl_hexdump_level(level, vbuf, len)
    ccall((:lwsl_hexdump_level, libwebsockets), Cvoid, (Cint, Ptr{Cvoid}, Csize_t), level, vbuf, len)
end

function lws_service_tsi(context, timeout_ms, tsi)
    ccall((:lws_service_tsi, libwebsockets), Cint, (Ptr{LwsContext}, Cint, Cint), context, timeout_ms, tsi)
end

function lws_write(wsi, buf, len, protocol)
    ccall((:lws_write, libwebsockets), Cint, (Ptr{Lws}, Ptr{Cuchar}, Csize_t, Cuint), wsi, buf, len, protocol)
end

function lwsl_timestamp(level, p, len)
    ccall((:lwsl_timestamp, libwebsockets), Cint, (Cint, Ptr{Cchar}, Csize_t), level, p, len)
end

function lws_log_emit_cx_file(cx, level, line, len)
    ccall((:lws_log_emit_cx_file, libwebsockets), Cvoid, (Ptr{LwsLogCx}, Cint, Ptr{Cchar}, Csize_t), cx, level, line, len)
end

function lws_log_use_cx_file(cx, _new)
    ccall((:lws_log_use_cx_file, libwebsockets), Cvoid, (Ptr{LwsLogCx}, Cint), cx, _new)
end

function lwsl_hexdump(buf, len)
    ccall((:lwsl_hexdump, libwebsockets), Cvoid, (Ptr{Cvoid}, Csize_t), buf, len)
end

function lws_is_be()
    ccall((:lws_is_be, libwebsockets), Cint, ())
end

function lws_set_log_level(level, log_emit_function)
    ccall((:lws_set_log_level, libwebsockets), Cvoid, (Cint, Ptr{Cvoid}), level, log_emit_function)
end

function lwsl_emit_syslog(level, line)
    ccall((:lwsl_emit_syslog, libwebsockets), Cvoid, (Cint, Ptr{Cchar}), level, line)
end

function lwsl_emit_stderr(level, line)
    ccall((:lwsl_emit_stderr, libwebsockets), Cvoid, (Cint, Ptr{Cchar}), level, line)
end

function lwsl_emit_stderr_notimestamp(level, line)
    ccall((:lwsl_emit_stderr_notimestamp, libwebsockets), Cvoid, (Cint, Ptr{Cchar}), level, line)
end

function lwsl_visible(level)
    ccall((:lwsl_visible, libwebsockets), Cint, (Cint,), level)
end

function lws_wsi_tag(wsi)
    ccall((:lws_wsi_tag, libwebsockets), Ptr{Cchar}, (Ptr{Lws},), wsi)
end

function lwsl_refcount_cx(cx, _new)
    ccall((:lwsl_refcount_cx, libwebsockets), Cvoid, (Ptr{LwsLogCx}, Cint), cx, _new)
end

function lws_close_reason(wsi, status, buf, len)
    ccall((:lws_close_reason, libwebsockets), Cvoid, (Ptr{Lws}, Cuint, Ptr{Cuchar}, Csize_t), wsi, status, buf, len)
end

function lws_send_pipe_choked(wsi)
    ccall((:lws_send_pipe_choked, libwebsockets), Cint, (Ptr{Lws},), wsi)
end

function lws_is_final_fragment(wsi)
    ccall((:lws_is_final_fragment, libwebsockets), Cint, (Ptr{Lws},), wsi)
end

function lws_is_first_fragment(wsi)
    ccall((:lws_is_first_fragment, libwebsockets), Cint, (Ptr{Lws},), wsi)
end

function lws_get_reserved_bits(wsi)
    ccall((:lws_get_reserved_bits, libwebsockets), Cuchar, (Ptr{Lws},), wsi)
end

function lws_partial_buffered(wsi)
    ccall((:lws_partial_buffered, libwebsockets), Cint, (Ptr{Lws},), wsi)
end

function lws_frame_is_binary(wsi)
    ccall((:lws_frame_is_binary, libwebsockets), Cint, (Ptr{Lws},), wsi)
end

function lws_set_extension_option(wsi, ext_name, opt_name, opt_val)
    ccall((:lws_set_extension_option, libwebsockets), Cint, (Ptr{Lws}, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}), wsi, ext_name, opt_name, opt_val)
end

function lws_ext_parse_options(ext, wsi, ext_user, opts, o, len)
    ccall((:lws_ext_parse_options, libwebsockets), Cint, (Ptr{LwsExtension}, Ptr{Lws}, Ptr{Cvoid}, Ptr{LwsExtOptions}, Ptr{Cchar}, Cint), ext, wsi, ext_user, opts, o, len)
end

function lws_extension_callback_pm_deflate(context, ext, wsi, reason, user, in, len)
    ccall((:lws_extension_callback_pm_deflate, libwebsockets), Cint, (Ptr{LwsContext}, Ptr{LwsExtension}, Ptr{Lws}, Cint, Ptr{Cvoid}, Ptr{Cvoid}, Csize_t), context, ext, wsi, reason, user, in, len)
end

function lws_vhost_name_to_protocol(vh, name)
    ccall((:lws_vhost_name_to_protocol, libwebsockets), Ptr{LwsProtocols}, (Ptr{LwsVhost}, Ptr{Cchar}), vh, name)
end

function lws_get_protocol(wsi)
    ccall((:lws_get_protocol, libwebsockets), Ptr{LwsProtocols}, (Ptr{Lws},), wsi)
end

function lws_protocol_get(wsi)
    ccall((:lws_protocol_get, libwebsockets), Ptr{LwsProtocols}, (Ptr{Lws},), wsi)
end

function lws_protocol_vh_priv_zalloc(vhost, prot, size)
    ccall((:lws_protocol_vh_priv_zalloc, libwebsockets), Ptr{Cvoid}, (Ptr{LwsVhost}, Ptr{LwsProtocols}, Cint), vhost, prot, size)
end

function lws_protocol_vh_priv_get(vhost, prot)
    ccall((:lws_protocol_vh_priv_get, libwebsockets), Ptr{Cvoid}, (Ptr{LwsVhost}, Ptr{LwsProtocols}), vhost, prot)
end

function lws_vhd_find_by_pvo(cx, protname, pvo_name, pvo_value)
    ccall((:lws_vhd_find_by_pvo, libwebsockets), Ptr{Cvoid}, (Ptr{LwsContext}, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}), cx, protname, pvo_name, pvo_value)
end

function lws_adjust_protocol_psds(wsi, new_size)
    ccall((:lws_adjust_protocol_psds, libwebsockets), Ptr{Cvoid}, (Ptr{Lws}, Csize_t), wsi, new_size)
end

function lws_finalize_startup(context)
    ccall((:lws_finalize_startup, libwebsockets), Cint, (Ptr{LwsContext},), context)
end

function lws_pvo_search(pvo, name)
    ccall((:lws_pvo_search, libwebsockets), Ptr{LwsProtocolVhostOptions}, (Ptr{LwsProtocolVhostOptions}, Ptr{Cchar}), pvo, name)
end

function lws_pvo_get_str(in, name, result)
    ccall((:lws_pvo_get_str, libwebsockets), Cint, (Ptr{Cvoid}, Ptr{Cchar}, Ptr{Ptr{Cchar}}), in, name, result)
end

function lws_protocol_init(context)
    ccall((:lws_protocol_init, libwebsockets), Cint, (Ptr{LwsContext},), context)
end

function lws_plugins_init(pplugin, d, _class, filter, each, each_user)
    ccall((:lws_plugins_init, libwebsockets), Cint, (Ptr{Ptr{LwsPlugin}}, Ptr{Ptr{Cchar}}, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cvoid}, Ptr{Cvoid}), pplugin, d, _class, filter, each, each_user)
end

function lws_plugins_destroy(pplugin, each, each_user)
    ccall((:lws_plugins_destroy, libwebsockets), Cint, (Ptr{Ptr{LwsPlugin}}, Ptr{Cvoid}, Ptr{Cvoid}), pplugin, each, each_user)
end

function lws_create_context(info)
    ccall((:lws_create_context, libwebsockets), Ptr{LwsContext}, (Ptr{LwsContextCreationInfo},), info)
end

function lws_context_destroy(context)
    ccall((:lws_context_destroy, libwebsockets), Cvoid, (Ptr{LwsContext},), context)
end

function lws_context_deprecate(context, cb)
    ccall((:lws_context_deprecate, libwebsockets), Cvoid, (Ptr{LwsContext}, Ptr{Cvoid}), context, cb)
end

function lws_context_is_deprecated(context)
    ccall((:lws_context_is_deprecated, libwebsockets), Cint, (Ptr{LwsContext},), context)
end

function lws_set_proxy(vhost, proxy)
    ccall((:lws_set_proxy, libwebsockets), Cint, (Ptr{LwsVhost}, Ptr{Cchar}), vhost, proxy)
end

function lws_set_socks(vhost, socks)
    ccall((:lws_set_socks, libwebsockets), Cint, (Ptr{LwsVhost}, Ptr{Cchar}), vhost, socks)
end

function lws_create_vhost(context, info)
    ccall((:lws_create_vhost, libwebsockets), Ptr{LwsVhost}, (Ptr{LwsContext}, Ptr{LwsContextCreationInfo}), context, info)
end

function lws_vhost_destroy(vh)
    ccall((:lws_vhost_destroy, libwebsockets), Cvoid, (Ptr{LwsVhost},), vh)
end

function lwsws_get_config_globals(info, d, config_strings, len)
    ccall((:lwsws_get_config_globals, libwebsockets), Cint, (Ptr{LwsContextCreationInfo}, Ptr{Cchar}, Ptr{Ptr{Cchar}}, Ptr{Cint}), info, d, config_strings, len)
end

function lwsws_get_config_vhosts(context, info, d, config_strings, len)
    ccall((:lwsws_get_config_vhosts, libwebsockets), Cint, (Ptr{LwsContext}, Ptr{LwsContextCreationInfo}, Ptr{Cchar}, Ptr{Ptr{Cchar}}, Ptr{Cint}), context, info, d, config_strings, len)
end

function lws_get_context(wsi)
    ccall((:lws_get_context, libwebsockets), Ptr{LwsContext}, (Ptr{Lws},), wsi)
end

function lws_get_vhost(wsi)
    ccall((:lws_get_vhost, libwebsockets), Ptr{LwsVhost}, (Ptr{Lws},), wsi)
end

function lws_get_vhost_name(vhost)
    ccall((:lws_get_vhost_name, libwebsockets), Ptr{Cchar}, (Ptr{LwsVhost},), vhost)
end

function lws_get_vhost_by_name(context, name)
    ccall((:lws_get_vhost_by_name, libwebsockets), Ptr{LwsVhost}, (Ptr{LwsContext}, Ptr{Cchar}), context, name)
end

function lws_get_vhost_port(vhost)
    ccall((:lws_get_vhost_port, libwebsockets), Cint, (Ptr{LwsVhost},), vhost)
end

function lws_get_vhost_user(vhost)
    ccall((:lws_get_vhost_user, libwebsockets), Ptr{Cvoid}, (Ptr{LwsVhost},), vhost)
end

function lws_get_vhost_iface(vhost)
    ccall((:lws_get_vhost_iface, libwebsockets), Ptr{Cchar}, (Ptr{LwsVhost},), vhost)
end

function lws_json_dump_vhost(vh, buf, len)
    ccall((:lws_json_dump_vhost, libwebsockets), Cint, (Ptr{LwsVhost}, Ptr{Cchar}, Cint), vh, buf, len)
end

function lws_json_dump_context(context, buf, len, hide_vhosts)
    ccall((:lws_json_dump_context, libwebsockets), Cint, (Ptr{LwsContext}, Ptr{Cchar}, Cint, Cint), context, buf, len, hide_vhosts)
end

function lws_vhost_user(vhost)
    ccall((:lws_vhost_user, libwebsockets), Ptr{Cvoid}, (Ptr{LwsVhost},), vhost)
end

function lws_context_user(context)
    ccall((:lws_context_user, libwebsockets), Ptr{Cvoid}, (Ptr{LwsContext},), context)
end

function lws_vh_tag(vh)
    ccall((:lws_vh_tag, libwebsockets), Ptr{Cchar}, (Ptr{LwsVhost},), vh)
end

function lws_context_is_being_destroyed(context)
    ccall((:lws_context_is_being_destroyed, libwebsockets), Cint, (Ptr{LwsContext},), context)
end

function lws_client_connect_via_info(ccinfo)
    ccall((:lws_client_connect_via_info, libwebsockets), Ptr{Lws}, (Ptr{LwsClientConnectInfo},), ccinfo)
end

function lws_init_vhost_client_ssl(info, vhost)
    ccall((:lws_init_vhost_client_ssl, libwebsockets), Cint, (Ptr{LwsContextCreationInfo}, Ptr{LwsVhost}), info, vhost)
end

function lws_http_client_read(wsi, buf, len)
    ccall((:lws_http_client_read, libwebsockets), Cint, (Ptr{Lws}, Ptr{Ptr{Cchar}}, Ptr{Cint}), wsi, buf, len)
end

function lws_http_client_http_response(wsi)
    ccall((:lws_http_client_http_response, libwebsockets), Cuint, (Ptr{Lws},), wsi)
end

function lws_tls_client_vhost_extra_cert_mem(vh, der, der_len)
    ccall((:lws_tls_client_vhost_extra_cert_mem, libwebsockets), Cint, (Ptr{LwsVhost}, Ptr{UInt8}, Csize_t), vh, der, der_len)
end

function lws_client_http_body_pending(wsi, something_left_to_send)
    ccall((:lws_client_http_body_pending, libwebsockets), Cvoid, (Ptr{Lws}, Cint), wsi, something_left_to_send)
end

function lws_client_http_multipart(wsi, name, filename, content_type, p, _end)
    ccall((:lws_client_http_multipart, libwebsockets), Cint, (Ptr{Lws}, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, Ptr{Ptr{Cchar}}, Ptr{Cchar}), wsi, name, filename, content_type, p, _end)
end

function lws_http_basic_auth_gen(user, pw, buf, len)
    ccall((:lws_http_basic_auth_gen, libwebsockets), Cint, (Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, Csize_t), user, pw, buf, len)
end

function lws_tls_session_is_reused(wsi)
    ccall((:lws_tls_session_is_reused, libwebsockets), Cint, (Ptr{Lws},), wsi)
end

function lws_get_mimetype(file, m)
    ccall((:lws_get_mimetype, libwebsockets), Ptr{Cchar}, (Ptr{Cchar}, Ptr{LwsHttpMount}), file, m)
end

function lws_serve_http_file(wsi, file, content_type, other_headers, other_headers_len)
    ccall((:lws_serve_http_file, libwebsockets), Cint, (Ptr{Lws}, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, Cint), wsi, file, content_type, other_headers, other_headers_len)
end

function lws_serve_http_file_fragment(wsi)
    ccall((:lws_serve_http_file_fragment, libwebsockets), Cint, (Ptr{Lws},), wsi)
end

function lws_chunked_html_process(args, s)
    ccall((:lws_chunked_html_process, libwebsockets), Cint, (Ptr{LwsProcessHtmlArgs}, Ptr{LwsProcessHtmlState}), args, s)
end

function lws_token_to_string(token)
    ccall((:lws_token_to_string, libwebsockets), Ptr{Cuchar}, (Cuint,), token)
end

function lws_hdr_total_length(wsi, h)
    ccall((:lws_hdr_total_length, libwebsockets), Cint, (Ptr{Lws}, Cuint), wsi, h)
end

function lws_hdr_fragment_length(wsi, h, frag_idx)
    ccall((:lws_hdr_fragment_length, libwebsockets), Cint, (Ptr{Lws}, Cuint, Cint), wsi, h, frag_idx)
end

function lws_hdr_copy(wsi, dest, len, h)
    ccall((:lws_hdr_copy, libwebsockets), Cint, (Ptr{Lws}, Ptr{Cchar}, Cint, Cuint), wsi, dest, len, h)
end

function lws_hdr_copy_fragment(wsi, dest, len, h, frag_idx)
    ccall((:lws_hdr_copy_fragment, libwebsockets), Cint, (Ptr{Lws}, Ptr{Cchar}, Cint, Cuint, Cint), wsi, dest, len, h, frag_idx)
end

function lws_hdr_custom_length(wsi, name, nlen)
    ccall((:lws_hdr_custom_length, libwebsockets), Cint, (Ptr{Lws}, Ptr{Cchar}, Cint), wsi, name, nlen)
end

function lws_hdr_custom_copy(wsi, dst, len, name, nlen)
    ccall((:lws_hdr_custom_copy, libwebsockets), Cint, (Ptr{Lws}, Ptr{Cchar}, Cint, Ptr{Cchar}, Cint), wsi, dst, len, name, nlen)
end

function lws_hdr_custom_name_foreach(wsi, cb, opaque)
    ccall((:lws_hdr_custom_name_foreach, libwebsockets), Cint, (Ptr{Lws}, Ptr{Cvoid}, Ptr{Cvoid}), wsi, cb, opaque)
end

function lws_get_urlarg_by_name_safe(wsi, name, buf, len)
    ccall((:lws_get_urlarg_by_name_safe, libwebsockets), Cint, (Ptr{Lws}, Ptr{Cchar}, Ptr{Cchar}, Cint), wsi, name, buf, len)
end

function lws_get_urlarg_by_name(wsi, name, buf, len)
    ccall((:lws_get_urlarg_by_name, libwebsockets), Ptr{Cchar}, (Ptr{Lws}, Ptr{Cchar}, Ptr{Cchar}, Cint), wsi, name, buf, len)
end

function lws_add_http_header_status(wsi, code, p, _end)
    ccall((:lws_add_http_header_status, libwebsockets), Cint, (Ptr{Lws}, Cuint, Ptr{Ptr{Cuchar}}, Ptr{Cuchar}), wsi, code, p, _end)
end

function lws_add_http_header_by_name(wsi, name, value, length, p, _end)
    ccall((:lws_add_http_header_by_name, libwebsockets), Cint, (Ptr{Lws}, Ptr{Cuchar}, Ptr{Cuchar}, Cint, Ptr{Ptr{Cuchar}}, Ptr{Cuchar}), wsi, name, value, length, p, _end)
end

function lws_add_http_header_by_token(wsi, token, value, length, p, _end)
    ccall((:lws_add_http_header_by_token, libwebsockets), Cint, (Ptr{Lws}, Cuint, Ptr{Cuchar}, Cint, Ptr{Ptr{Cuchar}}, Ptr{Cuchar}), wsi, token, value, length, p, _end)
end

function lws_add_http_header_content_length(wsi, content_length, p, _end)
    ccall((:lws_add_http_header_content_length, libwebsockets), Cint, (Ptr{Lws}, Culonglong, Ptr{Ptr{Cuchar}}, Ptr{Cuchar}), wsi, content_length, p, _end)
end

function lws_finalize_http_header(wsi, p, _end)
    ccall((:lws_finalize_http_header, libwebsockets), Cint, (Ptr{Lws}, Ptr{Ptr{Cuchar}}, Ptr{Cuchar}), wsi, p, _end)
end

function lws_finalize_write_http_header(wsi, start, p, _end)
    ccall((:lws_finalize_write_http_header, libwebsockets), Cint, (Ptr{Lws}, Ptr{Cuchar}, Ptr{Ptr{Cuchar}}, Ptr{Cuchar}), wsi, start, p, _end)
end

function lws_add_http_common_headers(wsi, code, content_type, content_len, p, _end)
    ccall((:lws_add_http_common_headers, libwebsockets), Cint, (Ptr{Lws}, Cuint, Ptr{Cchar}, Culonglong, Ptr{Ptr{Cuchar}}, Ptr{Cuchar}), wsi, code, content_type, content_len, p, _end)
end

function lws_http_get_uri_and_method(wsi, puri_ptr, puri_len)
    ccall((:lws_http_get_uri_and_method, libwebsockets), Cint, (Ptr{Lws}, Ptr{Ptr{Cchar}}, Ptr{Cint}), wsi, puri_ptr, puri_len)
end

function lws_urlencode(escaped, string, len)
    ccall((:lws_urlencode, libwebsockets), Ptr{Cchar}, (Ptr{Cchar}, Ptr{Cchar}, Cint), escaped, string, len)
end

function lws_urldecode(string, escaped, len)
    ccall((:lws_urldecode, libwebsockets), Cint, (Ptr{Cchar}, Ptr{Cchar}, Cint), string, escaped, len)
end

function lws_http_date_render_from_unix(buf, len, t)
    ccall((:lws_http_date_render_from_unix, libwebsockets), Cint, (Ptr{Cchar}, Csize_t, Ptr{Clong}), buf, len, t)
end

function lws_http_date_parse_unix(b, len, t)
    ccall((:lws_http_date_parse_unix, libwebsockets), Cint, (Ptr{Cchar}, Csize_t, Ptr{Clong}), b, len, t)
end

function lws_http_check_retry_after(wsi, us_interval_in_out)
    ccall((:lws_http_check_retry_after, libwebsockets), Cint, (Ptr{Lws}, Ptr{Cintmax_t}), wsi, us_interval_in_out)
end

function lws_return_http_status(wsi, code, html_body)
    ccall((:lws_return_http_status, libwebsockets), Cint, (Ptr{Lws}, Cuint, Ptr{Cchar}), wsi, code, html_body)
end

function lws_http_redirect(wsi, code, loc, len, p, _end)
    ccall((:lws_http_redirect, libwebsockets), Cint, (Ptr{Lws}, Cint, Ptr{Cuchar}, Cint, Ptr{Ptr{Cuchar}}, Ptr{Cuchar}), wsi, code, loc, len, p, _end)
end

function lws_http_transaction_completed(wsi)
    ccall((:lws_http_transaction_completed, libwebsockets), Cint, (Ptr{Lws},), wsi)
end

function lws_http_headers_detach(wsi)
    ccall((:lws_http_headers_detach, libwebsockets), Cint, (Ptr{Lws},), wsi)
end

function lws_http_mark_sse(wsi)
    ccall((:lws_http_mark_sse, libwebsockets), Cint, (Ptr{Lws},), wsi)
end

function lws_h2_client_stream_long_poll_rxonly(wsi)
    ccall((:lws_h2_client_stream_long_poll_rxonly, libwebsockets), Cint, (Ptr{Lws},), wsi)
end

function lws_http_compression_apply(wsi, name, p, _end, decomp)
    ccall((:lws_http_compression_apply, libwebsockets), Cint, (Ptr{Lws}, Ptr{Cchar}, Ptr{Ptr{Cuchar}}, Ptr{Cuchar}, Cchar), wsi, name, p, _end, decomp)
end

function lws_http_is_redirected_to_get(wsi)
    ccall((:lws_http_is_redirected_to_get, libwebsockets), Cint, (Ptr{Lws},), wsi)
end

function lws_http_cookie_get(wsi, name, buf, max)
    ccall((:lws_http_cookie_get, libwebsockets), Cint, (Ptr{Lws}, Ptr{Cchar}, Ptr{Cchar}, Ptr{Csize_t}), wsi, name, buf, max)
end

function lws_h2_update_peer_txcredit(wsi, sid, bump)
    ccall((:lws_h2_update_peer_txcredit, libwebsockets), Cint, (Ptr{Lws}, Cuint, Cint), wsi, sid, bump)
end

function lws_h2_get_peer_txcredit_estimate(wsi)
    ccall((:lws_h2_get_peer_txcredit_estimate, libwebsockets), Cint, (Ptr{Lws},), wsi)
end

function lws_spa_create(wsi, param_names, count_params, max_storage, opt_cb, opt_data)
    ccall((:lws_spa_create, libwebsockets), Ptr{LwsSpa}, (Ptr{Lws}, Ptr{Ptr{Cchar}}, Cint, Cint, Ptr{Cvoid}, Ptr{Cvoid}), wsi, param_names, count_params, max_storage, opt_cb, opt_data)
end

function lws_spa_create_via_info(wsi, info)
    ccall((:lws_spa_create_via_info, libwebsockets), Ptr{LwsSpa}, (Ptr{Lws}, Ptr{LwsSpaCreateInfo}), wsi, info)
end

function lws_spa_process(spa, in, len)
    ccall((:lws_spa_process, libwebsockets), Cint, (Ptr{LwsSpa}, Ptr{Cchar}, Cint), spa, in, len)
end

function lws_spa_finalize(spa)
    ccall((:lws_spa_finalize, libwebsockets), Cint, (Ptr{LwsSpa},), spa)
end

function lws_spa_get_length(spa, n)
    ccall((:lws_spa_get_length, libwebsockets), Cint, (Ptr{LwsSpa}, Cint), spa, n)
end

function lws_spa_get_string(spa, n)
    ccall((:lws_spa_get_string, libwebsockets), Ptr{Cchar}, (Ptr{LwsSpa}, Cint), spa, n)
end

function lws_spa_destroy(spa)
    ccall((:lws_spa_destroy, libwebsockets), Cint, (Ptr{LwsSpa},), spa)
end

function lws_service(context, timeout_ms)
    ccall((:lws_service, libwebsockets), Cint, (Ptr{LwsContext}, Cint), context, timeout_ms)
end

function lws_cancel_service_pt(wsi)
    ccall((:lws_cancel_service_pt, libwebsockets), Cvoid, (Ptr{Lws},), wsi)
end

function lws_cancel_service(context)
    ccall((:lws_cancel_service, libwebsockets), Cvoid, (Ptr{LwsContext},), context)
end

function lws_service_fd(context, pollfd)
    ccall((:lws_service_fd, libwebsockets), Cint, (Ptr{LwsContext}, Ptr{Cvoid}), context, pollfd)
end

function lws_service_fd_tsi(context, pollfd, tsi)
    ccall((:lws_service_fd_tsi, libwebsockets), Cint, (Ptr{LwsContext}, Ptr{Cvoid}, Cint), context, pollfd, tsi)
end

function lws_service_adjust_timeout(context, timeout_ms, tsi)
    ccall((:lws_service_adjust_timeout, libwebsockets), Cint, (Ptr{LwsContext}, Cint, Cint), context, timeout_ms, tsi)
end

function lws_handle_POLLOUT_event(wsi, pollfd)
    ccall((:lws_handle_POLLOUT_event, libwebsockets), Cint, (Ptr{Lws}, Ptr{Cvoid}), wsi, pollfd)
end

function lws_write_ws_flags(initial, is_start, is_end)
    ccall((:lws_write_ws_flags, libwebsockets), Cint, (Cint, Cint, Cint), initial, is_start, is_end)
end

function lws_raw_transaction_completed(wsi)
    ccall((:lws_raw_transaction_completed, libwebsockets), Cint, (Ptr{Lws},), wsi)
end

function lws_callback_on_writable(wsi)
    ccall((:lws_callback_on_writable, libwebsockets), Cint, (Ptr{Lws},), wsi)
end

function lws_callback_on_writable_all_protocol(context, protocol)
    ccall((:lws_callback_on_writable_all_protocol, libwebsockets), Cint, (Ptr{LwsContext}, Ptr{LwsProtocols}), context, protocol)
end

function lws_callback_on_writable_all_protocol_vhost(vhost, protocol)
    ccall((:lws_callback_on_writable_all_protocol_vhost, libwebsockets), Cint, (Ptr{LwsVhost}, Ptr{LwsProtocols}), vhost, protocol)
end

function lws_callback_all_protocol(context, protocol, reason)
    ccall((:lws_callback_all_protocol, libwebsockets), Cint, (Ptr{LwsContext}, Ptr{LwsProtocols}, Cint), context, protocol, reason)
end

function lws_callback_all_protocol_vhost(vh, protocol, reason)
    ccall((:lws_callback_all_protocol_vhost, libwebsockets), Cint, (Ptr{LwsVhost}, Ptr{LwsProtocols}, Cint), vh, protocol, reason)
end

function lws_callback_all_protocol_vhost_args(vh, protocol, reason, argp, len)
    ccall((:lws_callback_all_protocol_vhost_args, libwebsockets), Cint, (Ptr{LwsVhost}, Ptr{LwsProtocols}, Cint, Ptr{Cvoid}, Csize_t), vh, protocol, reason, argp, len)
end

function lws_callback_vhost_protocols(wsi, reason, in, len)
    ccall((:lws_callback_vhost_protocols, libwebsockets), Cint, (Ptr{Lws}, Cint, Ptr{Cvoid}, Csize_t), wsi, reason, in, len)
end

function lws_callback_vhost_protocols_vhost(vh, reason, in, len)
    ccall((:lws_callback_vhost_protocols_vhost, libwebsockets), Cint, (Ptr{LwsVhost}, Cint, Ptr{Cvoid}, Csize_t), vh, reason, in, len)
end

function lws_callback_http_dummy(wsi, reason, user, in, len)
    ccall((:lws_callback_http_dummy, libwebsockets), Cint, (Ptr{Lws}, Cuint, Ptr{Cvoid}, Ptr{Cvoid}, Csize_t), wsi, reason, user, in, len)
end

function lws_get_socket_fd(wsi)
    ccall((:lws_get_socket_fd, libwebsockets), Cint, (Ptr{Lws},), wsi)
end

function lws_get_peer_write_allowance(wsi)
    ccall((:lws_get_peer_write_allowance, libwebsockets), Clonglong, (Ptr{Lws},), wsi)
end

function lws_wsi_tx_credit(wsi, peer_to_us, add)
    ccall((:lws_wsi_tx_credit, libwebsockets), Cint, (Ptr{Lws}, Cchar, Cint), wsi, peer_to_us, add)
end

function lws_x509_create(x509)
    ccall((:lws_x509_create, libwebsockets), Cint, (Ptr{Ptr{LwsX509Cert}},), x509)
end

function lws_x509_parse_from_pem(x509, pem, len)
    ccall((:lws_x509_parse_from_pem, libwebsockets), Cint, (Ptr{LwsX509Cert}, Ptr{Cvoid}, Csize_t), x509, pem, len)
end

function lws_x509_verify(x509, trusted, common_name)
    ccall((:lws_x509_verify, libwebsockets), Cint, (Ptr{LwsX509Cert}, Ptr{LwsX509Cert}, Ptr{Cchar}), x509, trusted, common_name)
end

function lws_x509_destroy(x509)
    ccall((:lws_x509_destroy, libwebsockets), Cvoid, (Ptr{Ptr{LwsX509Cert}},), x509)
end

function lws_x509_info(x509, type, buf, len)
    ccall((:lws_x509_info, libwebsockets), Cint, (Ptr{LwsX509Cert}, Cuint, Ptr{LwsTlsCertInfoResults}, Csize_t), x509, type, buf, len)
end

function lws_tls_peer_cert_info(wsi, type, buf, len)
    ccall((:lws_tls_peer_cert_info, libwebsockets), Cint, (Ptr{Lws}, Cuint, Ptr{LwsTlsCertInfoResults}, Csize_t), wsi, type, buf, len)
end

function lws_tls_vhost_cert_info(vhost, type, buf, len)
    ccall((:lws_tls_vhost_cert_info, libwebsockets), Cint, (Ptr{LwsVhost}, Cuint, Ptr{LwsTlsCertInfoResults}, Csize_t), vhost, type, buf, len)
end

function lws_tls_acme_sni_cert_create(vhost, san_a, san_b)
    ccall((:lws_tls_acme_sni_cert_create, libwebsockets), Cint, (Ptr{LwsVhost}, Ptr{Cchar}, Ptr{Cchar}), vhost, san_a, san_b)
end

function lws_tls_acme_sni_csr_create(context, elements, csr, csr_len, privkey_pem, privkey_len)
    ccall((:lws_tls_acme_sni_csr_create, libwebsockets), Cint, (Ptr{LwsContext}, Ptr{Ptr{Cchar}}, Ptr{UInt8}, Csize_t, Ptr{Ptr{Cchar}}, Ptr{Csize_t}), context, elements, csr, csr_len, privkey_pem, privkey_len)
end

function lws_tls_cert_updated(context, certpath, keypath, mem_cert, len_mem_cert, mem_privkey, len_mem_privkey)
    ccall((:lws_tls_cert_updated, libwebsockets), Cint, (Ptr{LwsContext}, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, Csize_t, Ptr{Cchar}, Csize_t), context, certpath, keypath, mem_cert, len_mem_cert, mem_privkey, len_mem_privkey)
end

function lws_tls_session_dump_save(vh, host, port, cb_save, opq)
    ccall((:lws_tls_session_dump_save, libwebsockets), Cint, (Ptr{LwsVhost}, Ptr{Cchar}, UInt16, Ptr{Cvoid}, Ptr{Cvoid}), vh, host, port, cb_save, opq)
end

function lws_tls_session_dump_load(vh, host, port, cb_load, opq)
    ccall((:lws_tls_session_dump_load, libwebsockets), Cint, (Ptr{LwsVhost}, Ptr{Cchar}, UInt16, Ptr{Cvoid}, Ptr{Cvoid}), vh, host, port, cb_load, opq)
end

function lws_sul_schedule(ctx, tsi, sul, _cb, _us)
    ccall((:lws_sul_schedule, libwebsockets), Cvoid, (Ptr{LwsContext}, Cint, Ptr{LwsSortedUsecList}, Ptr{Cvoid}, Cint), ctx, tsi, sul, _cb, _us)
end

function lws_retry_sul_schedule(context, tid, sul, retry, cb, ctry)
    ccall((:lws_retry_sul_schedule, libwebsockets), Cint, (Ptr{LwsContext}, Cint, Ptr{LwsSortedUsecList}, Ptr{LwsRetryBo}, Ptr{Cvoid}, Ptr{Cushort}), context, tid, sul, retry, cb, ctry)
end

function lws_retry_sul_schedule_retry_wsi(wsi, sul, cb, ctry)
    ccall((:lws_retry_sul_schedule_retry_wsi, libwebsockets), Cint, (Ptr{Lws}, Ptr{LwsSortedUsecList}, Ptr{Cvoid}, Ptr{Cushort}), wsi, sul, cb, ctry)
end

function lws_remaining_packet_payload(wsi)
    ccall((:lws_remaining_packet_payload, libwebsockets), Csize_t, (Ptr{Lws},), wsi)
end

function lws_rx_flow_control(wsi, enable)
    ccall((:lws_rx_flow_control, libwebsockets), Cint, (Ptr{Lws}, Cchar), wsi, enable)
end

function lws_retry_get_delay_ms(context, retry, ctry, conceal)
    ccall((:lws_retry_get_delay_ms, libwebsockets), Cuint, (Ptr{LwsContext}, Ptr{LwsRetryBo}, Ptr{UInt16}, Ptr{Int8}), context, retry, ctry, conceal)
end

function lws_set_timer_usecs(wsi, usecs)
    ccall((:lws_rx_flow_control, libwebsockets), Cvoid, (Ptr{Lws}, Clong), wsi, usecs)
end
