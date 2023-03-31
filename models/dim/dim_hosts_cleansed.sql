{{ 
   config(materialized = 'view')

}}
WITH dim_hosts_cleansed AS 
(SELECT * from {{ ref('src_hosts') }})
SELECT
host_id,
NVL(host_name,'Anonymous') as host_name,
is_superhost,
created_at,
updated_at
FROM
dim_hosts_cleansed