-- [SQL Server] CRUD
-- DROP TABLE - Excluindo uma tabela

-- Crie uma tabela chamada 'Produtos'
-- Essa abela deve conter 4 colunas: id_produt, nome_produto, data_validade e preco_produto
-- Certifique-se de que o tipo das colunas está correto.

CREATE DATABASE nStore;    -- Obs: Se você já criou o BD nStore não precisa executar esta linha

USE nStore;

CREATE TABLE Produtos(
	id_produto INT,
	nome_produto VARCHAR(200),
	data_cadastro DATETIME,
	preco_produto FLOAT
)

SELECT * FROM Produtos

-- Adicionando valores de outra tabela

INSERT INTO Produtos(id_produto, nome_produto, data_cadastro, preco_produto)
SELECT
	distinct
	ProductKey,
	EnglishProductName,
	StartDate,
	ListPrice
FROM
	AdventureWorksDW2019.dbo.DimProduct
	where ListPrice is not null

-- Adicionando novos valores na tabela

INSERT INTO Produtos(id_produto, nome_produto, data_cadastro, preco_produto)
VALUES
	(1, 'Arroz', '2021-12-31', 22.50),
	(2, 'Feijão', '2021-12-31', 8.99)

-- Atualizando o dado de uma tabela

UPDATE Produtos
SET nome_produto = 'Macarrão'
WHERE id_produto = 2


-- Deletando dados de uma tabela

DELETE 
FROM Produtos
WHERE id_produto = 2

-- Excluindo uma tabela

DROP TABLE Produtos