using Printf

function _log(filter::Int, format::AbstractString, args...)
    log_str = Printf.format(Printf.Format(format), args...)
    return _lws_log(filter, log_str)
end

const LLL_ERR = 1 << 0
const LLL_WARN = 1 << 1
const LLL_NOTICE = 1 << 2
const LLL_INFO = 1 << 3
const LLL_DEBUG = 1 << 4
const LLL_PARSER = 1 << 5
const LLL_HEADER = 1 << 6
const LLL_EXT = 1 << 7
const LLL_CLIENT = 1 << 8
const LLL_LATENCY = 1 << 9
const LLL_USER = 1 << 10
const LLL_THREAD = 1 << 11
const LLL_COUNT = 12
const LLLF_SECRECY_PII = 1 << 16
const LLLF_SECRECY_BEARER = 1 << 17
const LLLF_LOG_TIMESTAMP = 1 << 18
const LLLF_LOG_CONTEXT_AWARE = 1 << 30
const AUTH_MODE_MASK = 0xf0000000

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