-- [SQL Server] Criando agrupamentos no SQL
-- database => AdventureWorksDW2019
-- Group By + Where


SELECT * FROM DimProduct

SELECT
	Class AS 'Class do Produto',
	COUNT(Color) AS 'Qtd. Total'
FROM
	DimProduct
WHERE Color = 'Red'
GROUP BY Class
