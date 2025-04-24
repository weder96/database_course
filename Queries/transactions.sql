--BEGIN TRANSACTION T1
--BEGIN TRANSACTION T2
--BEGIN TRANSACTION T3
COMMIT TRANSACTION T2
print @@TRANCOUNT



BEGIN TRY -- start error handling
	BEGIN TRANSACTION; -- from here on transactions (modifictions) are not final
		-- start your statement(s)
			select 42/0 as ANSWER -- simple SQL Query with an error
		-- end your statement(s)
	COMMIT TRANSACTION; -- finalize all transactions (modifications)
END TRY
-- end error handling -- jump to end
BEGIN CATCH -- execute this IF an error occurred
	ROLLBACK TRANSACTION; -- undo any transactions (modifications)
	-- put together some information as a query
	SELECT
		ERROR_NUMBER() AS ErrorNumber
		,ERROR_SEVERITY() AS ErrorSeverity
		,ERROR_STATE() AS ErrorState
		,ERROR_PROCEDURE() AS ErrorProcedure
		,ERROR_LINE() AS ErrorLine
		,ERROR_MESSAGE() AS ErrorMessage;
END CATCH; -- final line of error handling
GO -- execute previous code




CREATE TABLE test_transaction (column_1 varchar(10))
GO
INSERT INTO dbo.test_transaction ( column_1 ) VALUES ( 'a' );

BEGIN TRANSACTION --This is the beginning of your transaction
UPDATE dbo.test_transaction SET column_1 = 'B' OUTPUT INSERTED.* WHERE column_1 = 'A'

ROLLBACK TRANSACTION --Rollback will undo your changes

--Alternatively, use COMMIT to save your results

SELECT * FROM dbo.test_transaction

--View the table after your changes have been run
DROP TABLE dbo.test_transaction

