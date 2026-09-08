CREATE MATERIALIZED VIEW mv_events_realtime
AS
SELECT
    payload.event_id::varchar(50)           AS event_id,
    payload.event_timestamp::timestamp      AS event_timestamp,
    payload.payload_value::decimal(18,2)    AS payload_value
FROM mv_stream_raw;