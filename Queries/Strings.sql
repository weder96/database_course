

SELECT CASE WHEN 42 > 23 THEN 'I knew that!' ELSE 'That is not true.' END AS iif_result


SELECT IIF (42 > 23, 'I knew that!', 'That is not true.') AS iif_result




SELECT CHOOSE (1, 'apples', 'pears', 'oranges', 'bananas') AS chosen_result





SELECT CHARINDEX('is', 'this is my string') -- returns 3
SELECT CHARINDEX('is', 'this is my string', 4) -- returns 6
SELECT CHARINDEX(' is', 'this is my string') -- returns 5





SELECT REPLICATE('a', -1)-- Returns NULL
SELECT REPLICATE('a', 0)-- Returns ''
SELECT REPLICATE('a', 5)-- Returns 'aaaaa'
SELECT REPLICATE('Abc', 3) -- Returns 'AbcAbcAbc'





Select REVERSE('Sql Server') -- Returns 'revreS lqS'








SELECT STR(1.2) -- Returns '
SELECT STR(1.2, 3) -- Returns '   1'
SELECT STR(1.2, 3, 2) -- Returns '1.2'
SELECT STR(1.2, 5, 2) -- Returns ' 1.20'
SELECT STR(1.2, 5, 5) -- Returns '1.200'
SELECT STR(1, 5, 2) -- Returns ' 1.00'
SELECT STR(1) -- Returns ' 1'



SELECT NCHAR(324) -- Returns 'ā'
SELECT NCHAR(400) -- Returns 'Ɛ'




SELECT UPPER('This IS my STRING') -- Returns 'THIS IS MY STRING'
DECLARE @String nchar(17) = N'This IS my STRING';
SELECT UPPER(@String) -- Returns 'THIS IS MY STRING'





SELECT LOWER('This IS my STRING') -- Returns 'this is my string'
DECLARE @String nchar(17) = N'This IS my STRING';
SELECT LOWER(@String) -- Returns 'this is my string'





SELECT LEN('My string'), -- returns 9
       LEN('My string '), -- returns 9
       LEN('   My string') -- returns 12


DECLARE @str varchar(100) = 'My string '
SELECT LEN(@str + 'x') - 1 -- returns 10

SELECT LEN(CONVERT(NVARCHAR(MAX), @str) + 'x') - 1;

DECLARE @str2 varchar(100) = 'My string  '
SELECT DATALENGTH(@str2) -- returns 11 






SELECT PATINDEX('%ter%', 'interesting') -- Returns 3.
SELECT PATINDEX('%t_r%t%', 'interesting') -- Returns 3.
SELECT PATINDEX('ter%', 'interesting') -- Returns 0, since 'ter' is not at the start.
SELECT PATINDEX('inter%', 'interesting') -- Returns 1.
SELECT PATINDEX('%ing', 'interesting') -- Returns 9.




SELECT RTRIM('This is my string   ') -- Returns 'This is my string'


SELECT LTRIM('   This is my string') -- Returns 'This is my string'




-- Retorna uma string resultante da união de duas ou mais strings. CONCAT aceita dois ou mais argumentos.
SELECT CONCAT('This', ' is', ' my', ' string') -- retorna 'This is my string'

--Observação: Ao contrário da concatenação de strings usando o operador de concatenação de strings (+), ao passar um valor nulo para a
-- função concat, ela o converterá implicitamente em uma string vazia:

SELECT CONCAT('This', NULL, ' is', ' my', ' string'), -- retorna 'This is my string'
'This' + NULL + ' is' + ' my' + ' string' -- retorna NULL.
-- Argumentos de um tipo não string também serão convertidos implicitamente para uma string:
SELECT CONCAT('This', ' is my ', 3, 'rd string') -- retorna 'This is my 3rd string'

--Variáveis ​​de tipo não string também serão convertidas para o formato string, 
-- sem a necessidade de convertê-las ou convertê-las manualmente para string:
DECLARE @Age INT=23;
SELECT CONCAT('Ram is ', @Age,' years old');
-- retorna 'Ram is 23 years old'



-- CURRENCY
DECLARE @Price1 INT = 40
SELECT FORMAT(@Price1,'c','en-US') AS 'CURRENCY IN US Culture' -- Returns '$40.00'
,FORMAT(@Price1,'c','de-DE') AS 'CURRENCY IN GERMAN Culture' -- Returns '40,00 €'

--We can specify the number of digits after the decimal.
DECLARE @Price DECIMAL(5,3) = 40.356
SELECT FORMAT( @Price, 'C') AS 'Default', -- Returns '$40.36'
FORMAT( @Price, 'C0') AS 'With 0 Decimal', -- Returns '$40'
FORMAT( @Price, 'C1') AS 'With 1 Decimal', -- Returns '$40.4'
FORMAT( @Price, 'C2') AS 'With 2 Decimal'; -- Returns '$40.36'

-- PERCENTAGE
DECLARE @Percentage float = 0.35674
SELECT FORMAT( @Percentage, 'P') AS '% Default', -- Returns '35.67 %'
FORMAT( @Percentage, 'P0') AS '% With 0 Decimal', -- Returns '36 %'
FORMAT( @Percentage, 'P1') AS '% with 1 Decimal' -- Returns '35.7 %'

--NUMBER
DECLARE @Number AS DECIMAL(10,2) = 454545.389
SELECT FORMAT( @Number, 'N','en-US') AS 'Number Format in US', -- Returns '454,545.39'
FORMAT( @Number, 'N','en-IN') AS 'Number Format in INDIA', -- Returns '4,54,545.39'
FORMAT( @Number, '#.0') AS 'With 1 Decimal', -- Returns '454545.4'
FORMAT( @Number, '#.00') AS 'With 2 Decimal', -- Returns '454545.39'
FORMAT( @Number, '#,##.00') AS 'With Comma and 2 Decimal', -- Returns '454,545.39'
FORMAT( @Number, '##.00') AS 'Without Comma and 2 Decimal', -- Returns '454545.39'
FORMAT( @Number, '000000000') AS 'Left-padded to nine digits' -- Returns '000454545'



DECLARE @d DATETIME = '2025-04-11';

SELECT FORMAT( @d, 'dd/MM/yyyy', 'en-US' ) AS 'DateTime Result' -- Returns '11/04/2025'
,FORMAT(123456789,'###-##-####') AS 'Custom Number Result' -- Returns '123-45-6789',
,FORMAT( @d,'dddd, MMMM dd, yyyy hh:mm:ss tt','en-US') AS 'US' -- Returns 'Friday, April 11, 2025 12:00:00 AM'
,FORMAT( @d,'dddd, MMMM dd, yyyy hh:mm:ss tt','hi-IN') AS 'Hindi' -- Returns शुक्रवार, अप्रैल 11, 2025 12:00:00 पूर्वाह्न
,FORMAT ( @d, 'dddd', 'en-US' ) AS 'US' -- Returns 'Friday'
,FORMAT ( @d, 'dddd', 'hi-IN' )  AS 'Hindi' -- Returns 'शुक्रवार'




SELECT
FORMAT ( @d, 'd', 'pt-BR' ) AS 'Brazil English Result' -- Returns '11/04/2025'
,FORMAT ( @d, 'd', 'en-US' ) AS 'US English Result' -- Returns '11/04/2025'
,FORMAT ( @d, 'd', 'en-gb' ) AS 'Great Britain English Result' -- Returns 11/04/2025'
,FORMAT ( @d, 'd', 'de-de' ) AS 'German Result' -- Returns '11.04.2025'
,FORMAT ( @d, 'd', 'zh-cn' ) AS 'Simplified Chinese (PRC) Result' -- Returns '2025/4/11'
,FORMAT ( @d, 'D', 'en-US' ) AS 'US English Result' -- Returns 'Friday, April 11, 2025'
,FORMAT ( @d, 'D', 'en-gb' ) AS 'Great Britain English Result' -- Returns '11 April 2025'
,FORMAT ( @d, 'D', 'de-de' ) AS 'German Result' -- Returns 'Freitag, 11. April 2025'





SELECT RIGHT('This is my string', 6) -- returns 'string'
-- If the max length is more then the number of characters in the string, 
-- the entier string is returned.
SELECT RIGHT('This is my string', 50) -- returns 'This is my string'




SELECT LEFT('This is my string', 4) -- result: 'This'
-- If the max length is more then the number of characters in the string, 
-- the entier string is returned.
SELECT LEFT('This is my string', 50) -- result: 'This is my string'




SELECT value FROM STRING_SPLIT('Lorem ipsum dolor sit amet.', ' ');




SELECT REPLACE('This is my string', 'is', 'XX') -- Returns 'ThXX XX my string'


SELECT SUBSTRING('This is my string', 6, 5) -- returns 'is my'
-- If the max length + start index is more then the number 
-- of characters in the string, the entier string is returned.
SELECT SUBSTRING('Hello World',1,100) -- returns 'Hello World'
-- If the start index is bigger then the number of characters 
-- in the string, an empty string is returned.
SELECT SUBSTRING('Hello World',15,10) -- returns ''