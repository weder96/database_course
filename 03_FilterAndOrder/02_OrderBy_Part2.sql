-- [SQL Server] Ordenando e filtrando dados
-- database => AdventureWorksDW2019
-- Order By (Parte 2)
-- Selecionando as TOP 10 linhas da tabela DimProduct, ordenando pelas colunas ListPrice (decrescente) e Weight (decrescente)

SELECT 
	TOP(10) 
	EnglishProductName,
	ListPrice,
	Weight
FROM
	DimProduct
ORDER BY ListPrice DESC, Weight DESC