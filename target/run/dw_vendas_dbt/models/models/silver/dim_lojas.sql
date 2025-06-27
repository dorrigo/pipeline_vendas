
  
    

  create  table "dw_vendas_dbt"."dw_vendas_bronze_silver"."dim_lojas__dbt_tmp"
  
  
    as
  
  (
    

SELECT
  loja_id,
  TRIM(nome) AS nome,
  TRIM(cidade) AS cidade,
  -- Padronização de tamanhos
  CASE 
    WHEN tamanho IS NULL THEN 'Média'
    WHEN tamanho IN ('P', 'Pequena') THEN 'Pequena'
    WHEN tamanho IN ('G', 'Grande') THEN 'Grande'
    ELSE tamanho
  END AS tamanho
FROM "dw_vendas_dbt"."dw_vendas_bronze_bronze"."stg_lojas"
WHERE loja_id IS NOT NULL
  );
  