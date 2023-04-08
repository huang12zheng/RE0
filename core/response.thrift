struct AppAccessTokenResp {
    1: required i64 expire,
    2: required string appAccessToken,
}

struct TenantAccessTokenResp {
    1: required BaseResponse baseResponse,
    2: required i64 expire,
    3: required string tenantAccessToken,
}

struct RawResponse {
    1: required i32 statusCode,
    2: required string contentType,
    3: required map<string, list<string>> headers,
    4: required binary body,
}

service IRawResponse {
    string getRequestID(),
    string getFileName(),
}

service IRawResponseX {
    string getHeaderFirstValue(1: string name),
}

struct BaseResponse {
    1: required RawResponse rawResponse,
    2: required binary request,
    3: required i32 code,
    4: required string msg,
    5: required Error error,
    6: required binary data,
}

# TODO: split
struct Error {
    1: required list<ErrorDetail> details,
    2: required list<ErrorPermissionViolation> permissionViolations,
    3: required list<ErrorFieldViolation> fieldViolations,
    4: required list<ErrorHelp> helps,
}

struct ErrorDetail {
    1: required string key,
    2: required string value,
}

struct ErrorFieldViolation {
    1: required string field,
    2: required string value,
    3: required string description,
}

struct ErrorHelp {
    1: required string url,
    2: required string description,
}

struct ErrorPermissionViolation {
    1: required string type,
    2: required string subject,
    2: required string description,
}

# TODO:body
struct Body {
    1: required BodyStatus code,
    2: required string msg,
    3: required Error error,
    4: required map<string, binary> data,
}

enum BodyStatus {
    ErrCodeOk,
    ErrCodeAppTicketInvalid,
    ErrCodeAccessTokenInvalid,
    ErrCodeAppAccessTokenInvalid,
    ErrCodeTenantAccessTokenInvalid,
    ErrCodeUserAccessTokenInvalid,
    ErrCodeUserRefreshTokenInvalid,
}

service IBody {
    bool retry(),
}

# EventResp
struct EventResp {
    1: required list<binary> body,
    2: required map<string, list<string>> headers,
    3: required i32 status_code,
}

service IEventResp {
    void setContentType(1: string contentType),
}