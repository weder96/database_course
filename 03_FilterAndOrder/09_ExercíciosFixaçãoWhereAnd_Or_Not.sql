-- [SQL Server] Ordenando e filtrando dados
-- database => AdventureWorksDW2019
-- Cuidados ao combinar os operadores AND e OR

-- Podemos filtrar os dados nas nossas tabelas utilizando o comando WHERE

-- 3. Selecione todas as linhas da tabela DimEmployee com funcionarios da DepartmentName Production OU da Production Finance AND da SalesTerritoryKey 11.

SELECT * FROM DimEmployee
WHERE (DepartmentName = 'Production' OR DepartmentName = 'Finance') AND SalesTerritoryKey = 11

-- Obs: Lembre-se de incluir parenteses para agrupar os testes logicos que voce deseja fazer ao mesmo tempo, para assim chegar no resultado que voce espera.