SELECT *
FROM employees
WHERE 1 < 1

SELECT *
FROM employees
WHERE department = 'Clothing'
    AND salary > 90000

SELECT *
FROM employees
WHERE department = 'Clothing'
    OR salary > 90000

SELECT *
FROM employees
WHERE salary < 40000
    AND (department = 'Clothing'
    OR department = 'Pharmacy')

SELECT *
FROM employees
WHERE department like 'F%nitu%';

SELECT *
FROM employees
WHERE NOT department = 'Sports'

SELECT *
FROM employees
WHERE department <> 'Sports'

SELECT *
FROM employees
WHERE NOT department <> 'Sports'

SELECT *
FROM employees
WHERE email IS NULL

SELECT *
FROM employees
WHERE salary IS NULL

SELECT *
FROM employees
WHERE NOT email IS NULL

SELECT *
FROM employees
WHERE department IN ('First Aid', 'Sports')

SELECT *
FROM employees
WHERE salary BETWEEN 80000 AND 100000

SELECT first_name, email
FROM employees
WHERE gender = 'F'
    AND department = 'Tools'
    AND salary > 10000

SELECT first_name, hire_date
FROM employees
WHERE salary > 165000
    OR (gender = 'M' and department = 'Sports')


SELECT first_name, hire_date
FROM employees
WHERE hire_date BETWEEN '2002-01-01' 
AND '2004-01-01'

SELECT *
FROM employees
WHERE salary > 40000
    AND salary < 100000
    AND department = 'Automotive'
    AND gender = 'M'
    OR (gender = 'F' and department = 'Toys')







