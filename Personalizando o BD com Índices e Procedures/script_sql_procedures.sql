DELIMITER //

CREATE PROCEDURE ManipularDados(
    IN opcao INT,
    IN tabela VARCHAR(50),
    IN id INT,
    IN nome VARCHAR(100),
    IN extra VARCHAR(100)
)
BEGIN
    CASE opcao
        WHEN 1 THEN
            -- Inserção
            IF tabela = 'Estudantes' THEN
                INSERT INTO Estudantes (Nome, Curso) VALUES (nome, extra);
            ELSEIF tabela = 'Produtos' THEN
                INSERT INTO Produtos (Nome_Produto, Preço) VALUES (nome, CAST(extra AS DECIMAL(10,2)));
            END IF;
        WHEN 2 THEN
            -- Atualização
            IF tabela = 'Estudantes' THEN
                UPDATE Estudantes SET Nome = nome, Curso = extra WHERE ID_Estudante = id;
            ELSEIF tabela = 'Produtos' THEN
                UPDATE Produtos SET Nome_Produto = nome, Preço = CAST(extra AS DECIMAL(10,2)) WHERE ID_Produto = id;
            END IF;
        WHEN 3 THEN
            -- Remoção
            IF tabela = 'Estudantes' THEN
                DELETE FROM Estudantes WHERE ID_Estudante = id;
            ELSEIF tabela = 'Produtos' THEN
                DELETE FROM Produtos WHERE ID_Produto = id;
            END IF;
    END CASE;
END //

DELIMITER ;
