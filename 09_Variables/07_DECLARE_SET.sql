-- [SQL Server] Variáveis
-- DECLARE e SET Declarando uma variável

/* 
Declarando Variáveis 

1) O que é uma variável?
Uma variável é um objeto que armazena o valor de um dado.

2. Estrutura

DECLARE @var tipo
SET @var = valor


DECLARE @var1 INT, @var2 INT,
	 @texto VARCHAR(MAX),
	 @data DATETIME
	
SET @var1 = 10
SET @var1 = 45
SET @texto = 'Um texto qualquer'
SET @data = '18/02/2021'

*/

SELECT 100 * 8.99 AS 'faturamento'

DECLARE @quantidade AS int, @preco AS float
SET @quantidade = 100
SET @preco = 8.99

SELECT @quantidade * @preco AS 'faturamento'

-- Exemplo 1: Declare uma variável chamada 'idade' e armazene o valor 30

DECLARE @idade AS INT

SET @idade = 30

SELECT @idade

-- Exemplo 2: Declare uma variável chamada 'preco' e armazene o valor 10.89

DECLARE @preco3 AS float
SET @preco3 = 10.89
SELECT @preco3

DECLARE @preco2 AS decimal(5, 2)
SET @preco2 = 10.89
SELECT @preco2



-- Exemplo 3: Declare uma variável chamada 'nome' e armazene o valor 'Mateus'

DECLARE @nome AS varchar(50)
SET @nome = 'Mateus'
SELECT @nome

-- Exemplo 4: Declare uma variável chamada 'data' e armazene a data de hoje.

DECLARE @data AS datetime
SET @data = '2021-10-28'
SELECT @data

SELECT DAY(@data)