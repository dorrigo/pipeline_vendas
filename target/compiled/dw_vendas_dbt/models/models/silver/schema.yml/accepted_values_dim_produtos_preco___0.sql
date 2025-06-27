
    
    

with all_values as (

    select
        preco as value_field,
        count(*) as n_records

    from "dw_vendas_dbt"."dw_vendas_bronze_silver"."dim_produtos"
    group by preco

)

select *
from all_values
where value_field not in (
    '> 0'
)


