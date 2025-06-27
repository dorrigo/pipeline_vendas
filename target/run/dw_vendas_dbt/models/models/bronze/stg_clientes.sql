
  create view "dw_vendas_dbt"."dw_vendas_bronze_bronze"."stg_clientes__dbt_tmp"
    
    
  as (
    

SELECT
  id_bronze,
  cliente_id,
  nome,
  cidade,
  segmento,
  data_carga
FROM "dw_vendas_dbt"."dw_vendas_bronze"."clientes_bronze"
  );