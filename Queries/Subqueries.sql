-- [SQL Server] [Subqueries] 
-- database = AdventureWorksDW2019
-- Subquery na prática - Aplicação com o Where (Exemplo 1)
-- Para entender a ideia por trás das subqueries, vamos começar fazendo 3 exemplos com a aplicação WHERE.


-- Exemplo 1: Quais produtos da tabela DimProduct possuem custos acima da média?

SELECT AVG(ListPrice) FROM DimProduct     -- 747.6617

SELECT
	*
FROM
	DimProduct
WHERE ListPrice >= (SELECT AVG(ListPrice) FROM DimProduct)



-- [SQL Server] [Subqueries] Subquery na prática - Aplicação com o Where (Exemplo 2)

-- Para entender a ideia por trás das subqueries, vamos começar fazendo exemplos com a aplicação WHERE.

-- Exemplo 2: Faça uma consulta para retornar os produtos da categoria 'Wheels'. 
-- Tome cuidado pois não temos a informação de Nome da Subcategoria na tabela DimProduct. Dessa forma, precisaremos criar um SELECT que descubra o ID da categoria
-- 'Wheels' e passar esse resultado como o valor que queremos filtrar dentro do WHERE.


SELECT * FROM DimProduct
WHERE ProductSubcategoryKey = 
	(SELECT ProductSubcategoryKey FROM DimProductSubcategory
		WHERE EnglishProductSubcategoryName = 'Wheels')



-- [SQL Server] [Subqueries] Subquery na prática - Aplicação com o Where (Exemplo 3)
-- Exemplo 3: Filtre a tabela FactResellerSales e mostre apenas as vendas referentes às lojas com 100 ou mais funcionários

SELECT * FROM FactResellerSales
WHERE ResellerKey IN (
	SELECT	ResellerKey
	FROM DimReseller
	WHERE NumberEmployees >= 100
)