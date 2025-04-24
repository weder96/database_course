/* Constraints
*
*

Objetivo: Entender o que são constraints e como trabalhar com elas na prática.
*/

-- I. CONSTRAINTS
-- Constraints no SQL são regras (restrições) que podemos definir para uma coluna de uma tabela.
-- Abaixo temos uma lista de restrições:

-- 1. NOT NULL
-- 2. UNIQUE
-- 3. CHECK
-- 4. DEFAULT
-- 5. IDENTITY
-- 6. PRIMARY KEY
-- 7. FOREIGN KEY



-- 1. NOT NULL
-- Essa constraint não permite que sejam adicionados valores nulos na coluna.


-- 2. UNIQUE
-- Identifica uma coluna de forma única, sem permitir valores duplicados (mas, permite NULL).


-- 3. CHECK
-- Verifica se o valor adicionado na coluna atende a uma determinada condição.


-- 4. DEFAULT
-- Retorna um valor default caso a coluna não seja preenchida.


-- 5. IDENTITY
-- Permite que uma coluna siga uma auto numeração (usada em colunas de ID).


-- 6. PRIMARY KEY
-- Uma CHAVE PRIMÁRIA (PRIMARY KEY) é uma coluna que identifica de forma única as linhas 
-- de uma tabela. Nenhum dos valores de uma coluna de chave primária deve ser nulo ou se repetir.
-- Será através dessa coluna que criaremos relações entre as tabelas.

-- 7. FOREIGN KEY
-- Uma CHAVE ESTRANGEIRA (FOREIGN KEY) é uma coluna que será relacionada com a CHAVE PRIMÁRIA
-- de uma outra tabela.


-- Criando um novo banco de dados
CREATE DATABASE Imobiliaria;

-- Usando o novo banco de dados
USE Imobiliaria;

-- Remover tabelas se existirem
DROP TABLE IF EXISTS fContratosImoveis;
DROP TABLE IF EXISTS dClientesImoveis;
DROP TABLE IF EXISTS dAgentesImoveis;

-- Tabela 1: dClientesImoveis

CREATE TABLE dClientesImoveis(
    id_cliente INT IDENTITY(1, 1),
    nome_cliente VARCHAR(100) NOT NULL,
    genero CHAR(1) NOT NULL CHECK (genero IN ('M', 'F', 'O')),
    data_nascimento DATE NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    CONSTRAINT dclientes_id_cliente_pk PRIMARY KEY(id_cliente)
);

-- Inserindo dados na tabela dClientesImoveis
INSERT INTO dClientesImoveis(Nome_Cliente, Genero, Data_Nascimento, CPF)
VALUES
    ('Carlos Martins',  'M',  '1985-03-12', '111.222.333-44'),
    ('Fernanda Almeida',  'F', '1990-07-05', '222.333.444-55'),
    ('João Silva',       'M',  '1988-11-20', '333.444.555-66'),
    ('Mariana Costa',    'F', '1992-01-15', '444.555.666-77'),
    ('Rafael Oliveira',   'M', '1989-09-28', '555.666.777-88');

-- Seleciona os dados da dClientesImoveis
SELECT * FROM dClientesImoveis;

-- Tabela 2: dAgentesImoveis

CREATE TABLE dAgentesImoveis(
    id_agente INT IDENTITY(1, 1),
    nome_agente VARCHAR(100) NOT NULL,
    data_contratacao DATE NOT NULL,
    salario DECIMAL(10, 2) NOT NULL CHECK (salario >= 0),
    CONSTRAINT dagentes_id_agente_pk PRIMARY KEY(id_agente)
);

-- Inserindo dados na tabela dAgentesImoveis
INSERT INTO dAgentesImoveis(Nome_Agente, Data_Contratacao, Salario)
VALUES
    ('Pedro Santos',   '2015-10-05', 6000.00),
    ('Ana Beatriz',    '2018-11-01', 7500.00),
    ('Thiago Oliveira', '2020-06-23', 8000.00),
    ('Juliana Rocha',   '2016-06-15', 9000.00);

-- Seleciona os dados da dAgentesImoveis
SELECT * FROM dAgentesImoveis;

-- Tabela 3: fContratosImoveis

CREATE TABLE fContratosImoveis(
    id_contrato INT IDENTITY(1, 1),
    data_assinatura DATE DEFAULT GETDATE(),
    id_cliente INT,
    id_agente INT,
    tipo_contrato VARCHAR(50) NOT NULL CHECK (tipo_contrato IN ('Venda', 'Aluguel')),
    valor_contrato DECIMAL(10, 2) NOT NULL CHECK (valor_contrato > 0),
    CONSTRAINT fcontratos_id_contrato_pk PRIMARY KEY(id_contrato),
    CONSTRAINT fcontratos_id_cliente_fk FOREIGN KEY(id_cliente) REFERENCES dClientesImoveis(id_cliente),
    CONSTRAINT fcontratos_id_agente_fk FOREIGN KEY(id_agente) REFERENCES dAgentesImoveis(id_agente)
);

-- Inserindo dados na tabela fContratosImoveis
INSERT INTO fContratosImoveis(Data_Assinatura, ID_Cliente, ID_Agente, Tipo_Contrato, Valor_Contrato)
VALUES
    (GETDATE(), 1, 1, 'Venda', 300000.00),
    (DATEADD(DAY, -10, GETDATE()), 2, 2, 'Aluguel', 1500.00),
    (DATEADD(DAY, -20, GETDATE()), 3, 1, 'Venda', 500000.00),
    (DATEADD(DAY, -30, GETDATE()), 4, 3, 'Aluguel', 2000.00),
    (DATEADD(DAY, -365, GETDATE()), 5, 4, 'Venda', 280000.00);

-- Seleciona os dados da fContratosImoveis
SELECT * FROM fContratosImoveis;


-- Violação de constraints

SELECT * FROM dClientesImoveis;

-- Exemplo 1: Violação NOT NULL e CHECK

INSERT INTO dClientesImoveis(Nome_Cliente, Data_Nascimento, CPF) VALUES
	('Lucia Souza',  '1994-10-23', '999.234.812-20');



-- Exemplo 2: Violação UNIQUE

SELECT * FROM dClientesImoveis

INSERT INTO dClientesImoveis(Nome_Cliente, Genero, Data_Nascimento, CPF) VALUES
	('Lucia Souza',  'F', '1994-10-23', '555.666.777-88');




-- Exemplo 3: Violação de FK e PK

SELECT * FROM dClientesImoveis
SELECT * FROM dAgentesImoveis
SELECT * FROM fContratosImoveis

INSERT INTO fContratosImoveis(Data_Assinatura, ID_Cliente, id_agente,tipo_contrato ,Valor_Contrato) VALUES
    ('2022-03-12', 4, 10, 'Aluguel',1500);

-- Cannot insert the value NULL into column 'tipo_contrato'

INSERT INTO fContratosImoveis(Data_Assinatura, ID_Cliente, id_agente, Valor_Contrato) VALUES
    ('2022-03-12', 4, 10, 1500);



-- III. Gerenciando CONSTRAINTS

-- 1. Adicionar constraints
-- 2. Renomear constraints
-- 3. Remover constraints

-- Remova a constraint PK da tabela fContratos.
ALTER TABLE fContratosImoveis
DROP CONSTRAINT CK__fContrato__tipo___3F466844

-- Remova a constraint FK Cliente da tabela fContratos.
ALTER TABLE fContratosImoveis
DROP CONSTRAINT fcontratos_id_cliente_fk

-- Adicione a constraint PK id_venda na tabela fContratos.
ALTER TABLE fContratosImoveis
ADD CONSTRAINT fContratosImoveis_id_contrato_pk PRIMARY KEY(id_contrato)

-- Adicione a constraint FK id_cliente na tabela VENDAS.
ALTER TABLE fContratosImoveis
ADD CONSTRAINT fContratosImoveis_id_cliente_fk FOREIGN KEY(id_cliente) REFERENCES dClientesImoveis(id_cliente)
