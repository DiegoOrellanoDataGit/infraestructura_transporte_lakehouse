CREATE SCHEMA analytics;

CREATE ROLE analytics_role;

GRANT USAGE
ON SCHEMA analytics
TO ROLE analytics_role;

GRANT SELECT
ON ALL TABLES IN SCHEMA analytics
TO ROLE analytics_role;