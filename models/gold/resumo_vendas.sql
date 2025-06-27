{{
  config(
    materialized='table',
    alias='resumo_vendas',
    schema='gold'
  )
}}

SELECT
  DATE_TRUNC('month', v.data_venda) AS mes,
  COUNT(DISTINCT v.venda_id) AS total_vendas,
  SUM(v.total) AS receita_total,
  SUM(v.quantidade) AS total_itens_vendidos,
  COUNT(DISTINCT v.cliente_id) AS clientes_ativos,
  COUNT(DISTINCT v.loja_id) AS lojas_ativas,
  ROUND(SUM(v.total) / NULLIF(COUNT(DISTINCT v.venda_id), 0), 2) AS ticket_medio
FROM {{ ref('fato_vendas') }} v
GROUP BY 1
ORDER BY 1
