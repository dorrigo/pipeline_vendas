

SELECT
  id_bronze,
  venda_id,
  loja_id,
  cliente_id,
  produto_id,
  quantidade,
  data_venda,
  total,
  data_carga
FROM "dw_vendas_dbt"."dw_vendas_bronze"."vendas_bronze"