-- DML (Data Manipulation Language) - Inserção de Dados de Exemplo
-- Inserindo dados na tabela Cursos
INSERT INTO Cursos (NomeCurso, NomeProfessor) VALUES
('Introdução ao SQL', 'Prof. Leonardo Silva'),
('Programação em Python', 'Prof. William'),
('Análise de Dados', 'Prof. Oliveira');

-- Inserindo dados na tabela Alunos
INSERT INTO Alunos (NomeAluno, Email) VALUES
('Beatriz Lima', 'beatriz.lima@email.com'),
('Carlos Eduardo', 'carlos.edu@email.com'),
('Fernanda Alves', 'fernanda.alves@email.com');

-- Inserindo matrículas, ligando os alunos aos cursos
-- Note que usamos os IDs dos registros que acabamos de criar.
INSERT INTO Matriculas (AlunoID, CursoID, DataMatricula) VALUES
(1, 1, '2025-02-10'), -- AlunoID 1 (Beatriz) no CursoID 1 (SQL)
(1, 3, '2025-02-12'), -- AlunoID 1 (Beatriz) no CursoID 3 (Análise de Dados)
(2, 2, '2025-02-11'), -- AlunoID 2 (Carlos) no CursoID 2 (Python)
(3, 1, '2025-02-15'), -- AlunoID 3 (Fernanda) no CursoID 1 (SQL)
(3, 2, '2025-02-15'); -- AlunoID 3 (Fernanda) no CursoID 2 (Python)