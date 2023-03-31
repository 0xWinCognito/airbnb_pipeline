
  create or replace  view AIRBNB.dev.raw_reviews
  
   as (
    with raw_reviews AS (
select * From AIRBNB.RAW.RAW_REVIEWS
)
SELECT
listing_id,
date as review_date,
reviewer_name,
comments as review_text,
sentiment as review_sentiment
FROM
raw_reviews
  );