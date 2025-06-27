{{
  config(
    materialized='table',
    alias='produtos_mais_vendidos',
    schema='gold'
  )
}}

SELECT
  p.produto_id,
  p.nome AS produto,
  p.categoria,
  COUNT(DISTINCT v.venda_id) AS vezes_vendido,
  SUM(v.quantidade) AS unidades_vendidas,
  SUM(v.total) AS receita_gerada,
  ROUND(SUM(v.total) / NULLIF(SUM(v.quantidade), 0), 2) AS preco_medio_venda  
FROM {{ ref('fato_vendas') }} v
JOIN {{ ref('dim_produtos') }} p ON v.produto_id = p.produto_id 
GROUP BY 1, 2, 3
ORDER BY unidades_vendidas DESC
LIMIT 50