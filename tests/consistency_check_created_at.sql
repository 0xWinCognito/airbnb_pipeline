SELECT
  *
FROM
  {{ ref("src_listings")}} sl 
LEFT JOIN
  {{ ref('fct_reviews')}}  sr
USING(listing_id)
  
WHERE 
   sl.created_at >= sr.review_date 
LIMIT 10