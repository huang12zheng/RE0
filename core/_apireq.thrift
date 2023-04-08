namespace rs core

typedef list<string> Values

struct ApiReq {
    1: string HttpMethod,
    2: string ApiPath,
    3: binary Body,
    4: map<string, string> PathParams,
    5: map<string, Values> QueryParams,
    6: list<string> SupportedAccessTokenTypes
}

# service ApiReqService {
#     string GetPathParamsValue(1: string key),
#     void SetPathParamsValue(1: string key, 2: string value),
#     string GetQueryParamsValue(1: string key),
#     void SetQueryParamsValue(1: string key, 2: string value),
#     string EncodeQueryParams(),
#     void AddQueryParamsValue(1: string key, 2: string value)
# }
