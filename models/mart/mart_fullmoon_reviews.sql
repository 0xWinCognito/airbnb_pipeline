{{ config(
    materialized = 'table'
)}}

With fct_reviews AS 
         (SELECT * FROM {{ ref ('fct_reviews') }}),
     full_moon_dates AS 
          (SELECT * FROM {{ ref ("full_moon_dates") }})

SELECT
   fr.*,
   CASE WHEN fmd.full_moon_date IS NULL THEN 'No'
        ELSE 'Yes'
   END AS is_full_moon
FROM
   fct_reviews fr
LEFT JOIN
   full_moon_dates fmd
ON (TO_DATE(fr.review_date) = DATEADD(DAY,1,fmd.full_moon_date))