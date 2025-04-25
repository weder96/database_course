-- [SQL Server] Ordenando e filtrando dados
-- database => AdventureWorksDW2019
-- Where mais Not - Negando o filtro utilizado

-- Podemos filtrar os dados nas nossas tabelas utilizando o comando WHERE

-- Quais funcionarios NAO sao do departamento de 'Marketing'?

SELECT * FROM DimEmployee
WHERE NOT DepartmentName = 'Marketing'