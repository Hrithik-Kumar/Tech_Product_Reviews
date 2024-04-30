{{
    config(
        materialized='table'
    )
}}

with score as (
    SELECT 
    brand,
    round(avg(adjusted_review_score),1) as mean_review_score
    from {{ ref("stg_tech_reviews_data_partitioned_clustered") }}
WHERE NOT (brand LIKE '20%' OR brand = 'A')
GROUP BY 1
HAVING(COUNT(*) >= 50)
ORDER BY mean_review_score DESC
)

SELECT mean_review_score,
    STRING_AGG(brand, ', ') AS brands_with_score
FROM score
WHERE mean_review_score >= 7.0
GROUP BY mean_review_score







