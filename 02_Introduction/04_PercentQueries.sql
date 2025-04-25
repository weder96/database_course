-- [SQL Server] Introdução ao SQL
-- database => AdventureWorksDW2019
-- SELECT TOP e TOP PERCENT

-- Comando SELECT TOP(N) e TOP(N) PERCENT: Retorna as N primeiras linhas

-- 1. Crie um código que retorna as 10 primeiras linhas da tabela de Produtos.

SELECT TOP(10) * FROM DimProduct



-- 2. Retorna as 10% primeiras linhas da tabela de Clientes

SELECT TOP(10) PERCENT * FROM DimCustomer