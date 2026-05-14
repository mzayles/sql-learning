CREATE DATABASE testetrigger;
USE testetrigger;

CREATE TABLE produto(
    idProduto INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Nome VARCHAR(20) NULL,
    Valor DECIMAL(6,2) NULL,
    Valor_Desconto DECIMAL(6,2) NULL
);

CREATE TRIGGER trProduto BEFORE INSERT
ON Produto
FOR EACH ROW
SET NEW.Valor_Desconto = (NEW.Valor * 0.90);

INSERT INTO produto (Nome, Valor) VALUES
	('Mouse Gamer', 150.00),
	('Teclado RGB', 250.00),
	('Monitor 24', 899.90),
	('Headset', 320.50),
	('Notebook', 3500.00),
	('Webcam HD', 180.75),
	('SSD 1TB', 499.99),
	('Cadeira Gamer', 1200.00);

SELECT * FROM produto;

DELIMITER $$ 
CREATE PROCEDURE sp_produto()
BEGIN
	SELECT * FROM produto;
END $$
DELIMITER ;

CALL sp_produto

DELIMITER $$
CREATE PROCEDURE sp_inproduto(
IN nome VARCHAR(20),
IN valor DECIMAL(6,2)
)
BEGIN
	INSERT INTO produto(Nome, Valor) VALUES (nome, valor);
END $$
DELIMITER ;

CALL sp_inproduto("Iphone 11", 1100.00)