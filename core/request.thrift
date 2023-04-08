include "config.thrift"
include "exception.thrift"
include "token.thrift"

struct EventReq {
    1: required binary body,
    2: required string httpPath,
    3: required map<string, list<string>> headers,
}

service IEventReq {
    string getHeaderFirstValue(1: string name)
    string getRequestID()
}

struct FormDataFile {
    1: required string fieldName,
    2: required string fileName,
    3: required binary type,
    4: required binary filePath,
    5: required binary file,
}

struct FormData {
    1: required map<string, string> params,
    2: required list<FormDataFile> files,
}

service FormDataService {
    void addFileByFile(1: required string field, 2: required binary file)
    void addFile(1: required string field, 2: required FormDataFile file)
    void addField(1: required string field, 2: required string val)
}

struct MarketplaceAppAccessTokenReq {
    1: required string app_id,
    2: required string app_secret,
    3: required string app_ticket,
}

struct MarketplaceTenantAccessTokenReq {
    1: required string appAccessToken,
    2: required string tenantKey,
}

struct RawRequest {
    1: required i32 statusCode,
    2: required string contentType,
    3: required map<string, list<string>> headers,
    4: required binary body,
    5: required string reqUrl,
    6: required string httpMethod,
    7: required config.Config config,
    8: required bool supportDownLoad,
    9: required bool supportLong2string,
}

struct ParsedReq {
    1: required map<string, string> pathmap,
    2: required map<string, string> querymap,
    3: required binary body,
}

# ReqTranslator
struct ReqTranslator {
}

service ITranslator {
    RawRequest translate(1: binary req, 2: token.AccessTokenType accessTokenType, 3: config.Config config, 4: string httpMethod, 5: string httpPath, 6: RequestOptions requestOptions)
}

service ITranslatorX {
    string encode(1: string value)
    string getToken(1: string tenantKey, 2: token.AccessTokenType accessTokenType, 3: config.Config config, 4: RequestOptions requestOptions)
    // string getToken(1: string tenantKey, 2: token.AccessTokenType accessTokenType, 3: config.Config config, 4: RequestOptions requestOptions) throws(1: ServiceException se)
    ParsedReq parseInput(binary req, RequestOptions requestOptions)
    FormData buildFormData(binary body)
    string getFullReqUrl(string domain, string httpPath, map<string, binary> pathmap, map<string, binary> querymap)
    string joinPathParam(string path, map<string, binary> pathmap)
    string buildQuery(map<string, binary> params)
}

struct RequestOptions {
    1: required bool needHelpDeskAuth,
    2: required string tenantKey,
    3: required string userAccessToken,
    4: required string appAccessToken,
    5: required string tenantAccessToken,
    6: required string requestId,
    7: required bool supportUpload,
    8: required bool supportDownLoad,
    9: required bool supportLong2string,
    10: required map<string, list<string>> headers,
}

struct ResendAppTicketReq {
    required string appId,
    required string appSecret,
}

struct SelfBuiltAppAccessTokenReq {
    required string appId,
    required string appSecret,
}

struct SelfBuiltTenantAccessTokenReq {
    required string appId,
    required string appSecret,
}