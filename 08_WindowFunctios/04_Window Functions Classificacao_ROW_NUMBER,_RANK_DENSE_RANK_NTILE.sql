--Consultas de Classificação
-- Funções de Classificação para a tabela Stores, focando na região "Southeast"
SELECT
    StoreID,
    StoreName,
    Region,
    QuantitySold,
    ROW_NUMBER() OVER(ORDER BY QuantitySold DESC) AS 'RowNumber',
    RANK() OVER(ORDER BY QuantitySold DESC) AS 'Rank',
    DENSE_RANK() OVER(ORDER BY QuantitySold DESC) AS 'DenseRank',
    NTILE(3) OVER(ORDER BY QuantitySold DESC) AS 'Ntile'
FROM
    Stores
WHERE
    Region = 'Southeast'
ORDER BY
    QuantitySold DESC;