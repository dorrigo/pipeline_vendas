{{
  config(
    materialized='table',
    alias='dim_clientes',
    schema='silver'
  )
}}

SELECT
  cliente_id,
  TRIM(nome) AS nome,
  TRIM(cidade) AS cidade,
  CASE 
    WHEN segmento IN ('Varejo', 'Atacado', 'Online') THEN segmento
    ELSE 'Outros'
  END AS segmento
FROM {{ ref('stg_clientes') }}
WHERE cliente_id IS NOT NULL