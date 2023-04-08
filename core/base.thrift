include "request.thrift"
include "response.thrift"

service IHttpAdapter {
    request.EventReq getEventReq(),
    void writeResp(response.EventResp eventResp),
}

service IHandler {
    response.EventResp handle(request.EventReq eventResp),
}