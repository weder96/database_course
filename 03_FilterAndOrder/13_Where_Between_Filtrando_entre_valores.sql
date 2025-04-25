-- [SQL Server] Ordenando e filtrando dados
-- database => AdventureWorksDW2019
-- Where mais Between - Filtrando entre valores

-- 1. Selecione os funcionarios que tem a data de contratacao entre '01-01-2010' e '31-12-2010'.

SELECT * FROM DimEmployee
WHERE HireDate BETWEEN '2010-01-01' AND '2010-12-31'