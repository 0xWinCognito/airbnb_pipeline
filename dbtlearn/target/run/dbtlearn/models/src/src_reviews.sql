
  create or replace  view AIRBNB.dev.src_reviews
  
   as (
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
  );
