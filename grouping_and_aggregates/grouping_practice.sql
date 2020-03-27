SELECT *
FROM cars

SELECT COUNT(*)
FROM cars
GROUP BY make

SELECT COUNT(*) , make
FROM cars
GROUP BY make

SELECT SUM(salary), department
FROM employees
WHERE 1=1
GROUP BY department


SELECT SUM(salary), department
FROM employees
WHERE region_id in (4,5,6,7)
GROUP BY department

SELECT COUNT(employee_id), department
FROM employees
GROUP BY department

SELECT COUNT(employee_id), department, MIN(salary), MAX(salary)
FROM employees
GROUP BY department

SELECT COUNT(employee_id) total_number_employees, department,
    AVG(salary) avg_sal, MIN(salary) min_sal , MAX(salary) max_sal
FROM employees
GROUP BY department
ORDER BY total_number_employees

SELECT COUNT(*) total_number_employees, department,
    round(AVG(salary)) avg_sal, MIN(salary) min_sal , MAX(salary) max_sal
FROM employees
GROUP BY department
ORDER BY total_number_employees

SELECT department, gender, count(*)
FROM employees
GROUP BY department, gender
order by department

SELECT first_name, count(*)
FROM employees
GROUP BY first_name

SELECT first_name, count(*)
FROM employees
GROUP BY first_name
HAVING count(*) > 1

SELECT first_name, count(*)
FROM employees
GROUP BY first_name
HAVING count(*) > 2

SELECT department
FROM employees
GROUP BY department

SELECT substring(email, position('@' IN EMAIL))
FROM employees

SELECT substring(email, position('@' IN email) +1)  as email_domain, count(*)
FROM employees
GROUP BY email_domain

SELECT substring(email, position('@' IN email) +1) as email_domain, count(*)
FROM employees
WHERE email IS NOT NULL
GROUP BY email_domain

SELECT substring(email, position('@' IN email) +1) as email_domain, count(*)
FROM employees
WHERE email IS NOT NULL
GROUP BY email_domain
ORDER BY COUNT(*) DESC

SELECT gender, region_id, MAX(salary), MIN(salary), AVG(salary)
FROM employees
GROUP BY gender, region_id

SELECT first_name, last_name, *
FROM employees












