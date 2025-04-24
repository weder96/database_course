--Consultas de Classificação com Particionamento por Região
-- Funções de Classificação para a tabela Stores, particionando por região
SELECT
    StoreID,
    StoreName,
    Region,
    QuantitySold,
    ROW_NUMBER() OVER(PARTITION BY Region ORDER BY QuantitySold DESC) AS 'RowNumber',
    RANK() OVER(PARTITION BY Region ORDER BY QuantitySold DESC) AS 'Rank',
    DENSE_RANK() OVER(PARTITION BY Region ORDER BY QuantitySold DESC) AS 'DenseRank',
    NTILE(3) OVER(PARTITION BY Region ORDER BY QuantitySold DESC) AS 'Ntile'
FROM
    Stores
ORDER BY
    Region, QuantitySold DESC;  -- Ordenação por região e quantidade vendida