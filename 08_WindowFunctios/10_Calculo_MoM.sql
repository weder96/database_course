
-- Funções de Janela
-- database = WF
-- FUNÇÕES DE OFFSET (Deslocamento): LAG e LEAD
-- Cálculo MoM

SELECT
	Data_Fechamento AS 'Data do Fechamento',
	Faturamento_MM AS 'Faturamento Total (em milhões)',
	FORMAT((Faturamento_MM/NULLIF(LAG(Faturamento_MM, 1, 0) OVER(ORDER BY Data_Fechamento), 0)) - 1, '0.00%') AS 'Crescimento MoM'
FROM Sales
ORDER BY [Data do Fechamento]