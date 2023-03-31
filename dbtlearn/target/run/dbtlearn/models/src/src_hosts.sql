
  create or replace  view AIRBNB.dev.src_hosts
  
   as (
    WITH src_hosts AS (
SELECT
*
FROM
AIRBNB.RAW.RAW_HOSTS
)
SELECT
id AS host_id,
NAME AS host_name,
is_superhost,
created_at,
updated_at
FROM
src_hosts
  );
