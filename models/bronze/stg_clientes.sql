{{
  config(
    materialized='view',
    alias='stg_clientes',
    schema='bronze'
  )
}}

SELECT
  id_bronze,
  cliente_id,
  nome,
  cidade,
  segmento,
  data_carga
FROM {{ source('raw', 'clientes_bronze') }}