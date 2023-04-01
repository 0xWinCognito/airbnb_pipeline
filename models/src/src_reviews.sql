with src_reviews AS 
( select * From {{ source('airbnb','reviews')}} )
SELECT
listing_id,
date as review_date,
reviewer_name,
comments as review_text,
sentiment as review_sentiment
FROM
src_reviews