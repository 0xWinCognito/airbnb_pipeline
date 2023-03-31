
  create or replace  view AIRBNB.dev.dim_hosts_cleansed
  
   as (
    
WITH  __dbt__cte__src_hosts as (
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
),dim_hosts_cleansed AS 
(SELECT * from __dbt__cte__src_hosts)
SELECT
host_id,
NVL(host_name,'Anonymous') as host_name,
is_superhost,
created_at,
updated_at
FROM
dim_hosts_cleansed
  );
