-- [SQL Server] Ordenando e filtrando dados
-- database => AdventureWorksDW2019
-- Where - Filtrando colunas de texto

-- Podemos filtrar os dados nas nossas tabelas utilizando o comando WHERE

-- Quais produtos sao da status 'Current'?
SELECT * FROM DimProduct
WHERE status = 'Current'

-- Quais produtos sao da cor 'Black'?
SELECT * FROM DimProduct
WHERE Color = 'Black'