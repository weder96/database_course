-- [SQL Server] Criando agrupamentos no SQL
-- database => AdventureWorksDW2019
-- Group By (Parte 1)

SELECT * FROM DimProduct

SELECT
	color AS 'Cor do Produto',
	COUNT(*) AS 'Qtd Total'
FROM
	DimProduct
GROUP BY Color