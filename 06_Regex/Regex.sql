/* COLLATION

O que é?
O COLLATION nos permite configurar se teremos diferenciação entre maiúsculas e minúsculas, ou entre palavras acentuadas.

O COLLATION pode ser definido em níveis diferentes no SQL Server. Abaixo estão os três níveis:
1. A nível SQL Server
2. A nível de Bancos de Dados
3. A nível de tabelas/colunas

1. A nível SQL Server
O COLLATION a princípio é definido durante a instalação do programa.
Por padrão, o COLLATION padrão é o seguinte:
Latin1_General_CI_AS
Onde CI significa Case Insensitive (não diferencia maiúsculas de minúsculas) e AS significa Accent Sensitive (sensível ao sotaque).
Para descobrir o COLLATION configurado, podemos utilizar o comando abaixo:*/

SELECT SERVERPROPERTY('collation')


/*2. A nível de Banco de Dados
Por padrão, todos os bancos de dados vão herdar a configuração do COLLATION do SQL Server feito durante a instalação.
Em Propriedades, conseguimos visualizar o COLLATION configurado.

Nós podemos também especificar o COLLATION do Banco de Dados no momento da sua criação.*/

CREATE DATABASE BD_Collation
COLLATE Latin1_General_CS_AS

/*Podemos também alterar o COLLATE após criar um banco de dados. Neste caso, usamos o comando abaixo:*/

ALTER DATABASE BD_Collation COLLATE Latin1_General_CI_AS

/*Para saber o COLLATION de um Banco de Dados específico, podemos usar o comando abaixo:*/

SELECT DATABASEPROPERTYEX('BD_Collation','collation')

/*3. A nível de Coluna/Tabela
Por padrão, uma nova coluna de tipo VARCHAR herda o COLLATION do banco de dados, a menos que você especifique o COLLATION explicitamente ao criar a tabela.
Para criar uma coluna com um COLLATION diferente, você pode especificar o agrupamento usando o comando Collate SQL.*/

CREATE TABLE Names (
    ID INT PRIMARY KEY,
    FirstName VARCHAR(100) COLLATE Latin1_General_CS_AS,
    LastName VARCHAR(100),
    MiddleName VARCHAR(100) COLLATE Latin1_General_CS_AS,
    DateOfBirth DATE,
    Email VARCHAR(255),
    PhoneNumber VARCHAR(15),
    Address VARCHAR(255)
);

/*Podemos ver o COLLATION de cada coluna da tabela usando o comando abaixo:*/
EXEC sp_help 'Names';


-- COLLATE: Exemplo
CREATE DATABASE BD_Collation2
COLLATE SQL_Latin1_General_CP1_CI_AS

use BD_Collation2;

CREATE TABLE Persons (
    ID INT PRIMARY KEY,
    FirstName VARCHAR(100) COLLATE SQL_Latin1_General_CP1_CS_AS,
    LastName VARCHAR(100) COLLATE SQL_Latin1_General_CP1_CS_AS,
    MiddleName VARCHAR(100) COLLATE SQL_Latin1_General_CP1_CS_AS,
    DateOfBirth DATE,
    Email VARCHAR(255),
    PhoneNumber VARCHAR(15),
    Address VARCHAR(255),
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    UpdatedAt DATETIME DEFAULT CURRENT_TIMESTAMP
);



INSERT INTO Persons (ID, FirstName, LastName, MiddleName, DateOfBirth, Email, PhoneNumber, Address) VALUES
(1, 'John', 'Doe', 'Michael', '1990-05-15', 'john.doe@example.com', '+1234567890', '123 Elm St, Springfield, IL'),
(2, 'Jane', 'Smith', 'Anne', '1985-10-22', 'jane.smith@example.com', '+0987654321', '456 Oak St, Springfield, IL'),
(3, 'Alice', 'Johnson', 'Marie', '1992-03-10', 'alice.johnson@example.com', '+1122334455', '789 Pine St, Springfield, IL'),
(4, 'Bob', 'Williams', 'Edward', '1980-07-30', 'bob.williams@example.com', '+2233445566', '321 Maple St, Springfield, IL'),
(5, 'Carol', 'Brown', 'Elizabeth', '1995-01-14', 'carol.brown@example.com', '+3344556677', '654 Cedar St, Springfield, IL'),
(6, 'David', 'Jones', 'Chris', '1988-12-05', 'david.jones@example.com', '+4455667788', '987 Birch St, Springfield, IL'),
(7, 'Emma', 'Davis', 'Louise', '1996-06-17', 'emma.davis@example.com', '+5566778899', '135 Willow St, Springfield, IL'),
(8, 'Frank', 'Garcia', 'Roberto', '1975-04-20', 'frank.garcia@example.com', '+6677889900', '246 Spruce St, Springfield, IL'),
(9, 'Grace', 'Martinez', 'Sophia', '1993-09-25', 'grace.martinez@example.com', '+7788990011', '357 Chestnut St, Springfield, IL'),
(10, 'Henry', 'Rodriguez', 'James', '1982-11-11', 'henry.rodriguez@example.com', '+8899001122', '468 Ash St, Springfield, IL');

SELECT * FROM Persons
WHERE FirstName = 'David'



-- LIKE: Case sensitive

INSERT INTO Persons (ID, FirstName, LastName, MiddleName, DateOfBirth, Email, PhoneNumber, Address) VALUES
(11, 'Matheus', 'Silva', NULL, '1995-02-20', 'matheus.silva@example.com', '+5511987654321', 'Av. Paulista, 1000, São Paulo, SP'),
(12, 'MArcela', 'Oliveira', NULL, '1992-03-15', 'marcela.oliveira@example.com', '+5511987654322', 'Rua das Flores, 200, Rio de Janeiro, RJ'),
(13, 'Marcos', 'Santos', NULL, '1990-05-30', 'marcos.santos@example.com', '+5511987654323', 'Praça Central, 300, Belo Horizonte, MG'),
(14, 'MAuricio', 'Ferreira', NULL, '1988-08-10', 'mauricio.ferreira@example.com', '+5511987654324', 'Rua do Comércio, 400, Porto Alegre, RS'),
(15, 'Marta', 'Costa', NULL, '1997-11-25', 'marta.costa@example.com', '+5511987654325', 'Av. Sete de Setembro, 500, Curitiba, PR'),
(16, 'Miranda', 'Pereira', NULL, '1994-06-05', 'miranda.pereira@example.com', '+5511987654326', 'Rua da Liberdade, 600, Salvador, BA'),
(17, 'Melissa', 'Almeida', NULL, '1991-09-12', 'melissa.almeida@example.com', '+5511987654327', 'Rua das Laranjeiras, 700, Brasília, DF'),
(18, 'Lucas', 'Rodrigues', NULL, '1989-01-29', 'lucas.rodrigues@example.com', '+5511987654328', 'Av. dos Angicos, 800, Fortaleza, CE'),
(19, 'Luisa', 'Martins', NULL, '1993-04-18', 'luisa.martins@example.com', '+5511987654329', 'Rua das Orquídeas, 900, Campinas, SP'),
(20, 'Pedro', 'Souza', NULL, '1987-07-22', 'pedro.souza@example.com', '+5511987654330', 'Av. Brasil, 1001, Natal, RN');

-- Case Sensitive (diferenciando maiúsculas de minúsculas
-- LIKE padrão como aprendemos até agora:
SELECT *
FROM Persons
WHERE FirstName LIKE 'Mar%'

-- Retorna as linhas onde a primeira letra seja 'm', a segunda seja 'a' e a terceira seja 'r'
SELECT *
FROM Persons
WHERE FirstName LIKE '[m][a][r]%'

-- Retorna as linhas onde a primeira letra seja [M], a segunda seja 'a' e a terceira seja 'r'
SELECT *
FROM Persons
WHERE FirstName LIKE '[M][a][r]%'

-- Retorna as linhas onde a primeira letra seja 'M' ou 'm', e a segunda seja 'A' ou 'a'
SELECT *
FROM Persons
WHERE FirstName LIKE '[M-m][A-a]%'



-- LIKE: Filtrando os primeiros caracteres + Case sensitive

CREATE TABLE Texts (
    ID INT PRIMARY KEY,
    Content VARCHAR(100) COLLATE SQL_Latin1_General_CP1_CS_AS
);

INSERT INTO Texts (ID, Content)
VALUES
    (1, 'Marcos'),
    (2, 'Excel'),
    (3, 'leandro'),
    (4, 'K'),
    (5, 'X7'),
    (6, 'l9'),
    (7, '#M'),
    (8, '@9'),
    (9, 'M'),
    (10, 'RT');


-- Retornando nomes que começam com a letra 'M', 'E' ou 'K'
SELECT *
FROM Texts
WHERE Content LIKE '[MEK]%'

-- Retornando nomes que possuem apenas 1 caracteres
SELECT *
FROM Texts
WHERE Content LIKE '[A-z]'

-- Retornando nomes que possuem apenas 2 caracteres
SELECT *
FROM Texts
WHERE Content LIKE '[A-z][A-z]'

-- Retornando nomes que possuem apenas 2 caracteres: o primeiro uma letra, o segundo um número
SELECT *
FROM Texts
WHERE Content LIKE '[A-z][0-9]'


-- Identificando caracteres especiais
SELECT *
FROM Texts
WHERE Content LIKE '%[^A-z0-9]%'



-- LIKE: Aplicando um filtro ainda mais personalizado
CREATE TABLE Nomes(
ID INT,
Nome VARCHAR(100) COLLATE SQL_Latin1_General_CP1_CS_AS)

INSERT INTO Nomes(ID, Nome)
VALUES
	(1, 'Matheus'), (2, 'Marcela'), (3, 'marcos'), (4, 'MAuricio'), (5, 'Marta'), (6, 'Miranda'), (7, 'Melissa'), (8, 'Lucas'), (9, 'luisa'), (10, 'Pedro')

-- Retorna os nomes que:
-- 1. Começam com a letra 'M' ou 'm'
-- 2. O segundo caractere pode ser qualquer coisa ('_' é um curinga)
-- 3. O terceiro caractere pode ser a letra 'R' ou a letra 'r'
-- 4. Possui uma quantidade qualquer de caracteres depois do terceiro (por conta do '%')

SELECT *
FROM Nomes
WHERE Nome LIKE '[Mm]_[Rr]%'


-- LIKE: Utilizando o operador de negação
-- Retorna nomes que não começa com as letras 'L' ou 'l'
SELECT *
FROM Nomes
WHERE Nome LIKE '[^Ll]%'

-- Retorna nomes que não começa com as letras 'L' ou 'l'
SELECT *
FROM Nomes
WHERE Nome LIKE '_[^Ee]%'


-- LIKE: Aplicações com números
CREATE TABLE Numeros(
Numero DECIMAL(20, 2))

INSERT INTO Numeros(Numero)
VALUES
	(50), (30.23), (9), (100.54), (15.9), (6.5), (10), (501.76), (1000.56), (31)


-- Retornando os números que possuem 2 dígitos na parte inteira
SELECT *
FROM Numeros
WHERE Numero LIKE '[0-9][0-9].[0][0]'

-- Retornando linhas que:
-- 1. Possuem 3 dígitos na parte inteira, sendo o primeiro dígito igual a 5
-- 2. O primeiro número da parte decimal seja 7.
-- 3. O segundo número da parte decimal seja um número entre 0 e 9.

SELECT *
FROM Numeros
WHERE Numero LIKE '[5]__.[7][0-9]'