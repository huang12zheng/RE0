struct Value {
    1: required string value,
    2: required i64 end,
}

struct LocalCache {
    1: required binary Logger,
    2: required map<string, Value> CACHE,
}

service Cache {
    void Set(1: string key, 2: string value, 3: i64 expireTime),
    string Get(1: string key),
}