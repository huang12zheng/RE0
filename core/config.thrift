include "cache.thrift"
include "enums.thrift"
include "httpclient.thrift"

struct Config {
    1: required i64 requestTimeout,
    2: required i64 timeOutTimeUnit,
    3: required string helpDeskID,
    4: required binary cache,
    5: required string baseUrl,
    6: required bool disableTokenCache,
    7: required enums.AppType appType,
    9: required string helpDeskToken,
    10: required string helpDeskAuthToken,
    11: required string tokenCache,
    12: required string appId,
    13: required string appSecret,
    14: required binary httpTransport,
    15: required bool logReqAtDebug,
}