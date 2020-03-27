SELECT employees.department, *
FROM employees, departments

SELECT employees.department
FROM employees, departments

SELECT *
FROM employees
WHERE department NOT IN ('DEPART1', 'DEPART2')

SELECT *
FROM employees
WHERE department NOT IN (SELECT department
FROM departments)

SELECT *
FROM (SELECT *
    FROM employees
    WHERE salary > 150000) a

SELECT a.first_name, a.salary
FROM (SELECT *
    FROM employees
    WHERE salary > 150000) a

SELECT a.employee_name, a.yearly_salary
FROM (SELECT first_name employee_name, salary yearly_salary
    FROM employees
    WHERE salary > 150000) a

SELECT employee_name, yearly_salary
FROM (SELECT first_name employee_name, salary yearly_salary
    FROM employees
    WHERE salary > 150000) a

SELECT a.employee_name, yearly_salary
FROM (SELECT first_name employee_name, salary yearly_salary
    FROM employees
    WHERE salary > 150000) a,
    (SELECT department employee_name
    FROM departments) b

SELECT *
FROM employees
WHERE department IN (SELECT department
FROM departments)

SELECT first_name, last_name, salary, (SELECT first_name
    FROM employees 
    limit
1)
FROM employees

SELECT *
FROM departments

SELECT *
FROM employees
WHERE department IN (SELECT department
FROM departments
WHERE division = 'Electronics')

SELECT *
FROM employees
WHERE salary > 130000
    AND region_id IN (SELECT region_id
    from regions
    WHERE country='Asian' OR country= 'Canada' )

SELECT first_name, department, (SELECT MAX(salary)
    from employees) - salary
FROM employees

SELECT first_name, department, (SELECT MAX(salary)
    from employees) - salary
FROM employees
WHERE region_id IN (SELECT region_id
FROM regions
WHERE country IN('Asia','Canada'))

SELECT *
FROM employees
WHERE department = ANY( SELECT department
from departments
WHERE division = 'Kids')