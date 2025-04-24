-- [SQL Server] [Subqueries e CTE's] Nomeando colunas de uma CTE
-- database = AdventureWorksDW2019
-- Exemplo: Crie uma CTE que seja o resultado do agrupamento de total de produtos por status. Faça um select .
WITH currentStatus(situation, total) AS (
	  SELECT                       
        status,
        count(*) 
    FROM DimProduct pro
    where pro.ListPrice IS NOT NULL
	group by  status
)
SELECT situation,Total FROM currentStatus