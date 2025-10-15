-- Para criar uma tabela com o total de vendas por região e incluir uma coluna de ranking, você pode usar as funções de agregação junto com a 
--função de janela. A consulta que você forneceu está quase correta, mas a função RANK() deve ser ajustada para usar uma subconsulta ou uma 
-- CTE (Common Table Expression), já que não podemos usar funções de janela diretamente em uma cláusula SELECT que inclui funções de agregação como SUM().



--Consulta com Ranking Utilizando GROUP BY
-- Funções de Classificação: Ranking com GROUP BY
WITH VendasPorRegiao AS (
    SELECT
        Region AS 'Região',
        SUM(QuantitySold) AS 'Total Vendido'
    FROM
        stores
    GROUP BY
        Region
)

SELECT
    Região,
    [Total Vendido],
    RANK() OVER (ORDER BY [Total Vendido] DESC) AS 'Rank'
FROM
    VendasPorRegiao
ORDER BY
    [Rank];  -- Ordenação pelo Rank