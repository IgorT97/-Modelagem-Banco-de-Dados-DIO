-- database.sql

-- Parte 1: Criação do Esquema do Banco de Dados para Company

-- Tabela department
CREATE TABLE department (
    dept_id INT AUTO_INCREMENT PRIMARY KEY,
    dept_name VARCHAR(100) NOT NULL,
    manager_id INT,
    location_id INT
);

-- Tabela dependent
CREATE TABLE dependent (
    dep_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id INT,
    dep_name VARCHAR(100) NOT NULL,
    relationship VARCHAR(50),
    FOREIGN KEY (emp_id) REFERENCES employee(emp_id)
);

-- Tabela dept_locations
CREATE TABLE dept_locations (
    location_id INT AUTO_INCREMENT PRIMARY KEY,
    city VARCHAR(100) NOT NULL
);

-- Tabela employee
CREATE TABLE employee (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_name VARCHAR(100) NOT NULL,
    dept_id INT,
    job_title VARCHAR(100),
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);

-- Tabela project
CREATE TABLE project (
    proj_id INT AUTO_INCREMENT PRIMARY KEY,
    proj_name VARCHAR(100) NOT NULL,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);

-- Tabela works_on
CREATE TABLE works_on (
    emp_id INT,
    proj_id INT,
    hours DECIMAL(5, 2) NOT NULL,
    PRIMARY KEY (emp_id, proj_id),
    FOREIGN KEY (emp_id) REFERENCES employee(emp_id),
    FOREIGN KEY (proj_id) REFERENCES project(proj_id)
);

-- Inserindo dados de exemplo nas tabelas
INSERT INTO dept_locations (city)
VALUES 
('São Paulo'),
('Rio de Janeiro'),
('Belo Horizonte');

INSERT INTO department (dept_name, manager_id, location_id)
VALUES 
('Financeiro', 1, 1),
('Vendas', 2, 2),
('TI', 3, 3);

INSERT INTO employee (emp_name, dept_id, job_title)
VALUES 
('João Silva', 1, 'Analista'),
('Maria Oliveira', 2, 'Vendedora'),
('Carlos Mendes', 3, 'Desenvolvedor'),
('Ana Costa', 1, 'Gerente');

-- Parte 2: Criação dos Índices

-- Índice para otimizar a contagem de empregados por departamento
CREATE INDEX idx_employee_dept ON employee(dept_id);

-- Índice para otimizar a filtragem de departamentos por cidade
CREATE INDEX idx_department_location ON department(location_id);

-- Parte 3: Consultas SQL para Teste

-- Consulta: Departamento com maior número de pessoas
SELECT dept_name, COUNT(*) AS Total_Employees
FROM department
JOIN employee ON department.dept_id = employee.dept_id
GROUP BY dept_name
ORDER BY Total_Employees DESC
LIMIT 1;

-- Consulta: Departamentos por cidade
SELECT city, dept_name
FROM dept_locations
JOIN department ON dept_locations.location_id = department.location_id
ORDER BY city, dept_name;

-- Consulta: Relação de empregados por departamento
SELECT dept_name, emp_name
FROM department
JOIN employee ON department.dept_id = employee.dept_id
ORDER BY dept_name, emp_name;

-- Parte 4: Criação da Procedure para Manipulação de Dados

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

-- Parte 5: Chamadas de Exemplos da Procedure

-- Inserir um novo estudante
CALL ManipularDados(1, 'Estudantes', NULL, 'Ana Souza', 'Engenharia');

-- Atualizar um produto
CALL ManipularDados(2, 'Produtos', 1, 'Notebook Lenovo', '2500.00');

-- Remover um estudante
CALL ManipularDados(3, 'Estudantes', 1, NULL, NULL);
