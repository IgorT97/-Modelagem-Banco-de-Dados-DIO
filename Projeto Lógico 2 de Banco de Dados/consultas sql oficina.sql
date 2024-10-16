-- Recuperações Simples com SELECT Statement
SELECT * FROM Clientes;

-- Filtros com WHERE Statement
SELECT * FROM Veículos WHERE Ano < 2015;

-- Criação de Expressões para Gerar Atributos Derivados
SELECT Descrição, Preço, (Preço * 1.10) AS Preço_Com_Imposto FROM Serviços;

-- Ordenações dos Dados com ORDER BY
SELECT Nome, Salário FROM Funcionários ORDER BY Salário DESC;

-- Condições de Filtros aos Grupos – HAVING Statement
SELECT ID_Cliente, COUNT(*) AS Total_OS FROM Ordens_Serviço GROUP BY ID_Cliente HAVING COUNT(*) > 1;

-- Junções entre Tabelas
SELECT Clientes.Nome, Veículos.Modelo, Serviços.Descrição, Serviços_Realizados.Quantidade
FROM Clientes
JOIN Veículos ON Clientes.ID_Cliente = Veículos.ID_Cliente
JOIN Ordens_Serviço ON Clientes.ID_Cliente = Ordens_Serviço.ID_Cliente
JOIN Serviços_Realizados ON Ordens_Serviço.ID_OS = Serviços_Realizados.ID_OS
JOIN Serviços ON Serviços_Realizados.ID_Serviço = Serviços.ID_Serviço;
