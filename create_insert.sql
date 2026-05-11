SHOW DATABASES;
DROP DATABASE MODULO06;
CREATE DATABASE MODULO06;
USE MODULO06;

CREATE TABLE Cliente(
	idCliente INT PRIMARY KEY,
    nome VARCHAR(100),
    CPF VARCHAR(20)
);

DROP TABLE Cliente;
SHOW TABLES;

CREATE TABLE Produto(
	idProduto INT PRIMARY KEY,
    idCliente INT,
    nome VARCHAR(100),
    quantidade INT,
    valor FLOAT(6,2),
    FOREIGN KEY(idCliente) REFERENCES Cliente(idCliente)
);

DROP TABLE Produto;

INSERT INTO Cliente(idCliente, nome, CPF) VALUES
	(300, "Marta", "123.456.987-82"),
    (200, "Carlos", "456.321.789-75"),
    (100, "Bruna", "987.564.213-22");

INSERT INTO Produto(idProduto, idCliente, nome, quantidade, valor) VALUES
	(10, 300, "Pct Arroz Tio Mario", 5, 22.50),
    (20, 300, "LT Oleo Raiz", 3, 6.49),
    (30, 200, "Pct Açucar Diabetis", 20, 10.00),
    (40, 100, "Lt Coca-Cola 600ml", 4, 11.80),
    (50, 200, "Cx Bombom Pesadelo de Valsa", 15, 12.00);
    
SELECT * FROM Produto WHERE valor < 12.00 && valor > 6.49 ORDER BY nome DESC;

SELECT * FROM Produto WHERE idCliente = 200;

SELECT idProduto, nome FROM Produto ORDER BY nome ASC;

INSERT INTO Cliente(idCliente, nome, CPF) VALUES
    (400, "Juliana", "321.654.987-11"),
    (500, "Roberto", "741.852.963-00"),
    (600, "Fernanda", "159.753.486-22"),
    (700, "Lucas", "852.369.147-33");

INSERT INTO Produto(idProduto, idCliente, nome, quantidade, valor) VALUES
    (60, 400, "Pct Feijão Carioca", 10, 8.75),
    (70, 500, "Lt Leite Integral", 12, 5.20),
    (80, 600, "Pct Café Torrado", 6, 15.90),
    (90, 700, "Cx Chá de Camomila", 8, 4.50),
    (100, 400, "Barra Chocolate Meio Amargo", 20, 7.30),
    (110, 500, "Pct Macarrão Espaguete", 15, 3.80),
    (120, 600, "Molho de Tomate Tradicional", 10, 2.99),
    (130, 700, "Refrigerante Guaraná 2L", 5, 9.50),
    (140, 400, "Biscoito Recheado Chocolate", 18, 2.75),
    (150, 500, "Detergente Líquido Neutro", 25, 1.99);

SELECT * FROM Cliente;

SELECT * FROM Produto;