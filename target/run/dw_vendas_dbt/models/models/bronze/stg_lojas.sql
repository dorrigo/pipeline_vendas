
  create view "dw_vendas_dbt"."dw_vendas_bronze_bronze"."stg_lojas__dbt_tmp"
    
    
  as (
    

SELECT
  id_bronze,
  loja_id,
  nome,
  cidade,
  tamanho,
  CURRENT_TIMESTAMP AS data_carga
FROM "dw_vendas_dbt"."dw_vendas_bronze"."lojas_bronze"
  );