#Criação do Bando de Dados:

CREATE DATABASE livraria;
USE livraria;

#Criação das Tabelas:

CREATE TABLE Cliente (
Cod_cliente VARCHAR(30) NOT NULL PRIMARY KEY,
Nome VARCHAR(50) NOT NULL,
Email VARCHAR(50) NOT NULL,
Telefone VARCHAR(30) NOT NULL
);

CREATE TABLE Pedido (
Data DATE NOT NULL,
Valor_Pedido FLOAT NOT NULL,
Cod_pedido VARCHAR(30) NOT NULL PRIMARY KEY,
fk_Cliente_Cod_cliente VARCHAR(30),
FOREIGN KEY (fk_Cliente_Cod_cliente) REFERENCES Cliente (Cod_cliente)
);

CREATE TABLE Editora (
Cod_Editora VARCHAR(30) NOT NULL PRIMARY KEY,
Contato_editora VARCHAR(50) NOT NULL,
Email_editora VARCHAR(50) NOT NULL,
Telefone_editora VARCHAR(30) 
);

CREATE TABLE Livros (
Cod_livro VARCHAR(50) NOT NULL PRIMARY KEY,
Titulo VARCHAR(100) NOT NULL,
Categoria VARCHAR(50) NOT NULL,
Valor FLOAT NOT NULL,
fk_Editora_Cod_Editora VARCHAR(30),
FOREIGN KEY (fk_Editora_Cod_Editora) REFERENCES Editora (Cod_Editora)
);
  
CREATE TABLE Estoque (
Cod_estoque VARCHAR(30) NOT NULL PRIMARY KEY,
Qtde_livros INTEGER NOT NULL,
Cod_editora VARCHAR(30) NOT NULL,
Cod_livro VARCHAR(30) NOT NULL,
FOREIGN KEY (Cod_editora) REFERENCES Editora (Cod_Editora),
FOREIGN KEY (Cod_livro) REFERENCES Livros (Cod_livro)
);  
    
CREATE TABLE referente_a (
fk_Pedido_Cod_pedido VARCHAR(30),
fk_Livros_Cod_livro VARCHAR(30),
PRIMARY KEY (fk_Pedido_Cod_pedido, fk_Livros_Cod_livro),
FOREIGN KEY (fk_Pedido_Cod_pedido) REFERENCES Pedido (Cod_pedido),
FOREIGN KEY (fk_Livros_Cod_livro) REFERENCES Livros (Cod_livro)
);
    
CREATE TABLE existe (
fk_Livros_Cod_livro VARCHAR(30),
fk_Estoque_Cod_estoque VARCHAR(30),
PRIMARY KEY (fk_Livros_Cod_livro, fk_Estoque_Cod_estoque),
FOREIGN KEY (fk_Livros_Cod_livro) REFERENCES Livros (Cod_livro),
FOREIGN KEY (fk_Estoque_Cod_estoque) REFERENCES Estoque (Cod_estoque)
);
    
INSERT INTO Cliente (Cod_cliente, Nome, Email, Telefone) 
VALUES ('CL_1', 'Maria Silva', 'maria.silva@mail.com', '123456789');
INSERT INTO Cliente (Cod_cliente, Nome, Email, Telefone) 
VALUES ('CL_2', 'José Santos', 'jose.santos@mail.com', '654546789');
INSERT INTO Cliente (Cod_cliente, Nome, Email, Telefone) 
VALUES ('CL_3', 'Ana Costa', 'ana.costa@mail.com', '54687984');    
INSERT INTO Cliente (Cod_cliente, Nome, Email, Telefone) 
VALUES ('CL_4', 'João Matos', 'joao.matos@mail.com', '54578985');    

INSERT INTO Editora (Cod_Editora, Contato_editora, Email_editora, Telefone_editora) 
VALUES ('ED_1', 'Pedro Almeida', 'pedro.almeida@mail.com', '112233445');
INSERT INTO Editora (Cod_Editora, Contato_editora, Email_editora, Telefone_editora)
VALUES ('ED_2', 'Lucia Martins', 'lucia.martins@mail.com', '223344556');
INSERT INTO Editora (Cod_Editora, Contato_editora, Email_editora, Telefone_editora)
VALUES ('ED_3', 'João Pereira', 'joao.pereira@mail.com', '334455667');
INSERT INTO Editora (Cod_Editora, Contato_editora, Email_editora, Telefone_editora)
VALUES ('ED_4', 'Fernanda Lima', 'fernanda.lima@mail.com', '445566778');

INSERT INTO Livros (Cod_livro, Titulo, Categoria, Valor, fk_Editora_Cod_Editora) 
VALUES ('LV_1', 'Aventura na Selva', 'Aventura', 29.90, 'ED_1');
INSERT INTO Livros (Cod_livro, Titulo, Categoria, Valor, fk_Editora_Cod_Editora) 
VALUES ('LV_2', 'Mistério no Castelo', 'Mistério', 34.90, 'ED_2');
INSERT INTO Livros (Cod_livro, Titulo, Categoria, Valor, fk_Editora_Cod_Editora) 
VALUES ('LV_3', 'Histórias da Cidade', 'História', 24.90, 'ED_3');
INSERT INTO Livros (Cod_livro, Titulo, Categoria, Valor, fk_Editora_Cod_Editora) 
VALUES ('LV_4', 'O Segredo das Estrelas', 'Ficção', 39.90, 'ED_4');

INSERT INTO Estoque (Cod_estoque, Qtde_livros, Cod_editora, Cod_livro) 
VALUES ('ES_1', 10, 'ED_1', 'LV_1');
INSERT INTO Estoque (Cod_estoque, Qtde_livros, Cod_editora, Cod_livro) 
VALUES ('ES_2', 5, 'ED_2', 'LV_2');
INSERT INTO Estoque (Cod_estoque, Qtde_livros, Cod_editora, Cod_livro) 
VALUES ('ES_3', 2, 'ED_3', 'LV_3');
INSERT INTO Estoque (Cod_estoque, Qtde_livros, Cod_editora, Cod_livro) 
VALUES ('ES_4', 12, 'ED_4', 'LV_4');
INSERT INTO Pedido (Data, Valor_Pedido, Cod_pedido, fk_Cliente_Cod_cliente) 
VALUES ('2024-08-01', 59.80, 'PD_1', 'CL_1');
INSERT INTO Pedido (Data, Valor_Pedido, Cod_pedido, fk_Cliente_Cod_cliente) 
VALUES ('2024-08-05', 34.90, 'PD_2', 'CL_2');
INSERT INTO Pedido (Data, Valor_Pedido, Cod_pedido, fk_Cliente_Cod_cliente) 
VALUES ('2024-08-10', 24.90, 'PD_3', 'CL_3');
INSERT INTO Pedido (Data, Valor_Pedido, Cod_pedido, fk_Cliente_Cod_cliente) 
VALUES ('2024-08-15', 39.90, 'PD_4', 'CL_4');

INSERT INTO referente_a (fk_Pedido_Cod_pedido, fk_Livros_Cod_livro) 
VALUES ('PD_1', 'LV_1');
INSERT INTO referente_a (fk_Pedido_Cod_pedido, fk_Livros_Cod_livro) 
VALUES ('PD_2', 'LV_2');
INSERT INTO referente_a (fk_Pedido_Cod_pedido, fk_Livros_Cod_livro) 
VALUES ('PD_3', 'LV_3');
INSERT INTO referente_a (fk_Pedido_Cod_pedido, fk_Livros_Cod_livro) 
VALUES ('PD_4', 'LV_4');

INSERT INTO existe (fk_Livros_Cod_livro, fk_Estoque_Cod_estoque) 
VALUES ('LV_1', 'ES_1');
INSERT INTO existe (fk_Livros_Cod_livro, fk_Estoque_Cod_estoque) 
VALUES ('LV_2', 'ES_2');
INSERT INTO existe (fk_Livros_Cod_livro, fk_Estoque_Cod_estoque) 
VALUES ('LV_3', 'ES_3');
INSERT INTO existe (fk_Livros_Cod_livro, fk_Estoque_Cod_estoque) 
VALUES ('LV_4', 'ES_4');

ALTER TABLE Cliente
ADD COLUMN Endereco VARCHAR(100);

UPDATE Cliente
SET Endereco = 'Rua Lua, 12, Bairro Estrela'
WHERE Cod_cliente = 'CL_1';

UPDATE Cliente
SET Endereco = 'Rua Marte, 45, Bairro Universo'
WHERE Cod_cliente = 'CL_2';

UPDATE Cliente
SET Endereco = 'Rua Vênus, 79, Bairro Planeta'
WHERE Cod_cliente = 'CL_3';

UPDATE Cliente
SET Endereco = 'Rua Dominus, 101, Bairro Januário'
WHERE Cod_cliente = 'CL_4';

SELECT * FROM Cliente;
SELECT * FROM Editora;
SELECT * FROM Livros;
SELECT * FROM Estoque;
SELECT * FROM Pedido;
SELECT * FROM referente_a;
SELECT * FROM existe;





