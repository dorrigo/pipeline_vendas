
  
    

  create  table "dw_vendas_dbt"."dw_vendas_bronze_gold"."resumo_vendas__dbt_tmp"
  
  
    as
  
  (
    

-- Resumo consolidado de vendas
SELECT
  DATE_TRUNC('month', v.data_venda) AS mes,
  COUNT(DISTINCT v.venda_id) AS total_vendas,
  SUM(v.total) AS receita_total,
  SUM(v.quantidade) AS total_itens_vendidos,
  COUNT(DISTINCT v.cliente_id) AS clientes_ativos,
  COUNT(DISTINCT v.loja_id) AS lojas_ativas,
  ROUND(SUM(v.total) / NULLIF(COUNT(DISTINCT v.venda_id), 0), 2) AS ticket_medio
FROM "dw_vendas_dbt"."dw_vendas_bronze_silver"."fato_vendas" v
GROUP BY 1
ORDER BY 1
  );
  