-- [SQL Server] [Subqueries] : EXISTS

-- database = AdventureWorksDW2019

-- Exemplo: Retornar uma tabela com todos os produtos (ID Produto e Nome Produto) que possuem alguma venda no dia '2010-12-29'
-- Conta a quantidade de Produtos
SELECT COUNT(*) FROM DimProduct

-- Retorna uma tabela com todos os produtos que possuem alguma venda

SELECT
	ProductKey,
	EnglishProductName
FROM	
	DimProduct
WHERE EXISTS(
	SELECT
		ProductKey
	FROM
		FactInternetSales
	WHERE
		OrderDate = '2010-12-29'
		AND FactInternetSales.ProductKey = DimProduct.ProductKey
)


-- Solução alternativa com o ANY

SELECT
	ProductKey,
	EnglishProductName
FROM	
	DimProduct
WHERE ProductKey = ANY(
	SELECT
		ProductKey
	FROM
	  FactInternetSales
	WHERE
		OrderDate = '2010-12-29'
		-- AND factSales.ProductKey = DimProduct.ProductKey
)