-- drop database SistemaVendas;
CREATE DATABASE SistemaVendas;
USE SistemaVendas;

CREATE TABLE Funcionarios (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50),
    salario DECIMAL(10,2),
    telefone VARCHAR(20)
);


CREATE TABLE Fornecedores (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome_da_empresa VARCHAR(100) NOT NULL,
    endereco VARCHAR(150),
    telefones VARCHAR(20),
    cnpj VARCHAR(20) UNIQUE
);


CREATE TABLE Clientes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) UNIQUE,
    telefone VARCHAR(20)
);


CREATE TABLE Vendas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_funcionario INT,
    id_fornecedor INT,
    id_cliente INT,
    valor_total DECIMAL(10,2),

    FOREIGN KEY (id_funcionario) REFERENCES Funcionarios(id),
    FOREIGN KEY (id_fornecedor) REFERENCES Fornecedores(id),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id)
);


CREATE TABLE Produtos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    categoria VARCHAR(50),
    preco DECIMAL(10,2),
    id_fornecedor INT,

    FOREIGN KEY (id_fornecedor) REFERENCES Fornecedores(id)
);


CREATE TABLE Itens_da_Venda (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_venda INT,
    id_produto INT,
    quantidade INT,

    FOREIGN KEY (id_venda) REFERENCES Vendas(id),
    FOREIGN KEY (id_produto) REFERENCES Produtos(id)
);

-- Parte para inserir os dados no banco: 
-- table Funcionários
-- Funcionários
INSERT INTO Funcionarios (nome, cargo, salario, telefone) VALUES
('Ana Silva', 'Vendedora', 2500.00, '(11) 99999-1111'),
('Bruno Costa', 'Gerente', 4200.00, '(11) 98888-2222'),
('Carla Mendes', 'Atendente', 2000.00, '(11) 97777-3333'),
('Diego Rocha', 'Caixa', 1800.00, '(11) 96666-4444'),
('Eduarda Lima', 'Vendedora', 2600.00, '(11) 95555-5555');

-- Fornecedores
INSERT INTO Fornecedores (nome_da_empresa, endereco, telefones, cnpj) VALUES
('Tech Distribuidora', 'Rua das Indústrias, 100', '(11) 98888-2222', '12.345.678/0001-99'),
('InfoShop', 'Av. Central, 200', '(11) 97777-3333', '98.765.432/0001-11'),
('GlobalTech', 'Rua Nova, 45', '(11) 96666-1234', '54.321.987/0001-55'),
('EletronicNow', 'Rua Digital, 80', '(11) 95555-9999', '77.888.999/0001-33'),
('MegaStore', 'Rua do Comércio, 10', '(11) 94444-4444', '11.111.111/0001-00');

-- Clientes
INSERT INTO Clientes (nome, cpf, telefone) VALUES
('Carlos Souza', '123.456.789-00', '(11) 97777-3333'),
('Fernanda Dias', '987.654.321-00', '(11) 96666-5555'),
('Gabriel Martins', '111.222.333-44', '(11) 95555-8888'),
('Isabela Ferreira', '222.333.444-55', '(11) 94444-7777'),
('Lucas Almeida', '333.444.555-66', '(11) 93333-9999');

-- Produtos
INSERT INTO Produtos (nome, categoria, preco, id_fornecedor) VALUES
('Notebook Dell', 'Eletrônicos', 3500.00, 1),
('Mouse Gamer', 'Acessórios', 150.00, 2),
('Teclado Mecânico', 'Acessórios', 280.00, 3),
('Monitor 24"', 'Eletrônicos', 900.00, 1),
('Cabo HDMI', 'Acessórios', 40.00, 5);

-- Vendas
INSERT INTO Vendas (id_funcionario, id_fornecedor, id_cliente, valor_total) VALUES
(1, 1, 1, 3500.00),
(2, 2, 2, 430.00),
(3, 3, 3, 280.00),
(4, 1, 4, 900.00),
(5, 5, 5, 40.00);

-- Itens da Venda
INSERT INTO Itens_da_Venda (id_venda, id_produto, quantidade) VALUES
(1, 1, 1), -- Notebook Dell
(2, 2, 2), -- 2 Mouses Gamer
(3, 3, 1), -- 1 Teclado
(4, 4, 1), -- 1 Monitor
(5, 5, 1); -- 1 Cabo HDMI


-- SELECT
-- table funcionários
SELECT * FROM Funcionarios;

-- saber onde o preço é maior que 1000
SELECT * FROM Produtos WHERE preco > 1000;

-- select em todas as vendas com o nome do cliente
SELECT V.id, C.nome AS cliente, V.valor_total
FROM Vendas V
JOIN Clientes C ON V.id_cliente = C.id;

SELECT Funcionarios.nome AS funcionario, COUNT(Vendas.id) AS total_vendas
FROM Funcionarios
JOIN Vendas ON Funcionarios.id = Vendas.id_funcionario
GROUP BY Funcionarios.nome
HAVING COUNT(Vendas.id) > 2;

SELECT Clientes.nome AS cliente, SUM(Itens_da_Venda.quantidade) AS total_itens_comprados
FROM Clientes
JOIN Vendas ON Clientes.id = Vendas.id_cliente
JOIN Itens_da_Venda ON Vendas.id = Itens_da_Venda.id_venda
GROUP BY Clientes.nome
HAVING SUM(Itens_da_Venda.quantidade) > 5;


-- UPDATE:
-- Atualizar salário de um funcionário
UPDATE Funcionarios
SET salario = 2700.00
WHERE nome = 'Ana Silva';

-- Atualizar telefone de um cliente
UPDATE Clientes
SET telefone = '(11) 91111-1111'
WHERE nome = 'Fernanda Dias';

-- Atualizar o preço de um produto
UPDATE Produtos
SET preco = 3200.00
WHERE nome = 'Notebook Dell';

-- DELETE

DELETE FROM Clientes
WHERE nome = 'Lucas Almeida';

-- Remover um produto pelo nome
DELETE FROM Produtos
WHERE nome = 'Cabo HDMI';

-- Remover um fornecedor
DELETE FROM Fornecedores
WHERE nome_da_empresa = 'MegaStore';



