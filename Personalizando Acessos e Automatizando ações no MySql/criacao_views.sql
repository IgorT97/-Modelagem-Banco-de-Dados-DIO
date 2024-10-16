-- Número de empregados por departamento e localidade
  CREATE VIEW EmpregadosPorDeptLocalidade AS
   SELECT d.dept_name, l.city, COUNT(e.emp_id) AS num_empregados
   FROM department d
   JOIN employee e ON d.dept_id = e.dept_id
   JOIN dept_locations l ON d.location_id = l.location_id
   GROUP BY d.dept_name, l.city;

-- Lista de departamentos e seus gerentes
   CREATE VIEW EmpregadosPorDeptLocalidade AS
   SELECT d.dept_name, l.city, COUNT(e.emp_id) AS num_empregados
   FROM department d
   JOIN employee e ON d.dept_id = e.dept_id
   JOIN dept_locations l ON d.location_id = l.location_id
   GROUP BY d.dept_name, l.city;

-- Projetos com maior número de empregados
   CREATE VIEW ProjetosMaisEmpregados AS
   SELECT p.proj_name, COUNT(w.emp_id) AS num_empregados
   FROM project p
   JOIN works_on w ON p.proj_id = w.proj_id
   GROUP BY p.proj_name
   ORDER BY num_empregados DESC;

-- Lista de projetos, departamentos e gerentes
   CREATE VIEW EmpregadosPorDeptLocalidade AS
   SELECT d.dept_name, l.city, COUNT(e.emp_id) AS num_empregados
   FROM department d
   JOIN employee e ON d.dept_id = e.dept_id
   JOIN dept_locations l ON d.location_id = l.location_id
   GROUP BY d.dept_name, l.city;

-- Quais empregados possuem dependentes e se são gerentes
   CREATE VIEW EmpregadosDependentesGerentes AS
   SELECT e.emp_name, d.dep_name, 
          CASE WHEN e.emp_id = dept.manager_id THEN 'Sim' ELSE 'Não' END AS is_gerente
   FROM employee e
   JOIN dependent d ON e.emp_id = d.emp_id
   JOIN department dept ON e.dept_id = dept.dept_id;

-- Criação de Usuários e Definição de Permissões
   -- Criação de usuário gerente
   CREATE USER 'gerente'@'localhost' IDENTIFIED BY 'senha_gerente';
   GRANT SELECT ON Company.EmpregadosPorDeptLocalidade TO 'gerente'@'localhost';
   GRANT SELECT ON Company.DepartamentosGerentes TO 'gerente'@'localhost';
   GRANT SELECT ON Company.ProjetosMaisEmpregados TO 'gerente'@'localhost';
   GRANT SELECT ON Company.ProjetosDepartamentosGerentes TO 'gerente'@'localhost';
   GRANT SELECT ON Company.EmpregadosDependentesGerentes TO 'gerente'@'localhost';

   -- Criação de usuário empregado
   CREATE USER 'empregado'@'localhost' IDENTIFIED BY 'senha_empregado';
   GRANT SELECT ON Company.EmpregadosPorDeptLocalidade TO 'empregado'@'localhost';
   GRANT SELECT ON Company.ProjetosMaisEmpregados TO 'empregado'@'localhost';
   GRANT SELECT ON Company.EmpregadosDependentesGerentes TO 'empregado'@'localhost';
