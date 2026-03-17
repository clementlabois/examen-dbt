with demographics as (
    -- On appelle la source définie dans ton schema.yml
    select * from {{ source('COVID19_Epidemiological_Data','DEMOGRAPHICS') }}
),

final as (
    select 
        -- On appelle la macro créée dans le dossier macros/
        -- On lui passe 'total_population' comme premier argument
        {{ divide_by_hundred('total_population') }} as population_divided
    from demographics -- On utilise le nom de la CTE définie au-dessus
)

select * from final