CREATE OR ALTER TRIGGER trgModifyDimCurrency
on DimCurrency
AFTER INSERT, UPDATE
AS 
BEGIN
	-- PRINT 'Os dados da tabela DimCurrency foram alterados'
	SELECT * FROM INSERTED
END;

-- update DimCurrency set CurrencyName='Afghani2' where [CurrencyKey]=1


-- insert into DimCurrency(CurrencyAlternateKey, CurrencyName) values ('NEW', 'New Currency');



CREATE OR ALTER TRIGGER trgDeleteDimCurrency
on DimCurrency
AFTER DELETE
AS 
BEGIN
	-- PRINT 'Os dados da tabela DimCurrency foram alterados'
	SELECT * FROM DELETED;
END;




DELETE FROM DimCurrency WHERE CurrencyAlternateKey='NEW'



CREATE OR ALTER TRIGGER trgNewModifyDimCurrency
on DimCurrency
AFTER INSERT, UPDATE, DELETE
AS 
BEGIN	
	if EXISTS(SELECT * FROM INSERTED) AND EXISTS(SELECT * FROM DELETED)
		 PRINT 'Os dados da tabela DimCurrency foram alterados com Sucesso!!!'
	ELSE IF EXISTS(SELECT * FROM INSERTED)
		 PRINT 'Os dados da tabela DimCurrency foram inseridos com Sucesso!!!'
	ELSE IF EXISTS(SELECT * FROM DELETED)
	     PRINT 'Os dados da tabela DimCurrency foram excluidos com Sucesso!!!'
END;

ENABLE TRIGGER trgNewModifyDimCurrency ON DimCurrency;





DISABLE TRIGGER  ALL ON DimCurrency;



DROP TRIGGER trgNewModifyDimCurrency




