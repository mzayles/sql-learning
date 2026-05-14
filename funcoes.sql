CREATE DATABASE funcoes;
USE funcoes;

CREATE TABLE Vendedor(
    codigo INT PRIMARY KEY,
    nome VARCHAR(100),
    salario FLOAT(6,2)
);
    
INSERT INTO vendedor (codigo, nome, salario) VALUES
    (1, 'Ana Souza', 3500.00),
    (2, 'Bruno Lima', 2800.50),
    (3, 'Carlos Dias', 4200.00),
    (4, 'Daniela Reis', 3100.00),
    (5, 'Eduardo Faria', 5000.00),
    (6, 'Fernanda Costa', 2900.00),
    (7, 'Gabriel Nunes', 4500.00),
    (8, 'Heloísa Mello', 3200.00),
    (9, 'Igor Cardoso', 3800.00),
    (10, 'Julia Santos', 4100.00);

SELECT MAX(salario) FROM Vendedor;
SELECT LOWER(nome) FROM Vendedor;

SELECT 
    nome AS "Nome",
    MIN(salario) AS "Menor",
    MAX(salario) AS "Maior",
    AVG(salario) AS "Média",
    SUM(salario) AS "Total",
    COUNT(salario) AS "Número de Vendas"
FROM Vendedor WHERE codigo = 2;