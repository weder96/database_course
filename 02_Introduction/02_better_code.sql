-- [SQL Server] Introdução ao SQL
-- database => AdventureWorksDW2019
--Como organizar melhor os códigos com indentação

-- Para organizar melhor os seus códigos, pule linhas. Abaixo temos dois exemplos de códigos que chegam no mesmo resultado, só que na versão 1, 
-- não utilizamos a indentação, e na versão 2, usamos. Observe que fica muito mais organizado.

-- versão 1
-- Selecionando todas as linhas e colunas da tabela DimCustomer
SELECT * FROM DimCustomer

-- versão 2
SELECT 
* 
FROM DimCustomer

-- Selecionando todas as linhas da tabela DimCustomer, especificamente as colunas StoreKey, StoreName, StorePhone
-- versão 1
SELECT EmployeeKey, FirstName, LastName ,Title, HireDate FROM DimEmployee

-- versão 2
SELECT 
	 EmployeeKey, FirstName, LastName ,Title, HireDate 
FROM DimEmployee
