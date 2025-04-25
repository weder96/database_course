-- [SQL Server] Variáveis
-- Armazenando o resultado de um SELECT em uma variável

-- Exemplo 1: Crie uma variável para armazenar a quantidade total de funcionários da tabela DimEmployee.

DECLARE @varTotalFuncionarios INT
SET @varTotalFuncionarios = (SELECT COUNT(*) FROM DimEmployee)
SELECT @varTotalFuncionarios


-- Exemplo 2: Crie uma variável para armazenar a quantidade total de lojas com o status Off.

DECLARE @varLojasOff INT
SET @varLojasOff = (SELECT COUNT(*) FROM DimReseller WHERE ProductLine='Road')
SELECT @varLojasOff