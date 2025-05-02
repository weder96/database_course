```sql
CREATE DATABASE PharmacyDB;

USE PharmacyDB;


-- Creating the Categories table
CREATE TABLE Categories (
    category_id INT PRIMARY KEY identity(1,1) not null,
    name VARCHAR(100) NOT NULL UNIQUE
);

-- Creating the Suppliers table
CREATE TABLE Suppliers (
    supplier_id INT PRIMARY KEY identity(1,1) not null,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    address VARCHAR(255)
);

-- Creating the Medications table
CREATE TABLE Medications (
    medication_id INT PRIMARY KEY identity(1,1) not null,
    name VARCHAR(100) NOT NULL,
    category_id INT,
    supplier_id INT, -- Adicionando a coluna supplier_id
    price DECIMAL(10, 2) NOT NULL CHECK (price >= 0),
    stock INT NOT NULL CHECK (stock >= 0),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id) ON DELETE SET NULL,
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id) ON DELETE SET NULL -- Chave estrangeira para Suppliers
);

-- Creating the Customers table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY identity(1,1) not null,
    name VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE, -- CPF is a Brazilian identification number
    date_of_birth DATE NOT NULL
);

-- Creating the Sales table
CREATE TABLE Sales (
    sale_id INT PRIMARY KEY identity(1,1) not null,
    date DATETIME NOT NULL,
    customer_id INT,
    total DECIMAL(10, 2) NOT NULL CHECK (total >= 0),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) ON DELETE CASCADE
);

-- Creating the Sale_Items table
CREATE TABLE Sale_Items (
    sale_item_id INT PRIMARY KEY identity(1,1) not null,
    sale_id INT,
    medication_id INT,
    quantity INT NOT NULL CHECK (quantity > 0),
    unit_price DECIMAL(10, 2) NOT NULL CHECK (unit_price >= 0),
    FOREIGN KEY (sale_id) REFERENCES Sales(sale_id) ON DELETE CASCADE,
    FOREIGN KEY (medication_id) REFERENCES Medications(medication_id) ON DELETE CASCADE
);

```



```sql

-- 1. Inserindo Categorias

INSERT INTO Categories (name) VALUES ('Antibiotics');
INSERT INTO Categories (name) VALUES ('Antidepressants');
INSERT INTO Categories (name) VALUES ('Analgesics');
INSERT INTO Categories (name) VALUES ('Vitamins');
INSERT INTO Categories (name) VALUES ('Topical Ointments');
INSERT INTO Categories (name) VALUES ('Cough Suppressants');
INSERT INTO Categories (name) VALUES ('Antipyretics');
INSERT INTO Categories (name) VALUES ('Hormones');
INSERT INTO Categories (name) VALUES ('Antihistamines');
INSERT INTO Categories (name) VALUES ('Probiotics');

-- 2. Inserindo Fornecedores


INSERT INTO Suppliers (name, phone, address) VALUES ('Fornecedor A', '1234-5678', 'Rua A, 123');
INSERT INTO Suppliers (name, phone, address) VALUES ('Fornecedor B', '2345-6789', 'Rua B, 456');
INSERT INTO Suppliers (name, phone, address) VALUES ('Fornecedor C', '3456-7890', 'Rua C, 789');
INSERT INTO Suppliers (name, phone, address) VALUES ('Fornecedor D', '4567-8901', 'Rua D, 101');
INSERT INTO Suppliers (name, phone, address) VALUES ('Fornecedor E', '5678-9012', 'Rua E, 202');
INSERT INTO Suppliers (name, phone, address) VALUES ('Fornecedor F', '6789-0123', 'Rua F, 303');
INSERT INTO Suppliers (name, phone, address) VALUES ('Fornecedor G', '7890-1234', 'Rua G, 404');
INSERT INTO Suppliers (name, phone, address) VALUES ('Fornecedor H', '8901-2345', 'Rua H, 505');
INSERT INTO Suppliers (name, phone, address) VALUES ('Fornecedor I', '9012-3456', 'Rua I, 606');
INSERT INTO Suppliers (name, phone, address) VALUES ('Fornecedor J', '0123-4567', 'Rua J, 707');


-- 3. Inserindo Medicamentos

INSERT INTO Medications (name, category_id, supplier_id, price, stock) VALUES ('Amoxicilina', 1, 1, 25.00, 100);
INSERT INTO Medications (name, category_id, supplier_id, price, stock) VALUES ('Fluoxetina', 2, 2, 35.00, 50);
INSERT INTO Medications (name, category_id, supplier_id, price, stock) VALUES ('Paracetamol', 3, 3, 10.00, 200);
INSERT INTO Medications (name, category_id, supplier_id, price, stock) VALUES ('Ácido Ascórbico', 4, 4, 15.00, 300);
INSERT INTO Medications (name, category_id, supplier_id, price, stock) VALUES ('Hidrocortisona', 5, 5, 20.00, 80);
INSERT INTO Medications (name, category_id, supplier_id, price, stock) VALUES ('Dexametasona', 5, 6, 30.00, 60);
INSERT INTO Medications (name, category_id, supplier_id, price, stock) VALUES ('Ibuprofeno', 3, 7, 18.00, 150);
INSERT INTO Medications (name, category_id, supplier_id, price, stock) VALUES ('Sertralina', 2, 8, 40.00, 75);
INSERT INTO Medications (name, category_id, supplier_id, price, stock) VALUES ('Loradatadina', 9, 9, 22.00, 92);
INSERT INTO Medications (name, category_id, supplier_id, price, stock) VALUES ('Probiotics X', 10, 10, 55.00, 45);
INSERT INTO Medications (name, category_id, supplier_id, price, stock) VALUES ('Citrus Bioflavonoids', 4, 1, 30.00, 200);
INSERT INTO Medications (name, category_id, supplier_id, price, stock) VALUES ('Cough Syrup ABC', 6, 2, 25.00, 120);
INSERT INTO Medications (name, category_id, supplier_id, price, stock) VALUES ('Loratadina', 9, 3, 19.00, 80);
INSERT INTO Medications (name, category_id, supplier_id, price, stock) VALUES ('Antitussígeno XYZ', 6, 4, 28.00, 90);
INSERT INTO Medications (name, category_id, supplier_id, price, stock) VALUES ('Vitamin D3', 4, 5, 12.00, 300);
INSERT INTO Medications (name, category_id, supplier_id, price, stock) VALUES ('Melatonina', 4, 6, 18.00, 150);
INSERT INTO Medications (name, category_id, supplier_id, price, stock) VALUES ('Prednisona', 5, 7, 40.00, 70);
INSERT INTO Medications (name, category_id, supplier_id, price, stock) VALUES ('Cetirizina', 9, 8, 25.00, 100);
INSERT INTO Medications (name, category_id, supplier_id, price, stock) VALUES ('Ranitidina', 1, 9, 15.00, 60);

-- 4. Inserindo Clientes

INSERT INTO Customers (name, cpf, date_of_birth) VALUES ('João Silva', '12345678901', '1985-03-15');
INSERT INTO Customers (name, cpf, date_of_birth) VALUES ('Maria Oliveira', '23456789012', '1992-07-21');
INSERT INTO Customers (name, cpf, date_of_birth) VALUES ('Carlos Souza', '34567890123', '2000-01-30');
INSERT INTO Customers (name, cpf, date_of_birth) VALUES ('Ana Pereira', '45678901234', '1975-11-12');
INSERT INTO Customers (name, cpf, date_of_birth) VALUES ('Fernanda Lima', '56789012345', '1988-09-05');
INSERT INTO Customers (name, cpf, date_of_birth) VALUES ('Roberto Santos', '67890123456', '1995-12-10');
INSERT INTO Customers (name, cpf, date_of_birth) VALUES ('Juliana Costa', '78901234567', '1990-06-22');
INSERT INTO Customers (name, cpf, date_of_birth) VALUES ('Paulo Almeida', '89012345678', '1983-04-18');
INSERT INTO Customers (name, cpf, date_of_birth) VALUES ('Letícia Martins', '90123456789', '1989-01-09');
INSERT INTO Customers (name, cpf, date_of_birth) VALUES ('André Lima', '01234567890', '1980-05-25');
INSERT INTO Customers (name, cpf, date_of_birth) VALUES ('Thiago Mendes', '21345678901', '1979-08-14');
INSERT INTO Customers (name, cpf, date_of_birth) VALUES ('Priscila Rocha', '32456789012', '1998-02-02');
INSERT INTO Customers (name, cpf, date_of_birth) VALUES ('Felipe Dias', '43567890123', '1991-11-19');
INSERT INTO Customers (name, cpf, date_of_birth) VALUES ('Sofia Fonseca', '54678901234', '1994-03-30');
INSERT INTO Customers (name, cpf, date_of_birth) VALUES ('Gabriel Ferreira', '65789012345', '1987-07-07');
INSERT INTO Customers (name, cpf, date_of_birth) VALUES ('Bianca Teixeira', '76890123456', '1993-09-15');
INSERT INTO Customers (name, cpf, date_of_birth) VALUES ('Vitor Hugo', '87901234567', '2002-12-01');

-- 5. Inserindo Vendas

INSERT INTO Sales (date, customer_id, total) VALUES ('2025-05-01 10:00:00', 1, 65.00);
INSERT INTO Sales (date, customer_id, total) VALUES ('2025-05-02 11:30:00', 2, 35.00);
INSERT INTO Sales (date, customer_id, total) VALUES ('2025-05-03 12:15:00', 3, 40.00);
INSERT INTO Sales (date, customer_id, total) VALUES ('2025-05-04 14:45:00', 4, 20.00);
INSERT INTO Sales (date, customer_id, total) VALUES ('2025-05-05 16:20:00', 5, 90.00);
INSERT INTO Sales (date, customer_id, total) VALUES ('2025-05-06 09:15:00', 1, 30.00);
INSERT INTO Sales (date, customer_id, total) VALUES ('2025-05-07 10:30:00', 6, 70.00);
INSERT INTO Sales (date, customer_id, total) VALUES ('2025-05-08 13:00:00', 7, 50.00);
INSERT INTO Sales (date, customer_id, total) VALUES ('2025-05-09 15:00:00', 8, 80.00);
INSERT INTO Sales (date, customer_id, total) VALUES ('2025-05-10 17:45:00', 9, 45.00);
INSERT INTO Sales (date, customer_id, total) VALUES ('2025-05-11 18:30:00', 10, 55.00);
INSERT INTO Sales (date, customer_id, total) VALUES ('2025-05-12 19:15:00', 11, 25.00);
INSERT INTO Sales (date, customer_id, total) VALUES ('2025-05-13 20:00:00', 12, 41.00);
INSERT INTO Sales (date, customer_id, total) VALUES ('2025-05-14 14:00:00', 13, 95.00);
INSERT INTO Sales (date, customer_id, total) VALUES ('2025-05-15 16:40:00', 14, 60.00);
INSERT INTO Sales (date, customer_id, total) VALUES ('2025-05-16 12:30:00', 15, 30.00);
INSERT INTO Sales (date, customer_id, total) VALUES ('2025-05-17 10:45:00', 16, 75.00);

-- 6. Inserindo Itens de Vendas

INSERT INTO Sale_Items (sale_id, medication_id, quantity, unit_price) VALUES (1, 1, 2, 25.00);
INSERT INTO Sale_Items (sale_id, medication_id, quantity, unit_price) VALUES (1, 3, 1, 10.00);
INSERT INTO Sale_Items (sale_id, medication_id, quantity, unit_price) VALUES (2, 2, 1, 35.00);
INSERT INTO Sale_Items (sale_id, medication_id, quantity, unit_price) VALUES (3, 3, 4, 10.00);
INSERT INTO Sale_Items (sale_id, medication_id, quantity, unit_price) VALUES (4, 4, 1, 15.00);
INSERT INTO Sale_Items (sale_id, medication_id, quantity, unit_price) VALUES (5, 1, 3, 25.00);
INSERT INTO Sale_Items (sale_id, medication_id, quantity, unit_price) VALUES (5, 5, 1, 20.00);
INSERT INTO Sale_Items (sale_id, medication_id, quantity, unit_price) VALUES (6, 6, 2, 30.00);
INSERT INTO Sale_Items (sale_id, medication_id, quantity, unit_price) VALUES (7, 2, 1, 35.00);
INSERT INTO Sale_Items (sale_id, medication_id, quantity, unit_price) VALUES (8, 3, 4, 10.00);
INSERT INTO Sale_Items (sale_id, medication_id, quantity, unit_price) VALUES (9, 10, 1, 55.00);
INSERT INTO Sale_Items (sale_id, medication_id, quantity, unit_price) VALUES (10, 6, 1, 25.00);
INSERT INTO Sale_Items (sale_id, medication_id, quantity, unit_price) VALUES (11, 7, 2, 18.00);
INSERT INTO Sale_Items (sale_id, medication_id, quantity, unit_price) VALUES (12, 8, 1, 40.00);
INSERT INTO Sale_Items (sale_id, medication_id, quantity, unit_price) VALUES (13, 9, 3, 19.00);
INSERT INTO Sale_Items (sale_id, medication_id, quantity, unit_price) VALUES (14, 4, 1, 15.00);
INSERT INTO Sale_Items (sale_id, medication_id, quantity, unit_price) VALUES (15, 5, 1, 20.00);
INSERT INTO Sale_Items (sale_id, medication_id, quantity, unit_price) VALUES (16, 1, 1, 25.00);
INSERT INTO Sale_Items (sale_id, medication_id, quantity, unit_price) VALUES (17, 5, 2, 20.00);


```



# Exercícios SQL Review Prova
--------------------
## 1. Selecionar todas as Categorias
### Escreva uma consulta para selecionar todos os registros da tabela Categories.

--------------------
## 2. Selecionar medicamentos com preço maior que R$ 20,00
### Escreva uma consulta para selecionar os nomes e preços dos medicamentos que custam mais de R$ 20,00.

--------------------
## 3. Contar o número de fornecedores
### Escreva uma consulta para contar quantos fornecedores estão cadastrados na tabela Suppliers.

--------------------
## 4. Selecionar clientes nascidos antes de 1990
### Escreva uma consulta que retorne os nomes dos clientes que nasceram antes de 1990.


--------------------
## 5. Total de vendas por cliente
### Escreva uma consulta que retorne o total de vendas realizadas por cada cliente. e necessario trazer o nome do Cliente


--------------------
## 6. Selecionar medicamentos de uma categoria específica
### Escreva uma consulta para selecionar todos os medicamentos da categoria "Antibiotics".


--------------------
## 7. Verificar estoque de medicamentos
### Escreva uma consulta para selecionar os nomes e estoques dos medicamentos que estão em falta (estoque = 0).


--------------------
## 8. Listar vendas e seus respectivos clientes
### Escreva uma consulta que exiba as vendas juntamente com os nomes dos clientes.


--------------------
## 9. Contar medicamentos por categoria
### Escreva uma consulta para contar quantos medicamentos existem em cada categoria.


--------------------
## 10. Selecionar medicamentos cuja quantidade é menor que 50
### Escreva uma consulta para selecionar os nomes e estoques dos medicamentos que têm um estoque menor que 50.


--------------------
## 11. Vendas com data de maio de 2025
### Escreva uma consulta para selecionar todas as vendas que ocorreram em maio de 2025.


--------------------
## 12. Média de preço dos medicamentos
### Escreva uma consulta para calcular a média dos preços dos medicamentos.


--------------------
## 13. Medicamento mais caro
### Escreva uma consulta para encontrar o medicamento mais caro.


--------------------
## 14. Total de medicamentos vendidos em uma venda
### Escreva uma consulta que retorne o total de itens vendidos em cada venda, agrupando por venda.


--------------------
## 15. Vendas em que o total é maior que R$ 100,00
### Escreva uma consulta para selecionar os IDs das vendas cujo total é maior que R$ 100,00.


--------------------
## 16. Produtos com preço e estoque
### Escreva uma consulta que exiba o nome do medicamento, o preço e o estoque, ordenados pelo preço em ordem decrescente.

--------------------
## 17. Fornecedores sem medicamentos
### Escreva uma consulta que retorne todos os fornecedores que não fornecem nenhum medicamento.

--------------------
## 18. Alterar preço de um medicamento
### Escreva uma consulta para atualizar o preço do medicamento "Paracetamol" para R$ 12,50.

--------------------
## 19. Excluir um cliente
### Escreva uma consulta para excluir um cliente pelo seu ID (por exemplo, cliente_id = 1).

--------------------
## 20. Inserir um novo medicamento
### Escreva uma consulta para inserir um novo medicamento chamado "Novo Medicamento" na categoria "Antidepressants" com preço R$ 35,00 e estoque 60.

--------------------
## 21: View de Vendas por Cliente
### Crie uma view que mostre todas as vendas feitas por cada cliente, incluindo o nome do cliente, a data da venda e o total da venda.

--------------------
## 22: Join para Medicamentos e Fornecedores
### Escreva uma consulta que exiba o nome do medicamento, o nome do fornecedor e o preço, fazendo o join entre as tabelas Medications e Suppliers (supondo que ### haja uma relação de fornecimento que você poderia implementar).
### -- Neste caso, você precisaria ajustar o modelo para incluir um relacionamento entre Suppliers e Medications
### -- Assumindo uma tabela que relacione medicamentos com fornecedores, poderia ser algo assim:

--------------------
## 23: Trigger para Atualizar Estoque
### Crie uma trigger que atualize o valor do estoque na tabela Medications quando um novo item for inserido na tabela Sale_Items. 
### Quando um produto é vendido, ### o estoque deve ser decrementado.

--------------------
## 24: View de Relatório de Vendas
### Crie uma view que mostre um relatório completo das vendas, incluindo o nome do cliente, a data da venda, o total de cada venda e o número total de itens vendidos.

--------------------
## 25: Join para Medicamentos em Vendas
### Escreva uma consulta que mostre os detalhes das vendas, incluindo os medicamentos vendidos e seus preços unitários. A consulta deve retornar o nome do medicamento, a data da venda e o total (quantidade * preço unitário).

--------------------