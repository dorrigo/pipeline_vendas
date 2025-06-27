
  
    

  create  table "dw_vendas_dbt"."dw_vendas_bronze_silver"."dim_clientes__dbt_tmp"
  
  
    as
  
  (
    

SELECT
  cliente_id,
  TRIM(nome) AS nome,
  TRIM(cidade) AS cidade,
  CASE 
    WHEN segmento IN ('Varejo', 'Atacado', 'Online') THEN segmento
    ELSE 'Outros'
  END AS segmento
FROM "dw_vendas_dbt"."dw_vendas_bronze_bronze"."stg_clientes"
WHERE cliente_id IS NOT NULL
  );
  