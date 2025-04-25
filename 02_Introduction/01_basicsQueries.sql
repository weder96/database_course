-- [SQL Server] Introdução ao SQL
-- database => AdventureWorksDW2019
-- Criando uma Nova Consulta e usando SELECT FROM

-- 1. Antes de executar os códigos, garanta que o banco de dados correto está selecionado no canto superior esquerdo: banco de dados AdventureWorksDW2019
-- 2. Sempre que executar um código, selecione todo ele para não ter problemas


-- Selecionando todas as linhas e colunas da tabela DimCustomer
SELECT * FROM DimCustomer

-- Selecionando todas as linhas e colunas da tabela DimEmployee
SELECT * FROM DimEmployee

-- Selecionando todas as linhas da tabela DimEmployee, especificamente as colunas EmployeeKey, FirstName, LastName ,Title, HireDate
SELECT EmployeeKey, FirstName, LastName ,Title, HireDate FROM DimEmployee

-- Selecionando todas as linhas e colunas da tabela DimProduct
SELECT * FROM DimProduct

-- Selecionando todas as linhasda tabela DimProduct, especificamente as colunas EnglishProductName, Status
SELECT ProductKey ,EnglishProductName,ProductLine Status FROM DimProduct