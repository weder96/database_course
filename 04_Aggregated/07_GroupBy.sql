-- [SQL Server] Criando agrupamentos no SQL
-- database => AdventureWorksDW2019
-- Group By (Parte 2)


-- Consulta 1
SELECT * FROM DimReseller

SELECT
	BusinessType,
	SUM(NumberEmployees) AS 'Qtd. Total Funcionarios'
FROM
	DimReseller
GROUP BY BusinessType

-- Consulta 2
SELECT * FROM DimProduct

SELECT
	pro.ProductSubcategoryKey,
	AVG(ListPrice) AS 'Custo Medio'
FROM
	DimProduct pro
GROUP BY ProductSubcategoryKey


-- Consulta 3
SELECT * FROM DimProduct

SELECT
	Class AS 'Classe do Produto',
	MAX(ListPrice) AS 'Maximo Preço'
FROM
	DimProduct pro
GROUP BY Class
