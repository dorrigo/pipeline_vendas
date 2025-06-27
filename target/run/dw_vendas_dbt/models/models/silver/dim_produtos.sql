
  
    

  create  table "dw_vendas_dbt"."dw_vendas_bronze_silver"."dim_produtos__dbt_tmp"
  
  
    as
  
  (
    

SELECT
  produto_id,
  TRIM(nome) AS nome,
  TRIM(categoria) AS categoria,
  ROUND(preco, 2) AS preco
FROM "dw_vendas_dbt"."dw_vendas_bronze_bronze"."stg_produtos"
WHERE produto_id IS NOT NULL
AND preco > 0
  );
  