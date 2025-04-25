-- [SQL Server] Variáveis
-- Utilizando uma variável em uma consulta (Parte 1)


-- Aplique um desconto de 10% em todos os preços dos produtos. Sua consulta final deve conter as colunas ProductKey, ProductName, UnitPrice e Preço com Desconto. 

DECLARE @varDesconto FLOAT
SET @varDesconto = 0.1

SELECT 
	ProductKey AS 'ID',
	EnglishProductName AS 'Nome do Produto',
	ListPrice AS 'Preço',
	ListPrice * (1 - @varDesconto) AS 'Preço com Desconto'
FROM
	DimProduct