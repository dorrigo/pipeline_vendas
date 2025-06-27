
  create view "dw_vendas_dbt"."dw_vendas_bronze_bronze"."stg_produtos__dbt_tmp"
    
    
  as (
    

SELECT
  id_bronze,
  produto_id,
  nome,
  categoria,
  preco,
  data_carga
FROM "dw_vendas_dbt"."dw_vendas_bronze"."produtos_bronze"
  );