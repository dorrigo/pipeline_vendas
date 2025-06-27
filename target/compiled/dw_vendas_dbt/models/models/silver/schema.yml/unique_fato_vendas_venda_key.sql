
    
    

select
    venda_key as unique_field,
    count(*) as n_records

from "dw_vendas_dbt"."dw_vendas_bronze_silver"."fato_vendas"
where venda_key is not null
group by venda_key
having count(*) > 1


