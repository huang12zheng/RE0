include "request.thrift"

service IHttpTransport {
    request.RawResponse execute(1: request.RawRequest request),
}

service IHttpTransportClient {
    void close(),
}

struct HttpTransport {
    1: required binary httpclient,
}