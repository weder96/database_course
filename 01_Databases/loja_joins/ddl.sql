-- Criando a tabela de Categorias de Produtos
CREATE TABLE Categorias (
    categoria_id INT PRIMARY KEY,
    nome_categoria VARCHAR(50) NOT NULL
);

-- Criando a tabela de Produtos
-- Note a chave estrangeira (FOREIGN KEY) que se conecta à tabela Categorias
CREATE TABLE Produtos (
    produto_id INT PRIMARY KEY,
    nome_produto VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    categoria_id INT,
    FOREIGN KEY (categoria_id) REFERENCES Categorias(categoria_id)
);

-- Criando a tabela de Clientes
CREATE TABLE Clientes (
    cliente_id INT PRIMARY KEY,
    nome_cliente VARCHAR(100) NOT NULL,
    cidade VARCHAR(50)
);

-- Criando a tabela de Pedidos
-- Um pedido pertence a um cliente
CREATE TABLE Pedidos (
    pedido_id INT PRIMARY KEY,
    cliente_id INT,
    data_pedido DATE NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id)
);

-- Criando a tabela de Itens do Pedido (tabela de junção)
-- Esta é a tabela mais importante para nossos JOINs, pois conecta Pedidos e Produtos
CREATE TABLE ItensPedido (
    item_id INT PRIMARY KEY,
    pedido_id INT,
    produto_id INT,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (pedido_id) REFERENCES Pedidos(pedido_id),
    FOREIGN KEY (produto_id) REFERENCES Produtos(produto_id)
);