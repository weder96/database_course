-- 1. CASE WHEN: Para Criar Novas Categorias
-- A declaração CASE é a forma mais comum e poderosa de criar uma lógica condicional dentro de uma consulta. Você pode usá-la para criar uma nova coluna baseada em regras de negócio.

-- Exemplo 1: Categorizar Vendas por Valor
-- Vamos consultar a tabela de vendas (FactInternetSales) e criar uma nova coluna chamada NivelVenda que classifica cada venda como 'Alta', 'Média' ou 'Baixa'.


SELECT
    SalesOrderNumber,
    OrderDate,
    SalesAmount,
    CASE
        WHEN SalesAmount > 2000 THEN 'Venda Alta'
        WHEN SalesAmount > 500 AND SalesAmount <= 2000 THEN 'Venda Média'
        ELSE 'Venda Baixa'
    END AS NivelVenda
FROM
    FactInternetSales
WHERE
    OrderDate >= '2013-01-01'; -- Filtrando para um período menor


    Exemplo 2: Classificar Clientes por Renda Anual
Vamos usar a tabela de clientes (DimCustomer) para segmentá-los em faixas de renda.



SELECT
    FirstName,
    LastName,
    YearlyIncome,
    CASE
        WHEN YearlyIncome > 100000 THEN 'Renda Alta'
        WHEN YearlyIncome > 50000 THEN 'Renda Média'
        ELSE 'Renda Baixa'
    END AS FaixaDeRenda
FROM
    DimCustomer;




-- 2. IIF(): Uma Alternativa Simples para o CASE
-- A função IIF() é uma forma mais curta de escrever um CASE quando há apenas duas opções (uma condição verdadeira e uma falsa). A sintaxe é IIF(condição, valor_se_verdadeiro, valor_se_falso).

-- Exemplo: Verificar se um Cliente Possui Filhos
-- Vamos criar uma coluna que diga de forma clara se um cliente tem filhos ou não, com base na coluna TotalChildren.

SELECT
    FirstName,
    LastName,
    TotalChildren,
    IIF(TotalChildren > 0, 'Possui Filhos', 'Não Possui Filhos') AS StatusParental
FROM
    DimCustomer;

-- 3. Condicionais na Cláusula WHERE
-- Esta é a forma mais básica de condicional, usada para filtrar as linhas que você quer que apareçam no resultado. Você pode combinar múltiplas condições com AND e OR.

--Exemplo: Encontrar Produtos Vermelhos e Caros
-- Vamos buscar na tabela de produtos (DimProduct) apenas os produtos que são da cor 'Red' (vermelho) e que custam mais de $1000.


SELECT
    EnglishProductName,
    Color,
    ListPrice
FROM
    DimProduct
WHERE
    Color = 'Red' AND ListPrice > 1000;


-- 4. Condicionais na Cláusula HAVING
-- A cláusula HAVING é usada para aplicar uma condição a um grupo de dados, depois que eles já foram agregados por uma função como SUM(), COUNT(), AVG(), etc.

-- Exemplo: Encontrar Categorias de Produtos com Vendas Acima de $5,000,000
-- Vamos agrupar as vendas por categoria de produto e mostrar apenas as categorias que tiveram um total de vendas superior a 5 milhões de dólares.


SELECT
    pc.EnglishProductCategoryName,
    SUM(fis.SalesAmount) AS TotalVendas
FROM
    FactInternetSales AS fis
JOIN DimProduct AS p ON fis.ProductKey = p.ProductKey
JOIN DimProductSubcategory AS psc ON p.ProductSubcategoryKey = psc.ProductSubcategoryKey
JOIN DimProductCategory AS pc ON psc.ProductCategoryKey = pc.ProductCategoryKey
GROUP BY pc.EnglishProductCategoryName
HAVING SUM(fis.SalesAmount) > 5000000 -- Condição aplicada APÓS a agregação
ORDER BY TotalVendas DESC;