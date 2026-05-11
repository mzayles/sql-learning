CREATE DATABASE biblioteca;
USE biblioteca;

CREATE TABLE Autor(
	autorId INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    sobrenome VARCHAR(100),
    nacionalidade VARCHAR(50)
);

CREATE TABLE Livro(
	livroId INT PRIMARY KEY AUTO_INCREMENT,
    autorId INT,
    titulo VARCHAR(200),
    anoPublicacao YEAR,
    FOREIGN KEY(autorId) REFERENCES Autor(autorId)
);

INSERT INTO Autor(nome, sobrenome, nacionalidade) VALUES 
	("Ali", "Hazelwood", "Italiana"),
    ("Colleen", "Hover", "Americano USA"),
    ("JK", "Rowling", "Britânica"),
    ("Adam", "Silvera", "Norte-Americano USA"),
    ("Lynn", "Painter", "Americana USA");

INSERT INTO Livro(autorId, titulo, anoPublicacao) VALUES
	(1, "A Hipótese do Amor", 2021),
    (1, "Amor, Teoricamente", 2023),
    (2, "Todas As Suas (Im)Perfeições", 2018),
    (2, "Verity", 2018),
    (3, "Harry Potter: A Pedra Filosofal", 1997),
    (3, "Harry Potter: A Câmara Secreta", 1998),
    (4, "Os Dois Morrem No Final", 2017),
    (4, "O Primeiro A Morrer no Final", 2022),
    (5, "Melhor Do Que Nos Filmes", 2023),
    (5, "Amor Por Engano", 2022);
    
SELECT * FROM Autor;
SELECT * FROM Livro;

SELECT nome FROM Autor;
SELECT autorId, titulo FROM Livro;

SELECT a.nome, a.sobrenome, l.titulo
FROM Livro as l
INNER JOIN Autor AS a
ON a.autorId = l.autorId;