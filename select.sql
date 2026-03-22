-- Create tables
CREATE TABLE usuarios (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    email VARCHAR(100)
);

-- Insert data
INSERT INTO usuarios (nome, email) VALUES ('Matheus', 'matheus@email.com');

-- Queries
SELECT * FROM usuarios;
