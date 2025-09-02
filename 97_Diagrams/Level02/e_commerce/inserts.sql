-- Inserindo dados nas tabelas que não possuem dependências

-- 1. Inserindo Clientes (Customer)
INSERT INTO Customer (Name, Email, Address) VALUES
('Ana Costa', 'ana.costa@email.com', 'Rua das Flores, 123, Anápolis, GO'),
('Bruno Martins', 'bruno.m@email.com', 'Avenida Brasil, 456, Anápolis, GO'),
('Carla Dias', 'carla.dias@email.com', 'Praça da Matriz, 789, Goiânia, GO');

-- 2. Inserindo Categorias (Categories)
INSERT INTO Categories (Category_name, Category_type) VALUES
('Eletrônicos', 'Dispositivos'),
('Livros', 'Ficção'),
('Vestuário', 'Roupas de Verão');

-- 3. Inserindo status de Entrega (Delivery)
-- Estes registros serão associados aos pedidos posteriormente
INSERT INTO Delivery (Type, Status) VALUES
('Padrão', 'Aguardando Coleta'),
('Expressa', 'Aguardando Coleta'),
('Padrão', 'Aguardando Coleta');


-- Inserindo dados nas tabelas que possuem dependências

-- 4. Inserindo Produtos (Products)
-- Cada produto é associado a uma categoria existente (Category_ID)
INSERT INTO Products (Product_name, Category_ID) VALUES
('Smartphone X200', 1),          
('O Hobbit', 2),                 
('Camiseta de Algodão', 3),      
('Fone de Ouvido Bluetooth', 1); 

-- 5. Inserindo Pedidos (Order)
-- Cada pedido é associado a um cliente (Customer_ID) e a uma entrega (Delivery_ID)
INSERT INTO [Order] (Order_date, Delivery_ID, Customer_ID) VALUES
('2025-08-30 10:30:00', 1, 1), -- Ana Costa fez um pedido com entrega Padrão
('2025-09-01 15:00:00', 2, 2), -- Bruno Martins fez um pedido com entrega Expressa
('2025-09-02 09:00:00', 3, 1); -- Ana Costa fez outro pedido com entrega Padrão

-- 6. Inserindo Detalhes do Pedido (OrderDetail)
-- Esta tabela de junção associa os produtos aos pedidos, criando os itens da compra
-- Pedido 1 (Order_ID = 1)
INSERT INTO OrderDetail (Order_ID, Product_ID, Quantity, UnitPrice) VALUES
(1, 1, 1, 1800.00), -- 1 Smartphone X200
(1, 4, 1, 250.00);  -- 1 Fone de Ouvido Bluetooth

-- Pedido 2 (Order_ID = 2)
INSERT INTO OrderDetail (Order_ID, Product_ID, Quantity, UnitPrice) VALUES
(2, 2, 1, 45.50);   -- 1 Livro "O Hobbit"

-- Pedido 3 (Order_ID = 3)
INSERT INTO OrderDetail (Order_ID, Product_ID, Quantity, UnitPrice) VALUES
(3, 3, 2, 89.90);   -- 2 Camisetas de Algodão