WITH RECURSIVE employee_hierarchy AS (
    SELECT
        employee_id,
        name,
        manager_id,
        1 AS level
    FROM employees
    WHERE manager_id IS NULL
    UNION ALL
    SELECT
        e.employee_id,
        e.name,
        e.manager_id,
        eh.level + 1
    FROM employees e
    INNER JOIN employee_hierarchy eh ON e.manager_id = eh.employee_id
)
SELECT
    employee_id,
    name,
    manager_id,
    level
FROM employee_hierarchy
ORDER BY level, employee_id;