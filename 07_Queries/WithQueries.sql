-- [SQL Server] [Subqueries] WITH - O que é e como criar
-- database = AdventureWorksDW2019
-- No SQL Server, a cláusula WITH é geralmente usada para criar uma CTE (Common Table Expression), que permite criar consultas temporárias que
-- podem ser referenciadas dentro de uma instrução SELECT, INSERT, UPDATE ou DELETE. Vamos criar um exemplo simples que ilustra como usar uma CTE.
-- Exemplo: Crie uma CTE para armazenar o resultado de uma consulta que contenha: ProductKey, ProductName, BrandName, ColorName e UnitPrice, apenas para a marca Contoso.

WITH currentStatus AS (
    SELECT 
        DISTINCT
        ProductKey AS [key],
        EnglishProductName AS [name],
        status AS [situation],
        Color AS [nColor],
        ListPrice AS [price]
    FROM DimProduct pro
    WHERE pro.status = 'Current' AND pro.ListPrice IS NOT NULL
)
SELECT COUNT(*) FROM currentStatus

