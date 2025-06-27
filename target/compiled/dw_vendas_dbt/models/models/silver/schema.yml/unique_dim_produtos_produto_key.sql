
    
    

select
    produto_key as unique_field,
    count(*) as n_records

from "dw_vendas_dbt"."dw_vendas_bronze_silver"."dim_produtos"
where produto_key is not null
group by produto_key
having count(*) > 1


