CREATE MATERIALIZED VIEW mv_stream_raw
AUTO REFRESH NO
AS
SELECT
    approximate_arrival_timestamp,
    shardid,
    sequence_number,
    json_parse(kinesis_data) as payload
FROM KINESIS_STREAM(
    'events-stream',
    'us-east-1'
);