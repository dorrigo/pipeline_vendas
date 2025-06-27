{{
  config(
    materialized='table',
    alias='dim_lojas',
    schema='silver'
  )
}}

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
FROM {{ ref('stg_lojas') }}
WHERE loja_id IS NOT NULL