{{
    config(
        materialized='table'
    )
}}

with score as (
    SELECT
    CASE
        WHEN tech_category IN ('computing', 'laptops', 'desktop pcs', 'monitors') THEN 'Computers'
        WHEN tech_category IN ('mobile phones', 'tablets') THEN 'Mobile & Tablets'
        WHEN tech_category IN ('smart home') THEN 'Smart Home'
        WHEN tech_category IN ('televisions', 'televisori') THEN 'TVs'
        ELSE tech_category
    END AS combined_category,
    from {{ ref("stg_tech_reviews_data_partitioned_clustered") }}
)

SELECT
    UPPER(combined_category) as category,
    COUNT(*) as num_reviews
FROM
    score
WHERE combined_category not in ('none', 'software', 'entertainment')  
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10

