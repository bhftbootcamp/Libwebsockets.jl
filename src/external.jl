using Printf

export lwsl_notice,
        lwsl_warn,
        lwsl_info,
        lwsl_debug,
        lwsl_parser,
        lwsl_header,
        lwsl_ext,
        lwsl_client,
        lwsl_latency,
        lwsl_thread,
        lwsl_user

function _log(filter::Int, format::AbstractString, args...)
    log_str = Printf.format(Printf.Format(format), args...)
    _lws_log(filter, log_str)
end

lwsl_notice(args...) = _log(LLL_ERR, args...)
lwsl_warn(args...) = _log(LLL_NOTICE, args...)
lwsl_info(args...) = _log(LLL_INFO, args...)
lwsl_debug(args...) = _log(LLL_DEBUG, args...)
lwsl_parser(args...) = _log(LLL_PARSER, args...)
lwsl_header(args...) = _log(LLL_HEADER, args...)
lwsl_ext(args...) = _log(LLL_EXT, args...)
lwsl_client(args...) = _log(LLL_CLIENT, args...)
lwsl_latency(args...) = _log(LLL_LATENCY, args...)
lwsl_thread(args...) = _log(LLL_THREAD, args...)
lwsl_user(args...) = _log(LLL_USER, args...)