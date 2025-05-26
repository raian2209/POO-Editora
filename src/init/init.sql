-- CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- Extensões para UUIDs
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- ENUM para o status da obra
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'obra_status') THEN
        CREATE TYPE obra_status AS ENUM ('Em avaliação', 'Aceita', 'Rejeitada');
    END IF;
END$$;

-- Tabela de Autores
CREATE TABLE autores (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    nome TEXT NOT NULL,
    endereco TEXT,
    cpf VARCHAR(14) UNIQUE NOT NULL
);

-- Tabela de Obras (entidade forte)
CREATE TABLE obras (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    titulo TEXT NOT NULL,
    genero TEXT,
    ano INT,
    status obra_status NOT NULL DEFAULT 'Em avaliação',
    autor_id UUID UNIQUE NOT NULL,  -- UNIQUE garante relação 1:1
    CONSTRAINT fk_autor FOREIGN KEY (autor_id) REFERENCES autores(id) ON DELETE CASCADE
);

-- Tabela de Avaliadores
CREATE TABLE avaliadores (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    nome TEXT NOT NULL,
    endereco TEXT,
    cpf VARCHAR(14) UNIQUE NOT NULL
);

-- Tabela pivot: relação muitos-para-muitos entre obras e avaliadores
CREATE TABLE avaliacoes (
    obra_id UUID NOT NULL,
    avaliador_id UUID NOT NULL,
    data_avaliacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (obra_id, avaliador_id),
    CONSTRAINT fk_avaliacoes_obra FOREIGN KEY (obra_id) REFERENCES obras(id) ON DELETE CASCADE,
    CONSTRAINT fk_avaliacoes_avaliador FOREIGN KEY (avaliador_id) REFERENCES avaliadores(id) ON DELETE CASCADE
);
--____________________________________________________________ inserir valores nas tabelas
-- Inserir autores
INSERT INTO autores (id, nome, endereco, cpf) VALUES
  (uuid_generate_v4(), 'Carlos Silva', 'Rua A, 123', '123.456.789-00'),
  (uuid_generate_v4(), 'Maria Oliveira', 'Rua B, 456', '987.654.321-00');

-- Recuperar os IDs dos autores inseridos
-- Isso depende da ferramenta, mas abaixo usamos CTEs para fins de ilustração
-- Você pode adaptar isso ao seu sistema (Java/JDBC ou psql)

-- Simulando obras associadas aos autores (1:1)
WITH autor1 AS (
    SELECT id AS autor_id FROM autores WHERE nome = 'Carlos Silva'
),
autor2 AS (
    SELECT id AS autor_id FROM autores WHERE nome = 'Maria Oliveira'
)
INSERT INTO obras (id, titulo, genero, ano, status, autor_id)
VALUES
  (uuid_generate_v4(), 'A Sombra da Montanha', 'Drama', 2020, 'Aceita', (SELECT autor_id FROM autor1)),
  (uuid_generate_v4(), 'O Círculo do Fogo', 'Ficção', 2023, 'Em avaliação', (SELECT autor_id FROM autor2));

-- Inserir avaliadores
INSERT INTO avaliadores (id, nome, endereco, cpf) VALUES
  (uuid_generate_v4(), 'João Pereira', 'Rua C, 789', '111.222.333-44'),
  (uuid_generate_v4(), 'Ana Costa', 'Rua D, 321', '555.666.777-88');

-- Relacionar avaliadores com obras (muitos para muitos)
WITH
  obra1 AS (SELECT id AS obra_id FROM obras WHERE titulo = 'A Sombra da Montanha'),
  obra2 AS (SELECT id AS obra_id FROM obras WHERE titulo = 'O Círculo do Fogo'),
  avaliador1 AS (SELECT id AS avaliador_id FROM avaliadores WHERE nome = 'João Pereira'),
  avaliador2 AS (SELECT id AS avaliador_id FROM avaliadores WHERE nome = 'Ana Costa')
INSERT INTO avaliacoes (obra_id, avaliador_id, data_avaliacao)
VALUES
  ((SELECT obra_id FROM obra1), (SELECT avaliador_id FROM avaliador1), '2024-05-10 15:30:00'),
  ((SELECT obra_id FROM obra1), (SELECT avaliador_id FROM avaliador2), '2024-05-10 15:30:00'),
  ((SELECT obra_id FROM obra2), (SELECT avaliador_id FROM avaliador1), '2024-05-10 15:30:00');
