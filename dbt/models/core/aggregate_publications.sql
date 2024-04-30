{{
    config(
        materialized='table'
    )
}}

with publication_num_reviews as (
    select 
        publication,
        adjusted_review_score, 
    from {{ ref("stg_tech_reviews_data_partitioned_clustered") }}
),

num_reviews_ratio as(
select
    publication,
    adjusted_review_score,
    COUNT(*) AS num_reviews
from publication_num_reviews
GROUP BY 1, 2
)

select 
    publication,
    adjusted_review_score as review_score,
    num_reviews,
    round((num_reviews / SUM(num_reviews) OVER (PARTITION BY publication)) * 100,2) AS percentage_num_reviews
from num_reviews_ratio
ORDER BY publication, adjusted_review_score







