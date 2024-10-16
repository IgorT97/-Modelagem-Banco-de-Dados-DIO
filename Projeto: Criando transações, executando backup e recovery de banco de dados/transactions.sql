-- transactions.sql

-- Desabilitar o autocommit
SET autocommit = 0;

-- Iniciar uma transação
START TRANSACTION;

-- Exemplo de consultas e modificações de dados
INSERT INTO employee (emp_name, dept_id, job_title) VALUES ('Lucas Silva', 1, 'Analista');
UPDATE employee SET job_title = 'Senior Analista' WHERE emp_id = 1;

-- Confirmar a transação
COMMIT;

-- Habilitar o autocommit novamente
SET autocommit = 1;
