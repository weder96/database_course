-- [SQL Server] Variáveis
-- RINT - Printando uma mensagem na tela

-- Exemplo 1: Printe na tela a quantidade de lojas On e a quantidade  de lojas Off da tabela DimStore. Utilize variáveis para isso.

DECLARE @varLojasOn INT, @varLojasOff INT
SET @varLojasOn = (SELECT COUNT(*) FROM DimReseller WHERE ProductLine = 'Road')
SET @varLojasOff = (SELECT COUNT(*) FROM DimReseller WHERE ProductLine = 'Mountain')

SELECT @varLojasOn AS 'Road', @varLojasOff AS 'Mountain'

PRINT 'O total de Road é de ' + CAST(@varLojasOn AS VARCHAR(30))
PRINT 'O total de Mountain é de ' + CAST(@varLojasOff AS VARCHAR(30))