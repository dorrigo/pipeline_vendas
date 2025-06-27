{{
  config(
    materialized='table',
    alias='dim_produtos',
    schema='silver'
  )
}}

SELECT
  produto_id,
  TRIM(nome) AS nome,
  TRIM(categoria) AS categoria,
  ROUND(preco, 2) AS preco
FROM {{ ref('stg_produtos') }}
WHERE produto_id IS NOT NULL
AND preco > 0  