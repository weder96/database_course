-- Funções de Janela
-- Cálculo de soma móvel e média móvel

CREATE TABLE Sales (
    Data_Fechamento DATETIME,
    Faturamento_MM FLOAT
);

INSERT INTO Sales(Data_Fechamento, Faturamento_MM) VALUES
    ('2020-01-01', 8),
    ('2020-02-01', 10),
    ('2020-03-01', 6),
    ('2020-04-01', 9),
    ('2020-05-01', 5),
    ('2020-06-01', 4),
    ('2020-07-01', 7),
    ('2020-08-01', 11),
    ('2020-09-01', 9),
    ('2020-10-01', 12),
    ('2020-11-01', 11),
    ('2020-12-01', 10);

-- Consultas para Soma Móvel e Média Móvel
-- Agora, vamos criar as consultas SQL para calcular a soma móvel e a média móvel dos faturamentos.
-- Soma Móvel

SELECT
    Data_Fechamento AS 'Data do Fechamento',
    Faturamento_MM AS 'Faturamento Total (em milhões)',
    SUM(Faturamento_MM) OVER(ORDER BY Data_Fechamento ROWS BETWEEN 1 PRECEDING AND CURRENT ROW) AS 'Fat. Acumulado (em milhões)'
FROM Sales
ORDER BY [Data do Fechamento];



-- Média móvel
SELECT
    Data_Fechamento AS 'Data do Fechamento',
    Faturamento_MM AS 'Faturamento Total (em milhões)',
    AVG(Faturamento_MM) OVER(ORDER BY Data_Fechamento ROWS BETWEEN 1 PRECEDING AND CURRENT ROW) AS 'Fat. Médio (em milhões)'
FROM Sales
ORDER BY [Data do Fechamento];