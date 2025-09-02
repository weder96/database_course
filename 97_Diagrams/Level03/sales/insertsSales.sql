-- Inserindo dados na tabela Headquarters (Matriz)
-- Nenhuma dependência
INSERT INTO Headquarters (HeadquartersName, Location) VALUES
('Matriz Varejo Brasil', 'São Paulo, SP'),
('Centro Administrativo Sul', 'Curitiba, PR');

-- Inserindo dados na tabela Supplier (Fornecedor)
-- Nenhuma dependência
INSERT INTO Supplier (SupplierName, ContactDetails) VALUES
('Eletrônicos TechMaster', 'contato@techmaster.com'),
('Distribuidora de Periféricos Rápidos', 'vendas@perifericosrapidos.com.br'),
('Importadora de Monitores Visão Clara', 'comercial@visaoclara.com');

-- Inserindo dados na tabela Branch (Filial)
-- Depende de Headquarters
INSERT INTO Branch (BranchName, HeadquartersId) VALUES
('Filial Anápolis', 1),       -- Ligada à Matriz Varejo Brasil
('Filial Goiânia', 1),        -- Ligada à Matriz Varejo Brasil
('Filial Porto Alegre', 2);  -- Ligada ao Centro Administrativo Sul

-- Inserindo dados na tabela Product (Produto)
-- Depende de Supplier
INSERT INTO Product (ProductName, SupplierId) VALUES
('Notebook Pro X15', 1),          -- Fornecido por Eletrônicos TechMaster
('Mouse Gamer Óptico G500', 2),   -- Fornecido por Periféricos Rápidos
('Teclado Mecânico Silencioso TKL', 2), -- Fornecido por Periféricos Rápidos
('Monitor UltraWide 34" 4K', 3);   -- Fornecido por Visão Clara

-- Inserindo dados na tabela Orders (Pedidos)
-- Depende de Branch
INSERT INTO Orders (OrderDate, BranchId) VALUES
('2025-08-25 10:00:00', 1), -- Pedido da Filial Anápolis
('2025-08-28 14:30:00', 2), -- Pedido da Filial Goiânia
('2025-09-01 11:20:00', 1); -- Outro pedido da Filial Anápolis

-- Inserindo dados na tabela Delivery (Entrega)
-- Depende de Supplier
INSERT INTO Delivery (DeliveryDate, SupplierId) VALUES
('2025-08-26 09:00:00', 1), -- Entrega da TechMaster
('2025-08-29 15:00:00', 2), -- Entrega da Periféricos Rápidos
('2025-09-02 13:00:00', 3); -- Entrega da Visão Clara

-- Inserindo dados na tabela OrderDetail (Detalhe do Pedido)
-- Depende de Orders e Product. Aqui detalhamos o que foi vendido em cada pedido.
-- Pedido 1 (OrderId=1)
INSERT INTO OrderDetail (OrderId, ProductId, ProductQuantity, UnitPrice) VALUES
(1, 1, 2, 7500.00); -- 2 Notebooks Pro X15

-- Pedido 2 (OrderId=2)
INSERT INTO OrderDetail (OrderId, ProductId, ProductQuantity, UnitPrice) VALUES
(2, 2, 5, 250.00), -- 5 Mouses Gamer
(2, 3, 5, 450.00); -- 5 Teclados Mecânicos

-- Pedido 3 (OrderId=3)
INSERT INTO OrderDetail (OrderId, ProductId, ProductQuantity, UnitPrice) VALUES
(3, 4, 1, 3200.00); -- 1 Monitor UltraWide

-- Inserindo dados na tabela OrderDetailDelivery (Entrega do Detalhe do Pedido)
-- Tabela de junção que associa as entregas aos pedidos.
INSERT INTO OrderDetailDelivery (DeliveryId, OrderId, Details) VALUES
(1, 1, 'Nota Fiscal: 001-A, Entrega referente aos notebooks.'),
(2, 2, 'Nota Fiscal: 002-B, Entrega de mouses e teclados.'),
(3, 3, 'Nota Fiscal: 003-C, Entrega do monitor.');