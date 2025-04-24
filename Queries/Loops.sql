-- [SQL Server] Loops no SQL

-- Loop While
-- 1. Crie um contador que faça uma contagem de 1 até 10 utilizando a estrutura de repetição WHILE

DECLARE @vContador INT
SET @vContador = 1

WHILE @vContador <= 10
BEGIN
	PRINT 'O valor do contador é: ' + CONVERT(VARCHAR, @vContador)
	SET @vContador = @vContador + 1
END

-- 2. Cuidado com loops infinitos!!!

DECLARE @vContador INT
SET @vContador = 1

WHILE @vContador <= 5
BEGIN
	PRINT 'Alguém pare esse contador!!!'
END


-- 3. Faça um contador de 1 a 100. OBS: Se o valor do contador for igual a 15, então o loop WHILE deve ser encerrado

DECLARE @vContador INT
SET @vContador = 1

WHILE @vContador <= 100
BEGIN
	PRINT 'O valor do contador é: ' + CONVERT(VARCHAR, @vContador)
	IF @vContador = 15
	BREAK
	SET @vContador = @vContador + 1
END

-- 4. Faça um contador de 1 a 100. OBS: Os números 3 ou 6 não podem ser printados na tela

DECLARE @varContador INT
SET @varContador = 0

WHILE @varContador <= 10
BEGIN
    SET @varContador += 1
    IF @varContador = 3 OR @varContador = 6
        CONTINUE
    PRINT @varContador
END