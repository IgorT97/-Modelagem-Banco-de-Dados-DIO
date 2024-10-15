-- criação do Script SQL para criação do esquema do banco de dados
-- drop database ecommerce
create database if not exists ecommerce;
use ecommerce;

-- Tabela Clientes
CREATE TABLE Clientes (
    ID_Cliente INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Endereço VARCHAR(255),
    Telefone VARCHAR(20),
    Tipo_Cliente ENUM('PJ', 'PF') NOT NULL,
    CPF VARCHAR(11),
    CNPJ VARCHAR(14),
    CHECK (Tipo_Cliente = 'PJ' AND CNPJ IS NOT NULL AND CPF IS NULL OR
           Tipo_Cliente = 'PF' AND CPF IS NOT NULL AND CNPJ IS NULL)
);

-- Tabela Produtos
CREATE TABLE Produtos (
    ID_Produto INT AUTO_INCREMENT PRIMARY KEY,
    Nome_Produto VARCHAR(100) NOT NULL,
    Descrição TEXT,
    Preço DECIMAL(10, 2) NOT NULL,
    Estoque INT NOT NULL
);

-- Tabela Pedidos
CREATE TABLE Pedidos (
    ID_Pedido INT AUTO_INCREMENT PRIMARY KEY,
    ID_Cliente INT,
    Data_Pedido DATE NOT NULL,
    Total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID_Cliente)
);

-- Tabela Pagamentos
CREATE TABLE Pagamentos (
    ID_Pagamento INT AUTO_INCREMENT PRIMARY KEY,
    ID_Pedido INT,
    Forma_Pagamento VARCHAR(50) NOT NULL,
    Valor DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (ID_Pedido) REFERENCES Pedidos(ID_Pedido)
);

-- Tabela Entregas
CREATE TABLE Entregas (
    ID_Entrega INT AUTO_INCREMENT PRIMARY KEY,
    ID_Pedido INT,
    Status VARCHAR(50) NOT NULL,
    Codigo_Rastreio VARCHAR(50),
    FOREIGN KEY (ID_Pedido) REFERENCES Pedidos(ID_Pedido)
);

-- Tabela Fornecedores
CREATE TABLE Fornecedores (
    ID_Fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    Nome_Fornecedor VARCHAR(100) NOT NULL,
    Contato VARCHAR(100)
);

-- Tabela Produtos_Fornecedores
CREATE TABLE Produtos_Fornecedores (
    ID_Produto INT,
    ID_Fornecedor INT,
    PRIMARY KEY (ID_Produto, ID_Fornecedor),
    FOREIGN KEY (ID_Produto) REFERENCES Produtos(ID_Produto),
    FOREIGN KEY (ID_Fornecedor) REFERENCES Fornecedores(ID_Fornecedor)
);

-- Tabela Pedidos_Produtos
CREATE TABLE Pedidos_Produtos (
    ID_Pedido INT,
    ID_Produto INT,
    Quantidade INT NOT NULL,
    Preço DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (ID_Pedido, ID_Produto),
    FOREIGN KEY (ID_Pedido) REFERENCES Pedidos(ID_Pedido),
    FOREIGN KEY (ID_Produto) REFERENCES Produtos(ID_Produto)
);

