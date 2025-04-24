-- Functions

-- 1. O que é uma Function?

-- Uma function é um conjunto de comandos que executam ações e retorna um valor escalar. As functions ajudam a simplificar um código. Por exemplo, se você tem um cálculo complexo que aparece diversas vezes no seu código, em vez de repetir várias vezes aquela série de comandos, você pode simplesmente criar uma função e reaproveitá-la sempre que precisar.

-- O próprio SQL tem diversas funções prontas e até agora, já vimos vários exemplos de funções deste tipo, como funções de data, texto, e assim vai.


-- Podemos visualizar as funções do sistema na pasta Programação > Funções > Funções do Sistema






DROP FUNCTION fnFullDate

select CONCAT(Firstname,' ',LastName) as name,
EmailAddress, 
BirthDate,
[dbo].fnFullDate(BirthDate) as 'birthExtension'
from  DimCustomer


CREATE OR ALTER FUNCTION fnFullDate(@data as date) 
returns varchar(max)
BEGIN
RETURN DATENAME(DW,@data)+' , '+
	   DATENAME(D,@data)+' of '+
	   DATENAME(M,@data)+' of '+
	   DATENAME(YY,@data);
END;



select CONCAT(Firstname,' ',LastName) as name,
EmailAddress, 
BirthDate,
DATENAME(DW,BirthDate)+' , '+
DATENAME(D,BirthDate)+' of '+
DATENAME(M,BirthDate)+' of '+
DATENAME(YY,BirthDate) as 'birthExtension'
from  DimCustomer