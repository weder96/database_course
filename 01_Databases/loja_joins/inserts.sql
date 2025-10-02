-- Inserindo Categorias
INSERT INTO Categorias (categoria_id, nome_categoria) VALUES
(1, 'Eletrônicos'),
(2, 'Livros'),
(3, 'Roupas');

-- Inserindo Clientes
INSERT INTO Clientes (cliente_id, nome_cliente, cidade) VALUES
(101, 'Ana Silva', 'São Paulo'),
(102, 'Bruno Costa', 'Rio de Janeiro'),
(103, 'Carla Dias', 'Belo Horizonte'),
(104, 'Daniel Souza', 'São Paulo'),
(105, 'Eliana Ferreira', 'Curitiba'); -- Cliente que ainda não fez pedido

-- Inserindo Produtos
INSERT INTO Produtos (produto_id, nome_produto, preco, categoria_id) VALUES
(1, 'Notebook Pro', 5200.00, 1),
(2, 'Smartphone X', 2500.00, 1),
(3, 'SQL para Iniciantes', 80.00, 2),
(4, 'A Arte da Programação', 120.00, 2),
(5, 'Camiseta Básica', 50.00, 3),
(6, 'Calça Jeans', 150.00, 3),
(7, 'Monitor 4K', 1800.00, 1); -- Produto que nunca foi vendido

-- Inserindo Pedidos
INSERT INTO Pedidos (pedido_id, cliente_id, data_pedido) VALUES
(1001, 101, '2025-09-10'),
(1002, 102, '2025-09-11'),
(1003, 101, '2025-09-15'),
(1004, 103, '2025-09-18'),
(1005, 104, '2025-09-20');

-- Inserindo Itens dos Pedidos
INSERT INTO ItensPedido (item_id, pedido_id, produto_id, quantidade, preco_unitario) VALUES
(1, 1001, 1, 1, 5200.00), -- Ana comprou um Notebook
(2, 1002, 3, 2, 80.00),   -- Bruno comprou 2 livros 'SQL para Iniciantes'
(3, 1002, 5, 3, 50.00),   -- Bruno comprou 3 Camisetas
(4, 1003, 4, 1, 120.00),  -- Ana comprou 'A Arte da Programação'
(5, 1004, 2, 1, 2500.00), -- Carla comprou um Smartphone
(6, 1004, 6, 1, 150.00),  -- Carla comprou uma Calça Jeans
(7, 1005, 1, 1, 5200.00); -- Daniel comprou um Notebook