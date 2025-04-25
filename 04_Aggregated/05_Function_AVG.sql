-- [SQL Server] Funcoes de Agregacao
-- database => AdventureWorksDW2019
-- Funcao AVG

-- 1. Faca uma consulta que retorna a media de YearlyIncome (media de salario) da tabela DimCustomer.

SELECT
	AVG(YearlyIncome) AS 'Media Anual de Salario'
FROM
	DimCustomer

