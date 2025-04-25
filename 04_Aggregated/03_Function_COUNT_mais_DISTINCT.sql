-- [SQL Server] Funcoes de Agregacao
-- database => AdventureWorksDW2019
-- Funcao COUNT mais DISTINCT

-- 1. Faca uma consulta que retorna a contagem distinta das cor dos produtos

SELECT
	COUNT(DISTINCT color)
FROM
	DimProduct

