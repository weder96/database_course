-- [SQL Server] Ordenando e filtrando dados
-- database => AdventureWorksDW2019
-- Where mais Like - Filtro especial para textos

-- 1. Selecione todos os produtos que possuem o texto 'Decal' contido na nome do produto.

SELECT * FROM DimProduct
WHERE EnglishProductName LIKE '%Decal%'


-- 2. Selecione todos os produtos que tem a EnglishProductName do nome comecando por 'Flat'.

SELECT * FROM DimProduct
WHERE EnglishProductName LIKE 'Flat%'

-- 3. Selecione todos os produtos que trm a EnglishProductName do nome terminando em 'WMA'.

SELECT * FROM DimProduct
WHERE EnglishProductName LIKE '%10'
