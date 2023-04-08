include "config.thrift"
include "response.thrift"

enum AccessTokenType {
    None,
    App,
    Tenant,
    User,
}

# struct AppTicketManager{}
service IAppTicketManager {
    void put(1: string appId, 2: string value, 3: i32 expire, 4: i32 timeUnit),
    string get(1: config.Config config),
    void applyAppTicket(1: config.Config config),
    string getKey(1: string appId),
}

service ITokenManager {
    string getAppAccessTokenKey(1: string appId),
    string getAppAccessToken(1: config.Config config),
    response.AppAccessTokenResp getInternalAppAccessToken(1: config.Config config),
    response.AppAccessTokenResp getIsvAppAccessToken(1: config.Config config),
    string getTenantAccessTokenKey(1: string appId, 2: string tenantKey),
    response.TenantAccessTokenResp getInternalTenantAccessToken(1: config.Config config),
    response.TenantAccessTokenResp getIsvTenantAccessToken(1: config.Config config, 2: string tenantKey),
}