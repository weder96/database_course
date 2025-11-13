/* ================================================
SCRIPT DE CRIAÇÃO E CARGA INICIAL
================================================
*/
USE master;
GO

-- 1. Criação do Banco (Se precisar)
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'DB_Revisao')
BEGIN
    CREATE DATABASE DB_Revisao;
END
GO

USE DB_Revisao;
GO

-- 2. Limpeza (Caso já tenha rodado antes)
IF OBJECT_ID('LogAuditoria', 'U') IS NOT NULL DROP TABLE LogAuditoria;
IF OBJECT_ID('ItensVenda', 'U') IS NOT NULL DROP TABLE ItensVenda;
IF OBJECT_ID('Estoque', 'U') IS NOT NULL DROP TABLE Estoque;
IF OBJECT_ID('Vendas', 'U') IS NOT NULL DROP TABLE Vendas;
IF OBJECT_ID('Livros', 'U') IS NOT NULL DROP TABLE Livros;
IF OBJECT_ID('Autores', 'U') IS NOT NULL DROP TABLE Autores;
GO

-- 3. Criação das Tabelas
CREATE TABLE Autores (
    AutorID INT PRIMARY KEY IDENTITY(1,1),
    Nome VARCHAR(100) NOT NULL
);

CREATE TABLE Livros (
    LivroID INT PRIMARY KEY IDENTITY(1,1),
    Titulo VARCHAR(200) NOT NULL,
    AutorID INT FOREIGN KEY REFERENCES Autores(AutorID),
    Preco DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Estoque (
    EstoqueID INT PRIMARY KEY IDENTITY(1,1),
    LivroID INT FOREIGN KEY REFERENCES Livros(LivroID) UNIQUE,
    Quantidade INT NOT NULL CHECK (Quantidade >= 0)
);

CREATE TABLE Vendas (
    VendaID INT PRIMARY KEY IDENTITY(1,1),
    DataVenda DATETIME DEFAULT GETDATE(),
    TotalVenda DECIMAL(10, 2) DEFAULT 0.00
);

CREATE TABLE ItensVenda (
    ItemVendaID INT PRIMARY KEY IDENTITY(1,1),
    VendaID INT FOREIGN KEY REFERENCES Vendas(VendaID),
    LivroID INT FOREIGN KEY REFERENCES Livros(LivroID),
    Quantidade INT NOT NULL,
    PrecoUnitario DECIMAL(10, 2) NOT NULL -- Preço no momento da venda
);

CREATE TABLE LogAuditoria (
    LogID INT PRIMARY KEY IDENTITY(1,1),
    Acao VARCHAR(500) NOT NULL,
    DataHora DATETIME DEFAULT GETDATE()
);
-- 4. Carga Inicial de Dados (25 AUTORES)
INSERT INTO Autores (Nome) VALUES 
('Isaac Asimov'),       
('Frank Herbert'),      
('Arthur C. Clarke'),   
('Philip K. Dick'),     
('William Gibson'),       
('Robert Heinlein'),    
('Ursula K. Le Guin'),  
('Ray Bradbury'),         
('George Orwell'),        
('Aldous Huxley'),        
('Stanislaw Lem'),        
('H.G. Wells'),           
('Jules Verne'),          
('Orson Scott Card'),     
('Dan Simmons'),          
('Neal Stephenson'),    
('Cixin Liu'),          
('Andy Weir'),          
('Margaret Atwood'),    
('Kurt Vonnegut'),      
('Douglas Adams'),      
('N.K. Jemisin'),       
('Ted Chiang'),         
('Connie Willis'),      
('Octavia E. Butler');  
GO

-- 5. Carga Inicial de Dados (25 LIVROS)
INSERT INTO Livros (Titulo, AutorID, Preco) VALUES 
('Fundação', 1, 65.00),                              
('Duna', 2, 89.90),                                 
('2001: Uma Odisseia no Espaço', 3, 49.50),         
('Androides Sonham com Ovelhas Elétricas?', 4, 55.00), 
('Neuromancer', 5, 62.00),                         
('Tropas Estelares', 6, 48.00),                    
('A Mão Esquerda da Escuridão', 7, 51.50),         
('Fahrenheit 451', 8, 44.90),                      
('1984', 9, 39.90),                                
('Admirável Mundo Novo', 10, 42.00),               
('Solaris', 11, 53.00),                            
('A Guerra dos Mundos', 12, 35.00),                
('Vinte Mil Léguas Submarinas', 13, 38.00),        
('O Jogo do Exterminador', 14, 59.90),             
('Hyperion', 15, 75.00),                           
('Snow Crash', 16, 68.00),                         
('O Problema dos Três Corpos', 17, 72.00),         
('Perdido em Marte', 18, 54.00),                   
('O Conto da Aia', 19, 47.00),                     
('Matadouro 5', 20, 49.00),                        
('O Guia do Mochileiro das Galáxias', 21, 33.00),  
('A Quinta Estação', 22, 61.00),                   
('História da Sua Vida e Outros Contos', 23, 58.00),
('O Livro do Juízo Final', 24, 71.00),              
('Kindred', 25, 56.00);                             
GO

-- 6. Carga Inicial de Dados (25 ESTOQUE)
INSERT INTO Estoque (LivroID, Quantidade) VALUES 
(1, 15), (2, 10), (3, 8), (4, 12), (5, 7),
(6, 20), (7, 10), (8, 14), (9, 18), (10, 10),
(11, 5), (12, 12), (13, 11), (14, 9), (15, 6),
(16, 13), (17, 10), (18, 20), (19, 8), (20, 10),
(21, 25), (22, 7), (23, 9), (24, 6), (25, 8);
GO

-- 7. Vendas de Exemplo (5 VENDAS, 10+ ITENS)
-- Venda 1 (Original)
INSERT INTO Vendas (DataVenda) VALUES ('2025-11-10T10:00:00'); 
INSERT INTO ItensVenda (VendaID, LivroID, Quantidade, PrecoUnitario) VALUES (1, 2, 1, 89.90), (1, 3, 2, 49.50);

UPDATE Estoque SET Quantidade = Quantidade - 1 WHERE LivroID = 2;
UPDATE Estoque SET Quantidade = Quantidade - 2 WHERE LivroID = 3;
UPDATE Vendas SET TotalVenda = (1 * 89.90) + (2 * 49.50) WHERE VendaID = 1;


-- Venda 2
INSERT INTO Vendas (DataVenda) VALUES ('2025-11-11T14:30:00');
INSERT INTO ItensVenda (VendaID, LivroID, Quantidade, PrecoUnitario) VALUES (2, 1, 2, 65.00), (2, 9, 1, 39.90);
UPDATE Estoque SET Quantidade = Quantidade - 2 WHERE LivroID = 1;
UPDATE Estoque SET Quantidade = Quantidade - 1 WHERE LivroID = 9;
UPDATE Vendas SET TotalVenda = (2 * 65.00) + (1 * 39.90) WHERE VendaID = 2;

-- Venda 3
INSERT INTO Vendas (DataVenda) VALUES ('2025-11-11T18:00:00'); -- VendaID = 3
INSERT INTO ItensVenda (VendaID, LivroID, Quantidade, PrecoUnitario) VALUES (3, 21, 3, 33.00);

UPDATE Estoque SET Quantidade = Quantidade - 3 WHERE LivroID = 21;
UPDATE Vendas SET TotalVenda = (3 * 33.00) WHERE VendaID = 3;

-- Venda 4
INSERT INTO Vendas (DataVenda) VALUES ('2025-11-12T09:15:00'); -- VendaID = 4
INSERT INTO ItensVenda (VendaID, LivroID, Quantidade, PrecoUnitario) VALUES (4, 16, 1, 68.00), (4, 5, 1, 62.00), (4, 2, 1, 89.90);


UPDATE Estoque SET Quantidade = Quantidade - 1 WHERE LivroID = 16;
UPDATE Estoque SET Quantidade = Quantidade - 1 WHERE LivroID = 5;
UPDATE Estoque SET Quantidade = Quantidade - 1 WHERE LivroID = 2;
UPDATE Vendas SET TotalVenda = (1 * 68.00) + (1 * 62.00) + (1 * 89.90) WHERE VendaID = 4;

-- Venda 5
INSERT INTO Vendas (DataVenda) VALUES ('2025-11-13T11:00:00'); -- VendaID = 5
INSERT INTO ItensVenda (VendaID, LivroID, Quantidade, PrecoUnitario) VALUES (5, 18, 2, 54.00),(5, 17, 1, 72.00);
UPDATE Estoque SET Quantidade = Quantidade - 2 WHERE LivroID = 18;
UPDATE Estoque SET Quantidade = Quantidade - 1 WHERE LivroID = 17;
UPDATE Vendas SET TotalVenda = (2 * 54.00) + (1 * 72.00) WHERE VendaID = 5;


PRINT 'Ambiente Sci-Fi (Versão Estendida 5x) criado com sucesso!';
