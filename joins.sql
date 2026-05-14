CREATE DATABASE EXLOJA;
USE EXLOJA;

CREATE TABLE Cliente(
	idCliente INT PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE Endereco (
    idEndereco INT PRIMARY KEY,
    idCliente INT,
    logradouro VARCHAR(150),
    cidade VARCHAR(100),
    estado CHAR(2),
    cep VARCHAR(10),
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);

INSERT INTO Cliente(idCliente, nome) VALUES 
	(300, "Harry Styles"),
    (200, "Jeff Buckley"),
    (100, "Camila Cabello");

INSERT INTO Endereco(idEndereco, idCliente, logradouro, cidade, estado, cep) VALUES 
	(1, 300, 'Rua das Flores, 123', 'São Paulo', 'SP', '01000-000'),
	(2, 200, 'Av. Paulista, 1000', 'São Paulo', 'SP', '01310-000'),
	(3, 100, 'Rua das Palmeiras, 45', 'Rio de Janeiro', 'RJ', '20000-000');

SELECT * FROM Cliente
INNER JOIN Endereco 
ON Cliente.idCliente = Endereco.idCliente;

SELECT Cliente.idCliente, Cliente.nome, Endereco.logradouro, Endereco.cidade 
FROM Cliente 
INNER JOIN Endereco
ON Cliente.idCliente = Endereco.idCliente;

SELECT c.idCliente, c.nome, e.logradouro, e.cidade 
FROM Cliente c
INNER JOIN Endereco e
ON c.idCliente = e.idCliente;

CREATE TABLE Produto(
	idProduto INT PRIMARY KEY,
    idCliente INT,
    nome VARCHAR(100),
    quantidade INT,
    valor FLOAT(6,2),
    FOREIGN KEY(idCliente) REFERENCES Cliente(idCliente)
);

INSERT INTO Produto(idProduto, idCliente, nome, quantidade, valor) VALUES
	(10, 300, "Pct Arroz Tio Mario", 5, 22.50),
    (20, 300, "LT Oleo Raiz", 3, 6.49),
    (30, 200, "Pct Açucar Diabetis", 20, 10.00),
    (40, 100, "Lt Coca-Cola 600ml", 4, 11.80),
    (50, 200, "Cx Bombom Pesadelo de Valsa", 15, 12.00);
    
SELECT c.idCliente, c.nome, p.nome, p.valor, e.logradouro, e.cidade
FROM Cliente c
INNER JOIN Produto p ON c.idCliente = p.idCliente
INNER JOIN Endereco e ON c.idCliente = e.idCliente;

SELECT c.idCliente, c.nome, p.nome, p.valor, "Caro" AS "Obs"
FROM Cliente c
INNER JOIN Produto p ON c.idCliente = p.idCliente WHERE p.valor >= 10.00
UNION
SELECT c.idCliente, c.nome, p.nome, p.valor, "Barato" AS "Obs"
FROM Cliente c
INNER JOIN Produto p ON c.idCliente = p.idCliente WHERE p.valor < 10.00;

SELECT c.idCliente, e.logradouro AS "Bairro", c.nome
FROM Cliente c
INNER JOIN Endereco e
ON c.idCliente = e.idCliente;