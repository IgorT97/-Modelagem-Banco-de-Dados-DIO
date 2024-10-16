   CREATE TRIGGER before_delete_user
   BEFORE DELETE ON Users
   FOR EACH ROW
   BEGIN
       INSERT INTO DeletedUsers (user_id, username, email, deleted_at)
       VALUES (OLD.user_id, OLD.username, OLD.email, NOW());
   END;

-- Inserção de novos colaboradores e atualização do salário base
   CREATE TRIGGER before_update_employee_salary
   BEFORE UPDATE ON Employees
   FOR EACH ROW
   BEGIN
       IF NEW.salary <> OLD.salary THEN
           INSERT INTO SalaryChanges (emp_id, old_salary, new_salary, change_date)
           VALUES (OLD.emp_id, OLD.salary, NEW.salary, NOW());
       END IF;
   END;
