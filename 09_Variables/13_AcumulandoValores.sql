-- [SQL Server] Variáveis
-- Acumulando valores dentro de uma variável

-- Exemplo 1: Retorne uma lista com os nomes dos funcionários do departamento de Marketing
DECLARE @ListaNomes VARCHAR(MAX)
SET @ListaNomes = ''

SELECT
	@ListaNomes = @ListaNomes + FirstName + ', ' + CHAR(10)
FROM
	DimEmployee
WHERE DepartmentName = 'Marketing'

PRINT LEFT(@ListaNomes, DATALENGTH(@ListaNomes) - 3)

