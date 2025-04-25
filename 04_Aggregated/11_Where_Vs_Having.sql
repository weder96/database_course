-- [SQL Server] Criando agrupamentos no SQL
-- database => AdventureWorksDW2019
-- Where vs Having


--SELECT * FROM DimProduct

SELECT * FROM DimProduct

SELECT
	Class AS 'Class do Produto',
	COUNT(Color) AS 'Qtd. Total'
FROM
	DimProduct
WHERE Color = 'Red'    -- Filtra a tabela original, antes do agrupamento
GROUP BY Class
HAVING COUNT(Color) >= 20 -- Filtra a tabela depois de agrupada