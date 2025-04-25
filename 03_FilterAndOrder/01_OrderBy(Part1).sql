-- [SQL Server] [Ordenando e filtrando dados] Order By (Parte 1)
-- database => AdventureWorksDW2019
-- Selecionando as TOP 100 linhas da tabela DimProduct, ordenando pela coluna ProductKey de forma decrescente

SELECT 
TOP(100) * 
FROM DimProduct
ORDER BY ProductKey DESC