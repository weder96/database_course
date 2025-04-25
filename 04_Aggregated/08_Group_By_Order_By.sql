-- [SQL Server] Criando agrupamentos no SQL
-- database => AdventureWorksDW2019
-- Order By


SELECT * FROM DimReseller

SELECT
	BusinessType,
	SUM(NumberEmployees) AS 'Qtd. Total Funcionarios'
FROM
	DimReseller
GROUP BY BusinessType
ORDER BY SUM(NumberEmployees) DESC
