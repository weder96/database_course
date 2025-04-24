-- [SQL Server] [Subqueries]ANY, SOME e ALL

-- Criando a tabela funcionarios com novos campos
CREATE TABLE funcionarios(
    id_funcionario INT,
    nome VARCHAR(50),
    sobrenome VARCHAR(50),
    idade INT,
    sexo CHAR(1),
    cargo VARCHAR(50),
    data_nascimento DATE,
    salario DECIMAL(10, 2)
);

-- Inserindo dados na tabela funcionarios
INSERT INTO funcionarios(id_funcionario, nome, sobrenome, idade, sexo, cargo, data_nascimento, salario)
VALUES	
	(1, 'Julia', 'Silva', 20, 'F', 'Assistente Administrativo', '2005-03-15', 2500.00),
	(2, 'Daniel', 'Pereira', 21, 'M', 'Analista de Sistemas', '2004-05-22', 4000.00),
	(3, 'Amanda', 'Oliveira', 22, 'F', 'Coordenadora de Projetos', '2003-07-12', 6000.00),
	(4, 'Pedro', 'Santos', 23, 'M', 'Desenvolvedor', '2002-08-30', 5000.00),
	(5, 'André', 'Costa', 24, 'M', 'Gerente de Marketing', '2001-11-18', 7000.00),
	(6, 'Luisa', 'Martins', 25, 'F', 'Recepcionista', '1998-09-10', 2800.00),
	(7, 'Fernanda', 'Carvalho', 26, 'F', 'Gerente Financeiro', '1997-02-24', 9000.00),
	(8, 'Carlos', 'Melo', 27, 'M', 'Designer Gráfico', '1996-06-15', 3500.00),
	(9, 'Rafael', ' Lima', 28, 'M', 'Engenheiro de Dados', '1995-01-05', 8000.00),
	(10, 'Bruna', 'Alves', 29, 'F', 'Analista de Recursos Humanos', '1994-10-21', 4500.00),
	(11, 'Lucas', 'Nunes', 30, 'M', 'Diretor de Vendas', '1993-04-17', 10000.00),
	(12, 'Tânia', 'Freitas', 31, 'F', 'Professora de Treinamento', '1992-12-08', 3000.00);

SELECT * FROM funcionarios

-- Selecione os funcionários do sexo masculino (MAS, utilizando a coluna de IDADE para isso)

SELECT * FROM funcionarios
WHERE idade IN (21, 23, 24,27,28,30)

SELECT * FROM funcionarios
WHERE idade IN (SELECT idade FROM funcionarios WHERE sexo = 'M')

/*
= ANY(valor1, valor2, valor3) :
Equivalente ao IN, retorna as lunhas da tabela que sejam iguais ao valor1, OU valor2, OU valor3
*/

SELECT * FROM funcionarios
WHERE idade = ANY (SELECT idade FROM funcionarios WHERE sexo = 'M')

/*
> ANY(valor1, valor2, valor3) :
Retorna as linhas da tabela com valores maiores que o valor1, OU valor2, OU valor3. Ou seja, maior que o mínimo dos valores
*/

SELECT * FROM funcionarios
WHERE idade > ANY (SELECT idade FROM funcionarios WHERE sexo = 'M')

/*
< ANY(valor1, valor2, valor3) :
Retorna as linhas da tabela com valores maiores que o valor1, OU valor2, OU valor3. Ou seja, maior que o máximo dos valores
*/

SELECT * FROM funcionarios
WHERE idade < ANY (SELECT idade FROM funcionarios WHERE sexo = 'M')


/*
> ALL(valor1, valor2, valor3) :
Retorna as linhas da tabela com valores maiores que o valor1, E valor2, E valor3. Ou seja, maior que o máximo dos valores
*/

SELECT * FROM funcionarios
WHERE idade > ALL (SELECT idade FROM funcionarios WHERE sexo = 'M')

/*
< ALL(valor1, valor2, valor3) :
Retorna as linhas da tabela com valores menores que o valor1, E valor2, E valor3. Ou seja, menor que o mínimo dos valores
*/

SELECT * FROM funcionarios
WHERE idade < ALL (SELECT idade FROM funcionarios WHERE sexo = 'M')
