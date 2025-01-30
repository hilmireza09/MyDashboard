SELECT
    e1.name AS employee,
    e1.salary AS employee_salary,
    e2.name AS manager,
    e2.salary AS manager_salary
FROM employees e1
JOIN employees e2 ON e1.manager_id = e2.employee_id
WHERE e1.salary > e2.salary;