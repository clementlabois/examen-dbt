with demographics as (
    select * from {{ source('COVID19_Epidemiological_Data', 'DEMOGRAPHICS') }}
),

country_codes as (
    -- On retire les guillemets pour laisser Snowflake gérer la casse
    select 
        Code as code, 
        Name as name 
    from {{ ref('country_code') }}
),

final as (
    select
        demographics.total_population,
        country_codes.name
    from demographics
    left join country_codes
        on country_codes.code = demographics.ISO3166_1
)

select * from final