-- [SQL Server] Introdução ao SQL
-- database => AdventureWorksDW2019
--  Criando comentários em SQL

-- Comentários em códigos têm 3 grandes finalidades:

-- 1. Criar uma frase que explica o funcionamento de um determinado código
-- Este código seleciona as colunas de ID do produto e nome do produto da tabela de produto
SELECT
	ProductKey,
	EnglishProductName
FROM
	DimProduct

-- 2. Comentar apenas parte de um código (para não apagar) e executar o restante
SELECT 
	--EmployeeKey, 
	FirstName, 
	LastName ,
	Title, 
	HireDate --data da contratação
FROM DimEmployee

-- 3. Comentar todo o trecho de um código utilizando o /* ... */
/*
SELECT
	StoreKey,
	StoreName,
	StorePhone
FROM
	DimStore
*/

SELECT * FROM DimProduct