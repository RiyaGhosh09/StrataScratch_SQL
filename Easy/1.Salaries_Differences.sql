select abs
  ((select max(salary) as s from db_employee e join db_dept d on e.department_id = d.id where department = 'marketing') - 
  (select max(salary) as s from db_employee e join db_dept d on e.department_id = d.id where department = 'engineering'))
as salary_difference;
