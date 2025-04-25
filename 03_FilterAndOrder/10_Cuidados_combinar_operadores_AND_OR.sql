-- [SQL Server] Ordenando e filtrando dados
-- database => AdventureWorksDW2019
-- Aula 12 de 27: Cuidados ao combinar os operadores AND e OR

-- Podemos filtrar os dados nas nossas tabelas utilizando o comando WHERE

-- Exemplo: Selecione todas as linhas da tabela DimProduct onde a cor do Produto pode ser igual a Preto OU Vermelho, MAS a marca deve ser obrigatoriamente igual a Fabrikam.

SELECT * FROM DimProduct
WHERE (ColorName = 'Black' OR ColorName = 'Red') AND BrandName = 'Fabrikam'

-- Obs: Lembre-se de incluir par�nteses para agrupar os testes l�gicos que voc� deseja fazer ao mesmo tempo, para assim chegar no resultado que voc� espera.