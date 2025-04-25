-- [SQL Server] Ordenando e filtrando dados
-- database => AdventureWorksDW2019
-- Where mais IN - Alternativa ao OR com multiplas condiçoes

-- Podemos utilizar o operador IN como alternativa aos multiplos OR.

-- Exemplo: Selecione os funcionarios que sao de qualquer um desses 3 departamentos: Production, Marketing, Engineering.

SELECT * FROM DimEmployee
WHERE DepartmentName IN ('Production', 'Marketing', 'Engineering')