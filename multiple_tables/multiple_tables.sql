SELECT distinct employees.department, departments.department
FROM employees INNER JOIN departments ON employees.department = departments.department



SELECT distinct employees.department, departments.department
FROM employees LEFT JOIN departments ON employees.department = departments.department



SELECT distinct employees.department, departments.department
FROM employees RIGHT JOIN departments ON employees.department = departments.department



SELECT distinct employees.department, departments.department
FROM employees LEFT JOIN departments ON employees.department = departments.department



SELECT distinct employees.department employees_department, departments.department departments_department
FROM employees RIGHT JOIN departments ON employees.department = departments.department



SELECT distinct employees.department employees_department
FROM employees LEFT JOIN departments ON employees.department = departments.department
WHERE departments.department IS NULL




SELECT distinct employees.department employees_department,
    departments.department departments_department
FROM employees LEFT OUTER JOIN departments ON employees.department = departments.department

    SELECT DISTINCT department
    FROM employees
UNION
    SELECT department
    FROM departments




SELECT distinct employees.department employees_department,
    departments.department departments_department
FROM employees LEFT OUTER JOIN departments ON employees.department = departments.department

    SELECT DISTINCT department
    FROM employees
UNION
    SELECT department
    FROM departments

    SELECT department
    FROM employees
UNION ALL
    SELECT department
    FROM departments

    SELECT distinct department
    FROM employees
UNION ALL
    SELECT department
    FROM departments
ORDER BY department

    SELECT distinct department
    FROM employees
UNION ALL
    SELECT department
    FROM departments
UNION
    SELECT country
    FROM regions
ORDER BY department

    SELECT distinct department
    FROM employees
EXCEPT
    SELECT department
    FROM departments

    SELECT department, count(*)
    FROM employees
    GROUP BY department
UNION ALL
    SELECT 'TOTAL', COUNT(*)
    FROM employees

SELECT first_name, department, hire_date, country
FROM employees e INNER JOIN regions r
    ON e.region_id = r.region_id
WHERE hire_date = (SELECT MIN(hire_date)
FROM employees e2)

    SELECT first_name, department, hire_date, country
    FROM employees e INNER JOIN regions r
        ON e.region_id = r.region_id
    WHERE hire_date = (SELECT MIN(hire_date)
    FROM employees e2)
UNION ALL
    SELECT first_name, department, hire_date, country
    FROM employees e INNER JOIN regions r
        ON e.region_id = r.region_id
    WHERE hire_date = (SELECT MAX(hire_date)
    FROM employees e2)

(SELECT first_name, department, hire_date, country
FROM employees e INNER JOIN regions r
    ON e.region_id = r.region_id
WHERE hire_date = (SELECT MIN(hire_date)
FROM employees e2)
LIMIT 1)
UNION ALL
SELECT first_name, department, hire_date, country
FROM employees e INNER JOIN regions r
    ON e.region_id = r.region_id
WHERE hire_date = (SELECT MAX(hire_date)
FROM employees e2)
ORDER BY hire_date

SELECT hire_date, salary,
    (SELECT SUM(salary)
    FROM employees e2
    WHERE e2.hire_date BETWEEN e.hire_date - 90 AND e.hire_date) as spending_pattern
FROM employees e
ORDER BY hire_date

SELECT first_name, email, e.department, salary, division, region, country
FROM employees e, departments d, regions r
WHERE e.department = d.department
    AND e.region_id = r.region_id

CREATE VIEW v_employee_information
as
    SELECT first_name, email, e.department, salary, division, region, country
    FROM employees e, departments d, regions r
    WHERE e.department = d.department
        AND e.region_id = r.region_id

SELECT department, first_name, (SELECT count(*)
    FROM employees e1
    where e1.department = e2.department)
FROM employees e2
GROUP BY department, first_name

(
Select first_name, department,
    (Select count(*)
    from employees e2
    where e2.department = e1.department)
From employees e1
Order by department
)
except
select first_name, department,
    count(*) over(partition by department)
from employees e2


select first_name, department,
    SUM(salary) over(partition by department)
from employees e2

select first_name, department,
    SUM(salary) over()
from employees e2

SELECT first_name, department,
    COUNT(*) OVER(PARTITION BY department) dept_count,
    region_id,
    COUNT(*) OVER(PARTITION by region_id) region_count
FROM employees e2

SELECT first_name, department, count(*) over (PARTITION BY department)
FROM employees
WHERE region_id = 3

SELECT first_name, hire_date, salary
FROM employees















