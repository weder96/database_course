
CREATE OR ALTER TRIGGER trgRollbackTables
on DATABASE
FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE
AS 
BEGIN
	PRINT 'Não é permitido criação, alteração ou exclusão das tabelas.'
	ROLLBACK
END;
