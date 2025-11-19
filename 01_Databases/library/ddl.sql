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

