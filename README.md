# pipeline_vendas

# Projeto de Pipeline de Dados: Da Ingestão à Análise de Vendas

Acesse também no meu [portfólio](

## 1. Introdução
### Problema
Dados de vendas desorganizados em múltiplas fontes, sem padronização ou qualidade garantida, dificultando a análise estratégica.

### Objetivo
Construir um pipeline completo que transforme dados brutos em insights acionáveis, seguindo as melhores práticas de engenharia de dados.

## 2. Ferramentas Utilizadas

| Camada       | Ferramentas               | Função Principal                     |
|--------------|---------------------------|---------------------------------------|
| Ingestão     | Python (Faker, Psycopg2)  | Gerar e carregar dados sintéticos     |
| Armazenamento| PostgreSQL                | Banco de dados relacional             |
| Transformação| dbt (Data Build Tool)     | Modelagem e transformação de dados    |

## 3. Arquitetura do Projeto

```sql
pipeline_vendas/
├── ingestao/ # Scripts Python
├── models/
│ ├── bronze/ # Dados brutos
│ ├── silver/ # Dados limpos
│ └── gold/ # Análises prontas
└── documentation/ # Esquemas e metadados
```
## 4. Principais Etapas

### 4.1: Ingestão dos dados (Python)

Geração de dados sintéticos com Faker:

- Dados gerados: 100 clientes, 50 produtos, 20 lojas, 1.000 vendas.

```python
# --- Ingestão de CLIENTES ---
for i in range(1, 101):  # 100 clientes
    cursor.execute(
        """
        INSERT INTO clientes_bronze (cliente_id, nome, cidade, segmento)
        VALUES (%s, %s, %s, %s)
        """,
        (i,  # ID sequencial para evitar duplicatas
         fake.name(),
         fake.city(),
         random.choice(["Varejo", "Atacado", "Online"]))
    )
```
###### Exemplo de um dos códigos de ingestão dos dados 

### 4.2 Camada Bronze

Função: 

Captura dos dados brutos ingestados para estruturá-los em views.

```sql
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
```
###### View Clientes_bronze - Camada Bronze

### 4.3 Camada Silver

Transformações:

- Tratamento de texto (TRIM)

- Filtro de valores nulos

- Cálculo de métricas básicas

```sql
{{
  config(
    materialized='table',
    alias='fato_vendas',
    schema='silver'
  )
}}

SELECT
  v.venda_id,
  v.loja_id,
  v.cliente_id,
  v.produto_id,
  v.quantidade,
  v.data_venda,
  v.total,
  v.total / NULLIF(v.quantidade, 0) AS preco_unitario
FROM {{ ref('stg_vendas') }} v
WHERE v.venda_id IS NOT NULL
```
###### Tabela Fato_vendas - Camada Silver

### 4.4 Camada Gold

Análises:

- Produtos Mais Vendidos (Top 5)

- Vendas por Loja (Top 10)

- Resumo das Vendas (Mensal)

# 5. Resultados Obtidos

## Análise de Dados de Vendas

### Tendências Mensais 

#### Volume de Vendas:
- **Pico**: Dezembro/2024 (106 transações)
- **Mínimo**: Junho/2024 (11 vendas)
- **Padrão**: Crescimento significativo após junho/2024 com sazonalidade em dezembro (fim de ano) e maio/2025

#### Receita Total:
- **Maior receita**: Maio/2025 (R$99.174,80)
- **Menor receita**: Junho/2024 (R$11.117,56)
- **Ticket médio**:
  - Alto: Agosto/2024 (R$1.079,66)
  - Baixo: Junho/2025 (R$871,28)

#### Clientes Ativos:
- **Crescimento**: 10 (junho/2024) → 66 (dezembro/2024)
- **Estabilização**: 48-62 clientes ativos nos últimos meses

---

### Desempenho por Loja 

#### Lojas com Melhor Performance:
1. **Super Duci** (Montenegro):
   - Maior ticket médio: R$1.055
2. **Super Quae** (Casa Grande do Campo):
   - Segundo maior ticket médio: R$1.143 (loja média)
3. **Ultra Doloru** (Oliveira do Norte):
   - Líder em volume: 57 vendas

#### Eficiência:
- Lojas grandes ≠ melhor desempenho
- **Destaque**: "Hiper Impedit" (pequena) com 57 vendas (igual a grandes lojas)

---

## Produtos Mais Vendidos

### Top Performers:
| Produto   | Categoria   | Destaque                          |
|-----------|-------------|-----------------------------------|
| #38       | Cosméticos  | Maior receita (R$31.357,68)       |
| #43       | Alimentos   | Mais vendido (29 vezes)           |
| #9 e #46  | Eletrônicos | 2 produtos no top 5               |

#### Preços:
- **Mais alto**: Produto #46 (R$416,67)
- **Mais baixo**: Produto #9 (R$311,62)

---

## Recomendações Estratégicas

#### Expansão:
- Modelo Super Quae (lojas médias com alto ticket médio)
- Investigar sucesso de lojas pequenas (Hiper Impedit)

#### Marketing:
- Promover **top 5 produtos** (eletrônicos e cosméticos premium)
- Criar _bundles_ com produtos #43 e #11 (alimentos)

#### Operações:
- Aumentar estoque nos períodos de alta (dezembro/maio)
- Treinar equipes com base nas lojas de alto ticket médio

#### Pesquisa:
- Investigar queda no ticket médio (junho/2025)
- Analisar baixo desempenho inicial (junho/2024)


# 6. Aprendizados

Como meu primeiro projeto utilizando **DBT (Data Build Tool)**, destaco:

- **Modelagem de Dados**:
  - Utilizei o **dbt-core** via terminal
  - Aprendi a estruturar modelos (`.sql`), configurações (`.yml`) e documentação
  - Desafios com a curva de aprendizado ao utilizar o dbt via terminal

- **Documentação Automatizada**:
  - Funcionalidade que mais me impressionou:
  ```bash
  dbt docs generate
  dbt docs serve





