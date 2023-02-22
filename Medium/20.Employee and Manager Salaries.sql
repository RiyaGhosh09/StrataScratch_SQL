select e.first_name as employee_name, e.salary as emp_salary
from employee e join employee e2 on e.manager_id = e2.id
where e.salary > e2.salary;
