-- [SQL Server] [Subqueries e CTE's] Calculando agregações com CTE
-- database = AdventureWorksDW2019
-- Exemplo: Crie uma CTE que seja o resultado do agrupamento de total de produtos por status. Faça uma média de produtos por status.

WITH currentStatus AS (
	  SELECT                       
        status AS [situation],
        count(*) as 'total'
    FROM DimProduct pro
    where pro.ListPrice IS NOT NULL
	group by  status
)
SELECT AVG(Total) as 'media' FROM currentStatus