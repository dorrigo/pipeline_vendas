CREATE TABLE clientes_bronze (
    id_bronze SERIAL PRIMARY KEY,  
    cliente_id INT,                
    nome VARCHAR(100),
    cidade VARCHAR(50),
    segmento VARCHAR(50),
    data_carga TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE produtos_bronze (
    id_bronze SERIAL PRIMARY KEY,  -- PK artificial
    produto_id INT,                -- ID original
    nome VARCHAR(100),
    categoria VARCHAR(50),
    preco DECIMAL(10, 2),
    data_carga TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE vendas_bronze (
    id_bronze SERIAL PRIMARY KEY,  
    venda_id INT,
    loja_id INT,                 
    cliente_id INT,               
    produto_id INT,               
    quantidade INT,
    data_venda DATE,
    total DECIMAL(10, 2),
    data_carga TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE lojas_bronze (
    id_bronze SERIAL PRIMARY KEY,
    loja_id INT,
    nome VARCHAR(100),
    cidade VARCHAR(50),
    tamanho VARCHAR(20),
	data_carga TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

