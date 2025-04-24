-- [SQL Server] [Subqueries]  Subquery aninhada
-- database = AdventureWorksDW2019
-- Exemplo: Descubra os nomes dos clientes que ganham o segundo maior salário.

SELECT * FROM DimCustomer
WHERE EnglishOccupation = 'Management'
ORDER BY YearlyIncome DESC

SELECT DISTINCT TOP(2) YearlyIncome FROM DimCustomer
WHERE EnglishOccupation = 'Management'
ORDER BY YearlyIncome DESC

SELECT
	CustomerKey,
	FirstName,
	LastName,
	YearlyIncome
FROM DimCustomer
WHERE YearlyIncome = 160000


--1. Descobrir o maior salário
--2. Descobrir o segundo maior salário
--3. Descobrir os nomes dos clientes que ganham o segundo maior salário



SELECT
	CustomerKey,
	FirstName,
	LastName,
	YearlyIncome
FROM DimCustomer
WHERE YearlyIncome = (
	SELECT
		MAX(YearlyIncome)
	FROM DimCustomer
	WHERE
		YearlyIncome < ( 
			SELECT 
				MAX(YearlyIncome) -- Renda Anual
			FROM DimCustomer	
			WHERE EnglishOccupation = 'Management'
	)
)
