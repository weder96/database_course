-- [SQL Server] Variáveis
-- Aula 12 de 23: Utilizando uma variável em uma consulta (Parte 2)

-- Crie uma variável de data para otimizar a consulta abaixo. 

DECLARE @varData DATETIME
SET @varData = '1980-01-01'

SELECT 
	FirstName AS 'Nome',
	LastName AS 'Sobrenome',
	BirthDate AS 'Nascimento',
	'Cliente' AS 'Tipo'
FROM	
	DimCustomer
WHERE BirthDate >= @varData

UNION

SELECT 
	FirstName AS 'Nome',
	LastName AS 'Sobrenome',
	BirthDate AS 'Nascimento',
	'Funcionário' AS 'Tipo'
FROM	
	DimEmployee
WHERE BirthDate >= @varData
ORDER BY Nascimento