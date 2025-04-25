-- [SQL Server] Ordenando e filtrando dados
-- database => AdventureWorksDW2019
-- Where mais Or - Filtrando com mais de uma condiçao

-- Podemos filtrar os dados nas nossas tabelas utilizando o comando WHERE
-- Quais produtos sao da Status 'Current' OU sao da cor 'White'?

SELECT * FROM DimProduct
WHERE Status = 'Current' OR Color = 'White'
