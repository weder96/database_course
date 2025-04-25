-- V. SEQUENCES

-- O que é?
-- Uma sequência (Sequence) é um objeto que utilizamos para criação de números 
-- sequenciais automáticos. São usados especialmente para gerar valores sequenciais
-- únicos para as chaves primárias das tabelas.

-- Dessa forma, não precisamos ficar preenchendo a sequência de ids manualmente (como fizemos
-- até então), podemos gerar automaticamente por meio de uma sequence.

/* Sintaxe
*

CREATE SEQUENCE nome_sequencia
AS tipo
START WITH n
INCREMENT BY n
MAXVALUE n | NO MAXVALUE
MINVALUE n | NO MINVALUE
CYCLE | NO CYCLE;       -- quando atinge o valor máximo, pode ou não voltar do começo

*/

-- Crie uma sequência para o id_cliente

CREATE SEQUENCE customers_seq
AS INT
START WITH 1
INCREMENT BY 1
MAXVALUE 9999999
NO CYCLE


-- Próximo valor da sequência
SELECT NEXT VALUE FOR customers_seq


-- Excluir uma sequence
DROP SEQUENCE customers_seq


-- Usando a sequence na prática
-- Crie uma sequência para o id_projeto

CREATE SEQUENCE projects_seq
AS INT
START WITH 1
INCREMENT BY 1
NO MAXVALUE
NO CYCLE


CREATE TABLE tabProjeto(
	id_projeto INT,
	nome_projeto VARCHAR(100) NOT NULL,
	CONSTRAINT dareas_id_area_pk PRIMARY KEY(id_projeto)
)


INSERT INTO tabProjeto(id_projeto, nome_projeto) VALUES
	(NEXT VALUE FOR projects_seq, 'Planejamento Estratégico'),
	(NEXT VALUE FOR projects_seq, 'Desenvolvimento de App'),
	(NEXT VALUE FOR projects_seq, 'Plano de Negócios'),
	(NEXT VALUE FOR projects_seq, 'Visualização 3D')

INSERT INTO tabProjeto(id_projeto, nome_projeto) VALUES
	(NEXT VALUE FOR projects_seq, 'Mapeamento de Processos')

SELECT * FROM tabProjeto