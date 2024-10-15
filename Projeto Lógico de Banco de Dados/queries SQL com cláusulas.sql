-- Recuperações simples com SELECT Statement
SELECT * FROM Clientes;

-- Filtros com WHERE Statement
SELECT * FROM Produtos WHERE Estoque < 10;

-- Criação de Expressões para Gerar Atributos Derivados
SELECT Nome_Produto, Preço, Estoque, (Preço * Estoque) AS Valor_Estoque FROM Produtos;

-- Ordenações dos Dados com ORDER BY
SELECT Nome, Email FROM Clientes ORDER BY Nome;

-- Condições de Filtros aos Grupos – HAVING Statement
SELECT ID_Cliente, COUNT(*) AS Total_Pedidos FROM Pedidos GROUP BY ID_Cliente HAVING COUNT(*) > 5;

-- Junções entre Tabelas
SELECT Clientes.Nome, Produtos.Nome_Produto, Pedidos_Produtos.Quantidade
FROM Clientes
JOIN Pedidos ON Clientes.ID_Cliente = Pedidos.ID_Cliente
JOIN Pedidos_Produtos ON Pedidos.ID_Pedido = Pedidos_Produtos.ID_Pedido
JOIN Produtos ON Pedidos_Produtos.ID_Produto = Produtos.ID_Produto;
