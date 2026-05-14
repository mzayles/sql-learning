CREATE DATABASE fixacao;
USE fixacao;

CREATE TABLE cliente (
 cod_cli INT PRIMARY KEY,
 nome VARCHAR(40),
 email VARCHAR(30)
);

INSERT INTO cliente VALUES
	(1, 'Ana Paula', 'ana@email.com'),
	(2, 'Carlos Mendes', 'carlos@email.com'),
	(3, 'Beatriz Lima', 'beatriz@email.com'),
	(4, 'João Souza', 'joao@email.com');
    
CREATE TABLE endereco (
	cod_end INT PRIMARY KEY,
	cod_cli INT,
	logradouro VARCHAR(50),
	bairro VARCHAR(50),
	FOREIGN KEY (cod_cli) REFERENCES cliente(cod_cli)
);

INSERT INTO endereco VALUES
	(1, 1, 'Rua das Palmeiras, 100', 'Jardim Europa'),
	(2, 2, 'Av. Brasil, 500', 'Centro'),
	(3, 3, 'Rua do Sol, 12', 'Jardim América'),
	(4, 4, 'Rua das Acácias, 300', 'Centro');
    
CREATE TABLE produto (
	cod_prod INT PRIMARY KEY,
	nome VARCHAR(50),
	valor DECIMAL(6,2),
	cod_cli INT,
	FOREIGN KEY (cod_cli) REFERENCES cliente(cod_cli)
);

INSERT INTO produto VALUES
	(1, 'Notebook', 3500.00, 1),
	(2, 'Teclado', 150.00, 1),
	(3, 'Mouse', 80.00, 2),
	(4, 'Monitor', 850.00, 2),
	(5, 'Cadeira Gamer', 1200.00, 3),
	(6, 'Headset', 250.00, 3),
	(7, 'Webcam', 300.00, 4),
	(8, 'Impressora', 700.00, 4);

SELECT c.nome AS "cliente", p.nome AS "produto", p.valor
FROM cliente c
INNER JOIN produto p
ON c.cod_cli = p.cod_cli;

SELECT c.nome AS "cliente", p.nome AS "produto", e.bairro
FROM cliente c
INNER JOIN produto p ON c.cod_cli = p.cod_cli
INNER JOIN endereco e ON c.cod_cli = e.cod_cli;

SELECT nome AS "produto", valor, "Caro" AS "categoria"
FROM produto
WHERE valor > 390.00 ORDER BY valor DESC;

SELECT nome AS "produto", valor , "Promoção" AS "categoria"
FROM produto
WHERE valor < 500.00 ORDER BY valor ASC;

SELECT nome AS "produto", valor, "Caro" AS "categoria"
FROM produto
WHERE valor > 390.00 
UNION
SELECT nome AS "produto", valor , "Promoção" AS "categoria"
FROM produto
WHERE valor < 500.00 ORDER BY valor ASC;

SELECT c.nome AS "cliente_nome", p.nome AS "produto_nome", p.valor AS "preco"
FROM cliente c
INNER JOIN produto p 
ON c.cod_cli = p.cod_cli;

SELECT c.nome, p.nome AS "produto"
FROM cliente c
INNER JOIN produto p 
ON c.cod_cli = p.cod_cli
INNER JOIN endereco e
ON c.cod_cli = e.cod_cli
WHERE e.bairro = "Centro";

SELECT MAX(valor) AS "maior", MIN(valor) AS "menor", AVG(valor) AS "media" FROM produto;

SELECT UPPER(nome) AS "nome_maiusculo" FROM produto;

SELECT c.nome, p.nome AS "produto", p.valor 
FROM cliente c 
INNER JOIN produto p
ON c.cod_cli = p.cod_cli
WHERE c.email LIKE 'a%' || valor > 1000;

SELECT c.nome, COUNT(p.cod_prod) AS "quantidade"
FROM cliente c
INNER JOIN produto p
ON c.cod_cli = p.cod_cli
GROUP BY c.cod_cli, c.nome;

SELECT nome, MAX(valor) AS valor FROM produto GROUP BY nome LIMIT 3;

-- Triggers e Procedures
ALTER TABLE produto ADD valor_desconto DECIMAL(6,2);

CREATE TRIGGER trProduto BEFORE INSERT ON produto
FOR EACH ROW
SET NEW.valor_desconto = NEW.valor * 0.10;

DROP TRIGGER trProduto;

ALTER TABLE produto MODIFY cod_prod INT AUTO_INCREMENT;

DELIMITER $$
CREATE PROCEDURE sp_cadastrar_produto(IN nome VARCHAR(100), IN valor DECIMAL(6,2), IN cliente VARCHAR(100)) 
BEGIN
	INSERT INTO produto(nome, valor, cod_cli) VALUES (nome, valor, cliente);
END $$
DELIMITER ;

DROP PROCEDURE sp_cadastrar_produto;

CALL sp_cadastrar_produto("Mouse Logi Tech", 70.00, 1);

SELECT * FROM produto;

CREATE TABLE cliente_removido (
 cod_cli INT,
 nome VARCHAR(40),
 email VARCHAR(30),
 data_remocao DATETIME
);

DELIMITER $$
CREATE TRIGGER tr_cliente AFTER DELETE ON cliente
FOR EACH ROW
BEGIN
	INSERT INTO cliente_removido(cod_cli, email, nome, data_remocao)
    VALUES (OLD.cod_cli, OLD.email, OLD.nome, NOW());
END $$
DELIMITER ;

SELECT * FROM cliente;

DELETE FROM endereco WHERE cod_cli = 2;
DELETE FROM produto WHERE cod_cli = 2;
DELETE FROM cliente WHERE cod_cli = 2;

SELECT * FROM cliente_removido;