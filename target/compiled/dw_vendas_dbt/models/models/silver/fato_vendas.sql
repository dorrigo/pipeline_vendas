

SELECT
  v.venda_id,
  v.loja_id,
  v.cliente_id,
  v.produto_id,
  v.quantidade,
  v.data_venda,
  v.total,
  v.total / NULLIF(v.quantidade, 0) AS preco_unitario
FROM "dw_vendas_dbt"."dw_vendas_bronze_bronze"."stg_vendas" v
WHERE v.venda_id IS NOT NULL