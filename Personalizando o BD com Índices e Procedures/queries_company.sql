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
