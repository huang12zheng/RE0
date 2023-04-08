namespace rs core.token

include "config.thrift"
include "constants.thrift"

# include "transport.thrift"
# include "config.thrift"
struct ResendAppTicketReq {
    1: required string app_id,
    2: required string app_secret,
}

# struct CodeError {
#   1: required i32 code,
#   2: optional string msg,
# }
# struct ResendAppTicketResp {
#   1: optional CodeError code_error,
# }
# service IAppTicketManager {
#   binary Get(1: config.Config config) throws (1: string ticket, 2: CodeError code_error),
#   void Set(1: string app_id, 2: string value, 3: i64 ttl) throws (1: CodeError code_error),
# }
# struct ResendAppTicketReq {
#     1: string appId;
#     2: string appSecret;
# }
service IAppTicketManager {
    void put(1: string appId, 2: string value, 3: i32 expire, 4: i32 timeUnit),
    string get(1: ResendAppTicketReq config) throws(1: Exception e),
}