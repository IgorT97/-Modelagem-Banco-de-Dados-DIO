-- Inserindo dados na tabela Clientes
INSERT INTO Clientes (Nome, Endereço, Telefone, Email)
VALUES 
('João Silva', 'Rua A, 123', '123456789', 'joao@gmail.com'),
('Maria Oliveira', 'Av. B, 456', '987654321', 'maria@gmail.com');

-- Inserindo dados na tabela Veículos
INSERT INTO Veículos (Placa, Modelo, Ano, ID_Cliente)
VALUES 
('ABC1234', 'Fiat Uno', 2010, 1),
('XYZ5678', 'VW Gol', 2015, 2);

-- Inserindo dados na tabela Serviços
INSERT INTO Serviços (Descrição, Preço)
VALUES 
('Troca de Óleo', 100.00),
('Alinhamento', 80.00);

-- Inserindo dados na tabela Ordens de Serviço
INSERT INTO Ordens_Serviço (Data_Entrada, Data_Saída, ID_Cliente, ID_Veículo, Total)
VALUES 
('2023-10-01', '2023-10-02', 1, 1, 180.00),
('2023-10-03', NULL, 2, 2, 100.00);

-- Inserindo dados na tabela Serviços_Realizados
INSERT INTO Serviços_Realizados (ID_OS, ID_Serviço, Quantidade, Preço)
VALUES 
(1, 1, 1, 100.00),
(1, 2, 1, 80.00),
(2, 1, 1, 100.00);

-- Inserindo dados na tabela Funcionários
INSERT INTO Funcionários (Nome, Cargo, Salário)
VALUES 
('Carlos Mendes', 'Mecânico', 3000.00),
('Ana Costa', 'Atendente', 2000.00);

-- Inserindo dados na tabela Funcionários_Serviços
INSERT INTO Funcionários_Serviços (ID_Funcionário, ID_Serviço)
VALUES 
(1, 1),
(1, 2),
(2, 1);
