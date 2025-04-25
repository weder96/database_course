-- [SQL Server] Ordenando e filtrando dados
-- database => AdventureWorksDW2019
-- Where mais And - Filtrando com mais de uma condiçao

-- Podemos filtrar os dados nas nossas tabelas utilizando o comando WHERE

-- Quais produtos sao da marca 'Current' E TAMBeM sao da cor 'Black'?

SELECT * FROM DimProduct
WHERE Status = 'Current' AND Color = 'Black'