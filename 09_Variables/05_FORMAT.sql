-- [SQL Server] Variáveis
-- FORMAT - Formatação de dados personalizada

-- FORMAT: Função para formatação de valores no SQL

-- a) Numéricos:
SELECT FORMAT(1000, 'N') AS FormattedNumeric_N; -- Formatação numérica padrão
SELECT FORMAT(1000, 'G') AS FormattedNumeric_G; -- Formatação numérica geral

-- b) Personalizados:
SELECT FORMAT(123456789, '###-##-####') AS FormattedCustom; -- Formatação personalizada

-- c) Data (em formato YYYY-DD-MM):
SELECT FORMAT(CAST('2021-03-21' AS DATETIME), 'yyyy-dd-MM') AS FormattedDateYDM; -- Data em formato YYYY-DD-MM

-- SQL_VARIANT_PROPERTY para datas
SELECT SQL_VARIANT_PROPERTY('2014-05-31', 'BaseType') AS VariantPropertyDateString; -- Data em formato de string
SELECT SQL_VARIANT_PROPERTY(CAST('2014-05-31' AS DATETIME), 'BaseType') AS VariantPropertyDateDatetime; -- Tipo de base após conversão para DATETIME