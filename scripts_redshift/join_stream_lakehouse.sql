-- ==========================================
-- Join Hot Data (Streaming)
-- + Cold Data (Iceberg)
-- ==========================================

SELECT
    s.event_id,
    s.event_timestamp,
    s.payload_value,

    h.device_id,
    h.location,
    h.event_type

FROM mv_events_realtime s

INNER JOIN lakehouse_ext.sensor_events h
    ON s.event_id = h.event_id

ORDER BY s.event_timestamp DESC;