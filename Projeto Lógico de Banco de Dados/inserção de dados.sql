-- insert_data.sql

-- Inserindo dados na tabela Clientes
INSERT INTO Clientes (Nome, Email, Endereço, Telefone, Tipo_Cliente, CPF, CNPJ)
VALUES 
('João Silva', 'joao@gmail.com', 'Rua A, 123', '123456789', 'PF', '12345678901', NULL),
('Empresa XYZ', 'contato@xyz.com', 'Av. B, 456', '987654321', 'PJ', NULL, '12345678000199');

-- Inserindo dados na tabela Produtos
INSERT INTO Produtos (Nome_Produto, Descrição, Preço, Estoque)
VALUES 
('Produto 1', 'Descrição do Produto 1', 10.00, 100),
('Produto 2', 'Descrição do Produto 2', 20.00, 200);

-- Inserindo dados na tabela Pedidos
INSERT INTO Pedidos (ID_Cliente, Data_Pedido, Total)
VALUES 
(1, '2023-10-01', 30.00),
(2, '2023-10-02', 50.00);

-- Inserindo dados na tabela Pagamentos
INSERT INTO Pagamentos (ID_Pedido, Forma_Pagamento, Valor)
VALUES 
(1, 'Cartão de Crédito', 30.00),
(2, 'Boleto', 50.00);

-- Inserindo dados na tabela Entregas
INSERT INTO Entregas (ID_Pedido, Status, Codigo_Rastreio)
VALUES 
(1, 'Enviado', 'ABC123'),
(2, 'Entregue', 'XYZ789');

-- Inserindo dados na tabela Fornecedores
INSERT INTO Fornecedores (Nome_Fornecedor, Contato)
VALUES 
('Fornecedor 1', 'fornecedor1@exemplo.com'),
('Fornecedor 2', 'fornecedor2@exemplo.com');

-- Inserindo dados na tabela Produtos_Fornecedores
INSERT INTO Produtos_Fornecedores (ID_Produto, ID_Fornecedor)
VALUES 
(1, 1),
(2, 2);

-- Inserindo dados na tabela Pedidos_Produtos
INSERT INTO Pedidos_Produtos (ID_Pedido, ID_Produto, Quantidade, Preço)
VALUES 
(1, 1, 2, 10.00),
(2, 2, 2, 20.00);
