{{
  config(
    materialized='view',
    alias='stg_lojas',
    schema='bronze'
  )
}}

SELECT
  id_bronze,
  loja_id,
  nome,
  cidade,
  tamanho,
  CURRENT_TIMESTAMP AS data_carga
FROM {{ source('raw', 'lojas_bronze') }}