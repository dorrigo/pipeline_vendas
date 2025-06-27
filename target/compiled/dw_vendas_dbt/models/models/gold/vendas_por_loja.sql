

SELECT
  l.loja_id,
  l.nome AS nome_loja,
  l.cidade AS cidade_loja,
  l.tamanho AS tamanho_loja,
  COUNT(DISTINCT v.venda_id) AS total_vendas,
  SUM(v.total) AS receita_total,
  COUNT(DISTINCT v.cliente_id) AS clientes_unicos,
  SUM(v.quantidade) AS itens_vendidos,
  ROUND(SUM(v.total) / NULLIF(COUNT(DISTINCT v.venda_id), 2)) AS ticket_medio
FROM "dw_vendas_dbt"."dw_vendas_bronze_silver"."fato_vendas" v
JOIN "dw_vendas_dbt"."dw_vendas_bronze_silver"."dim_lojas" l ON v.loja_id = l.loja_id  
GROUP BY 1, 2, 3, 4
ORDER BY receita_total DESC