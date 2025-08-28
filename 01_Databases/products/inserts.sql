-- Inserindo Clientes
INSERT INTO customer (customer_id, customer_city, customer_state) VALUES
('customer_1', 'sao paulo', 'SP'),
('customer_2', 'rio de janeiro', 'RJ'),
('customer_3', 'belo horizonte', 'MG');

-- Inserindo Produtos
INSERT INTO products (product_id, product_category_name) VALUES
('prod_1', 'informatica_acessorios'),
('prod_2', 'livros_tecnicos'),
('prod_3', 'eletrodomesticos'),
('prod_4', 'informatica_acessorios');

-- Inserindo Pedidos
INSERT INTO orders (order_id, customer_id, order_purchase_timestamp) VALUES
('order_1', 'customer_1', '2023-03-10 08:30:00'),
('order_2', 'customer_2', '2023-03-15 14:00:00'),
('order_3', 'customer_1', '2023-04-02 11:20:00'),
('order_4', 'customer_3', '2023-04-05 18:00:00');

-- Inserindo Itens dos Pedidos
-- O PDF mostra exemplos que contam produtos por pedido e somam preços[cite: 52, 93].
INSERT INTO order_items (order_id, product_id, price, shipping_limit_date) VALUES
('order_1', 'prod_1', 150.00, '2023-03-15 23:59:59'),
('order_1', 'prod_2', 90.50, '2023-03-15 23:59:59'),
('order_2', 'prod_3', 1200.75, '2023-03-20 23:59:59'),
('order_3', 'prod_4', 250.00, '2023-04-07 23:59:59'),
('order_4', 'prod_2', 95.00, '2023-04-10 23:59:59');

-- Inserindo Pagamentos dos Pedidos
-- O PDF tem uma consulta para contar o número de parcelas por pedido[cite: 33].
INSERT INTO order_payments (order_id, payment_installments) VALUES
('order_1', 3),
('order_2', 10),
('order_3', 5),
('order_4', 1);