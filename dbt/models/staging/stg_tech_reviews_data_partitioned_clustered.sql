{{ config(materialized="view") }}

with reviewsdata as 
(

    select * from {{ source("staging", "tech_reviews_data_partitioned_clustered") }}
    where id is not null

)

select
    id as url,
    {{ dbt.safe_cast("score", api.Column.translate_type("integer")) }} as review_score,
    publication,
    {{ dbt.safe_cast(get_standard_review_score("publication", "score"),api.Column.translate_type("integer") ) }} as adjusted_review_score,
    replace(category, 'audio visual', 'audio') as tech_category,
    article,
    author,
    cast(date as TIMESTAMP) as published_date,
    title,
    brand

from reviewsdata
