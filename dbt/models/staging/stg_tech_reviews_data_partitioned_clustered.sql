with 

source as (

    select * from {{ source('staging', 'tech_reviews_data_partitioned_clustered') }}

),

renamed as (

    select
        id,
        score,
        publication,
        category,
        article,
        author,
        date,
        title,
        brand

    from source

)

select * from renamed
