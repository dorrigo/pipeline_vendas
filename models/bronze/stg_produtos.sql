{{
  config(
    materialized='view',
    alias='stg_produtos',
    schema='bronze'
  )
}}

SELECT
  id_bronze,
  produto_id,
  nome,
  categoria,
  preco,
  data_carga
FROM {{ source('raw', 'produtos_bronze') }}