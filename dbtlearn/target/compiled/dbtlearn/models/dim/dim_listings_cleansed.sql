

With  __dbt__cte__src_listings as (
with src_listings AS (
select * From AIRBNB.RAW.RAW_LISTINGS
)
SELECT
id AS listing_id,
name AS listing_name,
listing_url,
room_type,
minimum_nights,
host_id,
price AS price_str,
created_at,
updated_at
FROM
src_listings
),dim_listings_cleansed AS
( Select * from __dbt__cte__src_listings)
SELECT
listing_id,
listing_name,
room_type,
CASE
WHEN minimum_nights = 0 THEN 1
ELSE minimum_nights
END AS minimum_nights,
host_id,
REPLACE(price_str,'$') :: NUMBER(10,2) AS price,
created_at,
updated_at
FROM
dim_listings_cleansed