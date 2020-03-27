SELECT department, first_name, salary,
    (SELECT max(salary)
    FROM employees e2
    WHERE e1.department = e2.department) as max_by_department,
    (SELECT min(salary)
    FROM employees e2
    WHERE e1.department = e2.department) as min_by_department
FROM employees e1
order by department

SELECT department, first_name, salary
FROM (
SELECT department, first_name, salary,
        (SELECT max(salary)
        FROM employees e2
        WHERE e1.department = e2.department) as max_by_department,
        (SELECT min(salary)
        FROM employees e2
        WHERE e1.department = e2.department) as min_by_department
    FROM employees e1
    order by department
	) a
WHERE salary = max_by_department
    OR salary = min_by_department

SELECT department, first_name, salary ,
    CASE WHEN salary = max_by_department THEN 'HIGHEST SALARY'
 WHEN salary = min_by_department THEN 'LOWEST SALARY'
END as salary_in_department
FROM (
SELECT department, first_name, salary,
        (SELECT max(salary)
        FROM employees e2
        WHERE e1.department = e2.department) as max_by_department,
        (SELECT min(salary)
        FROM employees e2
        WHERE e1.department = e2.department) as min_by_department
    FROM employees e1
    order by department
	) a
WHERE salary = max_by_department
    OR salary = min_by_department

SELECT first_name, country
FROM employees, regions
WHERE employees.region_id = regions.region_id

SELECT first_name, email, division
FROM employees, departments
WHERE employees.department = departments.department

SELECT first_name, email, division
FROM employees, departments
WHERE employees.department = departments.department
    AND email IS NOT NULL

SELECT first_name, email, employees.department, division, country
FROM employees, departments, regions
WHERE employees.department = departments.department
    AND employees.region_id = regions.region_id
    AND email IS NOT NULL


SELECT first_name, email, e.department, division, country
FROM employees e, departments d, regions r
WHERE e.department = d.department
    AND e.region_id = r.region_id
    AND email IS NOT NULL

SELECT count(employee_id), country
FROM employees e, (SELECT *
    FROM regions) r
WHERE e.region_id = r.region_id
GROUP BY country

SELECT first_name, country
FROM employees INNER JOIN regions
    ON employees.region_id = regions.region_id
	