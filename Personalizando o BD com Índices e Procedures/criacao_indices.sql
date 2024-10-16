
-- Criação de índice no dept_id em employee para otimizar a contagem
   CREATE INDEX idx_employee_dept ON employee(dept_id);

-- Criação de índice no location_id em department para otimizar a filtragem por cidade
   CREATE INDEX idx_department_location ON department(location_id);

-- Índice já criado acima em employee(dept_id) otimiza esta consulta
