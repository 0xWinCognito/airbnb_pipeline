


WITH  __dbt__cte__src_reviews as (
with src_reviews AS (
select * From AIRBNB.RAW.RAW_REVIEWS
)
SELECT
listing_id,
date as review_date,
reviewer_name,
comments as review_text,
sentiment as review_sentiment
FROM
src_reviews
),src_reviews AS 
  ( SELECT * FROM __dbt__cte__src_reviews )
SELECT * FROM src_reviews
WHERE review_text is NOT NULL

  AND review_date > (select max(review_date) from AIRBNB.dev.fct_reviews)
