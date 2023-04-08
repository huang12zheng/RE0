namespace rs core.apiresp

struct ApiResp {
    1: required i32 statusCode,
    2: required map<string, string> header,
    3: required binary rawBody
}

service ApiRespService {
    void Write(1: ApiResp resp),
    void JSONUnmarshalBody(1: ApiResp resp, 2: Config config, 3: string val) throws (1: CodeError ce),
    string RequestId(1: ApiResp resp) throws (1: CodeError ce),
    string String(1: ApiResp resp) throws (1: CodeError ce),
    string FileNameByHeader(1: map<string, string> header) throws (1: CodeError ce)
}


struct CodeErrorDetail {
    1: optional string key,
    2: optional string value
}

struct CodeErrorPermissionViolation {
    1: optional string type,
    2: optional string subject,
    3: optional string description
}

struct CodeErrorFieldViolation {
    1: optional string field,
    2: optional string value,
    3: optional string description
}

struct CodeError {
    1: required i32 code,
    2: required string msg,
    3: optional struct {
        1: optional list<CodeErrorDetail> details,
        2: optional list<CodeErrorPermissionViolation> permission_violations,
        3: optional list<CodeErrorFieldViolation> field_violations
    } error
}

