-- +goose up
CREATE TABLE default.raw_api_requests_v1(
    request_id String,
    -- unix milli
    time Int64,

    workspace_id String,

    host String,

    -- Upper case HTTP method
    -- Examples: "GET", "POST", "PUT", "DELETE"
    method LowCardinality(String),
    path String,
    -- "Key: Value" pairs
    request_headers Array(String),
    request_body String,

    response_status Int,
    -- "Key: Value" pairs
    response_headers Array(String),
    response_body String,
    -- internal err.Error() string, empty if no error
    error String

)
ENGINE = MergeTree()
ORDER BY (workspace_id, time, request_id)
;
