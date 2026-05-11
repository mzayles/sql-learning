CREATE DATABASE teste;
USE teste;

CREATE TABLE herois (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    universo VARCHAR(50) NOT NULL
);

INSERT INTO herois (nome, universo) VALUES
	('Superman', 'DC'),
	('Batman', 'DC'),
	('Mulher Maravilha', 'DC'),
	('Flash', 'DC'),
	('Aquaman', 'DC'),
	('Homem Aranha', 'Marvel'),
	('Homem de Ferro', 'Marvel'),
	('Capitão América', 'Marvel'),
	('Thor', 'Marvel'),
	('Hulk', 'Marvel'),
	('Lanterna Verde', 'DC'),
	('Viúva Negra', 'Marvel'),
	('Doutor Estranho', 'Marvel'),
	('Ciborgue', 'DC'),
	('Pantera Negra', 'Marvel'),
	('Robin', 'DC');
    
SELECT nome FROM herois;

SELECT * FROM herois;

SELECT nome, universo FROM herois;

SELECT * FROM herois ORDER BY nome;

SELECT * FROM herois ORDER BY nome DESC;

SELECT * FROM herois ORDER BY nome ASC;

SELECT nome FROM herois WHERE id = 10;