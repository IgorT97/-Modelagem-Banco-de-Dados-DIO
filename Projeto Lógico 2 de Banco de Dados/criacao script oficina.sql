create database Oficina;
use Oficina;

-- Tabela Clientes
CREATE TABLE Clientes (
    ID_Cliente INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Endereço VARCHAR(255),
    Telefone VARCHAR(20),
    Email VARCHAR(100) NOT NULL UNIQUE
);

-- Tabela Veículos
CREATE TABLE Veículos (
    ID_Veículo INT AUTO_INCREMENT PRIMARY KEY,
    Placa VARCHAR(10) NOT NULL UNIQUE,
    Modelo VARCHAR(50) NOT NULL,
    Ano YEAR NOT NULL,
    ID_Cliente INT,
    FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID_Cliente)
);

-- Tabela Serviços
CREATE TABLE Serviços (
    ID_Serviço INT AUTO_INCREMENT PRIMARY KEY,
    Descrição VARCHAR(255) NOT NULL,
    Preço DECIMAL(10, 2) NOT NULL
);

-- Tabela Ordens de Serviço
CREATE TABLE Ordens_Serviço (
    ID_OS INT AUTO_INCREMENT PRIMARY KEY,
    Data_Entrada DATE NOT NULL,
    Data_Saída DATE,
    ID_Cliente INT,
    ID_Veículo INT,
    Total DECIMAL(10, 2),
    FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID_Cliente),
    FOREIGN KEY (ID_Veículo) REFERENCES Veículos(ID_Veículo)
);

-- Tabela Serviços_Realizados
CREATE TABLE Serviços_Realizados (
    ID_OS INT,
    ID_Serviço INT,
    Quantidade INT NOT NULL,
    Preço DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (ID_OS, ID_Serviço),
    FOREIGN KEY (ID_OS) REFERENCES Ordens_Serviço(ID_OS),
    FOREIGN KEY (ID_Serviço) REFERENCES Serviços(ID_Serviço)
);

-- Tabela Funcionários
CREATE TABLE Funcionários (
    ID_Funcionário INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Cargo VARCHAR(50) NOT NULL,
    Salário DECIMAL(10, 2) NOT NULL
);

-- Tabela Funcionários_Serviços
CREATE TABLE Funcionários_Serviços (
    ID_Funcionário INT,
    ID_Serviço INT,
    PRIMARY KEY (ID_Funcionário, ID_Serviço),
    FOREIGN KEY (ID_Funcionário) REFERENCES Funcionários(ID_Funcionário),
    FOREIGN KEY (ID_Serviço) REFERENCES Serviços(ID_Serviço)
);
