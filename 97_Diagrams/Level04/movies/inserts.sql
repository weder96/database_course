-- Inserindo dados nas tabelas que não possuem dependências

-- 1. Inserindo Usuários (usuario)
-- A senha deve ser armazenada como um hash seguro, aqui usamos um texto placeholder.
INSERT INTO usuario (apelido_usuario, nome_usuario, email_usuario, cpf_usuario, data_nascimento_usuario, senha_usuario) VALUES
('anacine', 'Ana Clara Souza', 'ana.souza@email.com', '11122233344', '1995-08-10', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
('joaoflix', 'João Pedro Martins', 'joao.martins@email.com', '55566677788', '1990-05-20', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8'),
('marifilm', 'Mariana Ferreira', 'mari.ferreira@email.com', '99988877766', '2001-11-30', 'a7a8a9b0b1b2c3c4d5d6e7f8g9h0i1j2k3l4m5n6o7p8q9r0s1t2u3v4w5x6y7z');

-- 2. Inserindo Tipos de Filme (tipo_filme)
INSERT INTO tipo_filme (nome_tipo_filme) VALUES
('Ação'),
('Comédia'),
('Ficção Científica'),
('Drama'),
('Suspense');


-- Inserindo dados nas tabelas com dependências

-- 3. Inserindo Filmes (filme)
-- Cada filme é associado a um id_tipo_filme existente.
INSERT INTO filme (nome_filme, descricao_filme, diretor_filme, ano_lancamento_filme, duracao_filme, id_tipo_filme) VALUES
('O Protetor: Capítulo Final', 'Robert McCall encontra-se em casa no sul da Itália, mas descobre que seus amigos estão sob o controle dos chefes do crime local.', 'Antoine Fuqua', 2023, 109, 1),
('A Chegada', 'Uma linguista é recrutada pelos militares para ajudar a traduzir as comunicações de alienígenas.', 'Denis Villeneuve', 2016, 116, 3),
('Gente Grande 2', 'Lenny Feder se muda com sua família para sua cidade natal para ficar perto de seus amigos, mas acaba enfrentando velhos e novos valentões.', 'Dennis Dugan', 2013, 101, 2),
('Oppenheimer', 'A história do físico americano J. Robert Oppenheimer e seu papel no desenvolvimento da bomba atômica.', 'Christopher Nolan', 2023, 180, 4);

-- 4. Inserindo Preferências do Usuário (preferencia_usuario)
-- Associa os usuários (apelido_usuario) aos seus tipos de filme favoritos (id_tipo_filme).
INSERT INTO preferencia_usuario (apelido_usuario, id_tipo_filme) VALUES
('anacine', 1),    -- Ana gosta de Ação
('anacine', 4),    -- Ana também gosta de Drama
('joaoflix', 3),   -- João gosta de Ficção Científica
('marifilm', 2),   -- Mariana gosta de Comédia
('marifilm', 5);   -- Mariana também gosta de Suspense

-- 5. Inserindo Notificações por Email (notificacao_email)
-- Registra as notificações enviadas para cada usuário sobre um filme específico.
INSERT INTO notificacao_email (apelido_usuario, id_filme, data_notificacao) VALUES
('anacine', 1, '2025-08-20 14:00:00'), -- Ana notificada sobre 'O Protetor'
('joaoflix', 2, '2025-08-21 10:00:00'), -- João notificado sobre 'A Chegada'
('marifilm', 3, '2025-08-22 18:30:00'); -- Mariana notificada sobre 'Gente Grande 2'