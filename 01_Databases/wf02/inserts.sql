
-- 3. Insert data into the new tables
-- Insert unique data into Regions
INSERT INTO Regions (RegionName)
VALUES
    ('Southeast'),
    ('South'),
    ('North'),
    ('Northeast');

-- Insert data for Managers
INSERT INTO Managers (ManagerName)
VALUES
    ('Carlos Silva'),
    ('Ana Lima'),
    ('Felipe Costa'),
    ('Mariana Oliveira'),
    ('Jéssica Santos'),
    ('Roberto Almeida'),
    ('Sofia Martins'),
    ('Lucas Ferreira'),
    ('Patrícia Ribeiro'),
    ('Tiago Gomes'),
    ('Clarice Melo'),
    ('Pedro Rocha'),
    ('Luana Nunes'),
    ('Rafael da Silva'),
    ('Nina Alves'),
    ('Fernanda Lima'),
    ('Juliana Costa'),
    ('Henrique Pereira');
GO

-- 5. Insert data into the Stores table, using IDs from the new tables
INSERT INTO Stores(StoreID, StoreName, RegionID, ManagerID, QuantitySold, Address, OpeningDate)
VALUES
    -- Southeast (RegionID = 1)
    (1, 'Botafogo Praia & Mar', 1, 1, 1800, 'Rua Botafogo, 123', '2010-05-15'),
    (2, 'Lojas Vitória', 1, 2, 800, 'Avenida Brasil, 456', '2015-03-21'),
    (3, 'Empório Mineirinho', 1, 3, 2300, 'Rua Minas Gerais, 789', '2012-07-10'),
    (4, 'Central Paulista', 1, 4, 1800, 'Avenida Paulista, 101', '2011-12-01'),
    (5, 'Rio 90 Graus', 1, 5, 700, 'Rua do Rio, 202', '2016-09-20'),
    (17, 'Rio de Janeiro Shopping', 1, 17, 4100, 'Avenida Rio, 444', '2017-06-05'),

    -- South (RegionID = 2)
    (6, 'Casa Flor & Anápolis', 2, 6, 2100, 'Rua das Flores, 303', '2013-08-15'),
    (7, 'Pampas & Co', 2, 7, 990, 'Avenida da Pampas, 404', '2014-02-10'),
    (8, 'Paraná Papéis', 2, 8, 2800, 'Rua Paraná, 505', '2015-11-30'),
    (15, 'Floresta Store', 2, 15, 2700, 'Avenida Floresta, 222', '2019-02-15'),
    (18, 'Buteco do Sul', 2, 18, 1600, 'Rua do Buteco, 555', '2016-08-12'),

    -- North (RegionID = 3)
    (9, 'Amazonas Prime', 3, 9, 4200, 'Rua Amazonas, 606', '2012-04-25'),
    (10, 'Pará Bens', 3, 10, 3200, 'Avenida Pará, 707', '2011-01-14'),
    (11, 'Tintas Rio Branco', 3, 11, 1500, 'Rua Rio Branco, 808', '2015-05-15'),
    (16, 'Amazon Online', 3, 16, 5000, 'Rua da Internet, 333', '2021-04-30'),

    -- Northeast (RegionID = 4)
    (12, 'Nordestemido Hall', 4, 12, 1910, 'Rua Nordeste, 909', '2013-07-19'),
    (13, 'Cachoeirinha Loft', 4, 13, 2380, 'Rua Cachoeirinha, 1010', '2014-10-10'),
    (14, 'Lojas de Natal', 4, 14, 3200, 'Rua das Luzes, 111', '2018-11-20');