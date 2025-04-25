-- Funções de Janela
-- database = WF
-- FUNÇÕES DE OFFSET (Deslocamento): LAG e LEAD

SELECT
	Data_Fechamento AS 'Data do Fechamento',
	Faturamento_MM AS 'Faturamento Total (em milhões)',
	LAG(Faturamento_MM, 1, 0) OVER(ORDER BY Data_Fechamento) AS 'Fat. Mês Anterior',
	LEAD(Faturamento_MM, 1, 0) OVER(ORDER BY Data_Fechamento) AS 'Fat. Mês Seguinte'
FROM Sales
ORDER BY [Data do Fechamento]