
    
    

with child as (
    select loja_key as from_field
    from "dw_vendas_dbt"."dw_vendas_bronze_silver"."fato_vendas"
    where loja_key is not null
),

parent as (
    select loja_key as to_field
    from "dw_vendas_dbt"."dw_vendas_bronze_silver"."dim_lojas"
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


