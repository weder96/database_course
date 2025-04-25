-- [SQL Server] Funcaes de Agregacao
-- database => AdventureWorksDW2019
-- Funcao COUNT

-- 1. Faça uma consulta que retorna a contagem total de produtos. Considere a coluna EnglishProductName para este calculo

SELECT
	COUNT(EnglishProductName) AS 'Qtd. Produtos'
FROM
	DimProduct

-- 2. Faca uma consulta que retorna a contagem total de produtos. Considere a coluna Size para este calculo

SELECT
	COUNT(Size) AS 'Qtd. Produtos'
FROM
	DimProduct


-- Obs: A funcao COUNT nao conta valores nulos da coluna, entao tome cuidado com o resultado que voce espera.