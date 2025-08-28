-- Create the database
CREATE DATABASE PRODUCTS_02;
GO

-- Use the database
USE PRODUCTS_02;
GO

-- Tabela para armazenar dados dos clientes
CREATE TABLE customer (
    customer_id VARCHAR(50) PRIMARY KEY,
    customer_city VARCHAR(100),
    customer_state CHAR(2)
);

-- Tabela para armazenar dados dos produtos
CREATE TABLE products (
    product_id VARCHAR(50) PRIMARY KEY,
    product_category_name VARCHAR(100)
);

-- Tabela principal de pedidos, ligada a um cliente
CREATE TABLE orders (
    order_id VARCHAR(50) PRIMARY KEY,
    customer_id VARCHAR(50),
    order_purchase_timestamp DATETIME,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

-- Tabela de itens do pedido (tabela de junção entre pedidos e produtos)
CREATE TABLE order_items (
    order_id VARCHAR(50),
    product_id VARCHAR(50),
    price REAL,
    shipping_limit_date DATETIME,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Tabela de pagamentos do pedido
CREATE TABLE order_payments (
    order_id VARCHAR(50),
    payment_installments INTEGER,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);