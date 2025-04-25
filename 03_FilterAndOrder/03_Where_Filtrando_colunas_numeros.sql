-- [SQL Server] Ordenando e filtrando dados
-- database => AdventureWorksDW2019
-- Where - Filtrando colunas de numeros

-- Podemos filtrar os dados nas nossas tabelas utilizando o comando WHERE
-- Quantos produtos tem um preco unitario maior que $1000?

SELECT 
	EnglishProductName AS Produto,
	ListPrice AS Preco
FROM
	DimProduct
WHERE ListPrice >= 1000