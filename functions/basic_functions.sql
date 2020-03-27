
SELECT UPPER(first_name)
FROM employees

SELECT UPPER(first_name), LOWER(department)
FROM employees

SELECT TRIM('    HELLO THERE    ')

SELECT LENGTH(TRIM('    HELLO THERE    '))


SELECT first_name || last_name
FROM employees

SELECT first_name ||' '|| last_name
FROM employees

SELECT first_name ||' '|| last_name as full_name
FROM employees

SELECT department, (department like '%oth'
)
from employees

SELECT SUBSTRING(email, POSITION('@' IN email))
FROM employees

SELECT SUBSTRING(email, POSITION('@' IN email)+1)
FROM employees

SELECT COALESCE(email,'NONE') as email
FROM employees

SELECT MAX(salary)
FROM employees


SELECT ROUND(AVG(salary))
FROM employees

SELECT COUNT(email)
FROM employees

SELECT SUM(salary)
FROM employees