-- [SQL Server] Ordenando e filtrando dados
-- database => AdventureWorksDW2019
-- Where mais Is Null e Is Not Null - Filtrando valores nulos

-- 1. Selecione os clientes que MiddleName e Nulo.

SELECT * FROM DimCustomer
WHERE MiddleName IS NULL