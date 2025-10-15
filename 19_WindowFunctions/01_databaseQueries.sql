-- Criar o banco de dados
CREATE DATABASE WF;
GO

-- Usar o banco de dados
USE WF;
GO

-- Criar a tabela Lojas (em inglês)
CREATE TABLE Stores (
    StoreID INT,
    StoreName VARCHAR(100),
    Region VARCHAR(100),
    QuantitySold FLOAT,
    Address VARCHAR(200),
    OpeningDate DATE,
    ManagerName VARCHAR(100)
);

-- Inserir dados na tabela Stores
INSERT INTO Stores(StoreID, StoreName, Region, QuantitySold, Address, OpeningDate, ManagerName)
VALUES
    (1, 'Botafogo Praia & Mar', 'Southeast', 1800, 'Rua Botafogo, 123', '2010-05-15', 'Carlos Silva'),
    (2, 'Lojas Vitória', 'Southeast', 800, 'Avenida Brasil, 456', '2015-03-21', 'Ana Lima'),
    (3, 'Empório Mineirinho', 'Southeast', 2300, 'Rua Minas Gerais, 789', '2012-07-10', 'Felipe Costa'),
    (4, 'Central Paulista', 'Southeast', 1800, 'Avenida Paulista, 101', '2011-12-01', 'Mariana Oliveira'),
    (5, 'Rio 90 Graus', 'Southeast', 700, 'Rua do Rio, 202', '2016-09-20', 'Jéssica Santos'),
    (6, 'Casa Flor & Anópolis', 'South', 2100, 'Rua das Flores, 303', '2013-08-15', 'Roberto Almeida'),
    (7, 'Pampas & Co', 'South', 990, 'Avenida da Pampas, 404', '2014-02-10', 'Sofia Martins'),
    (8, 'Paraná Papéis', 'South', 2800, 'Rua Paraná, 505', '2015-11-30', 'Lucas Ferreira'),
    (9, 'Amazonas Prime', 'North', 4200, 'Rua Amazonas, 606', '2012-04-25', 'Patrícia Ribeiro'),
    (10, 'Pará Bens', 'North', 3200, 'Avenida Pará, 707', '2011-01-14', 'Tiago Gomes'),
    (11, 'Tintas Rio Branco', 'North', 1500, 'Rua Rio Branco, 808', '2015-05-15', 'Clarice Melo'),
    (12, 'Nordestemido Hall', 'Northeast', 1910, 'Rua Nordeste, 909', '2013-07-19', 'Pedro Rocha'),
    (13, 'Cachoeirinha Loft', 'Northeast', 2380, 'Rua Cachoeirinha, 1010', '2014-10-10', 'Luana Nunes'),

    -- Novos dados adicionados
    (14, 'Lojas de Natal', 'Northeast', 3200, 'Rua das Luzes, 111', '2018-11-20', 'Rafael da Silva'),
    (15, 'Floresta Store', 'South', 2700, 'Avenida Floresta, 222', '2019-02-15', 'Nina Alves'),
    (16, 'Amazon Online', 'North', 5000, 'Rua da Internet, 333', '2021-04-30', 'Fernanda Lima'),
    (17, 'Rio de Janeiro Shopping', 'Southeast', 4100, 'Avenida Rio, 444', '2017-06-05', 'Juliana Costa'),
    (18, 'Buteco do Sul', 'South', 1600, 'Rua do Buteco, 555', '2016-08-12', 'Henrique Pereira');

-- Consultar a soma da quantidade vendida
SELECT SUM(QuantitySold) FROM Stores;