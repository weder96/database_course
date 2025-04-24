-- [SQL Server] CRUD
--Código da tabela utilizada nos próximos exemplos

CREATE DATABASE BDCompany;    -- Obs: Se você já criou o BD BDCompany não precisa executar esta linha

USE BDCompany

CREATE TABLE Funcionarios(
	id_funcionario int,
	nome_funcionario varchar(100),
	salario float,
	data_nascimento date
)
INSERT INTO Funcionarios(id_funcionario, nome_funcionario, salario, data_nascimento)
VALUES
    (1, 'Ricardo Gomes'   , 1600, '1990-03-20'),
    (2, 'Ana Beatriz'     , 2400, '1988-12-07'),
    (3, 'Fernanda Machados', 3000, '1994-01-15'),
    (4, 'Marcelo Lima'    , 7200, '1992-04-10'),
    (5, 'Carla Santos'    , 3500, '1986-09-02'),
    (6, 'Juliana Costa'   , 5800, '1989-01-21'),
    (7, 'Mateus Henrique'  , 2000, '1993-11-02'),
    (8, 'Sandra Rocha'     , 4100, '1990-05-09'),
    (9, 'André Carvalho'  , 1200, '1994-03-13'),
    (10, 'Julio César'     , 4900, '1992-07-05');

SELECT * FROM Funcionarios


-- ALTER TABLE: Adicionando, deletar ou modificar tipo de dados de uma coluna

-- Adicionar coluna:

ALTER TABLE Funcionarios
ADD cargo varchar(100), bonus decimal(10,2)

UPDATE Funcionarios
SET cargo = 'Analista'
WHERE id_funcionario = 1
SELECT * FROM Funcionarios

SELECT * FROM Funcionarios


-- Alterar tipo de dados de uma coluna:

ALTER TABLE Funcionarios
ALTER COLUMN salario int

SELECT * FROM Funcionarios

-- Deletar coluna:


ALTER TABLE Funcionarios
DROP COLUMN cargo, bonus



SELECT * FROM Funcionarios