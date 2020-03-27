SELECT first_name, salary,
    CASE 
	WHEN salary < 100000 THEN 'UNDER PAID'
	WHEN salary > 100000 THEN 'PAID WELL'
END
FROM employees

SELECT first_name, salary,
    CASE 
	WHEN salary < 100000 THEN 'UNDER PAID'
	WHEN salary > 100000 THEN 'PAID WELL'
END
FROM employees
order by salary desc

SELECT first_name, salary,
    CASE 
	WHEN salary < 100000 THEN 'UNDER PAID'
	WHEN salary > 100000 THEN 'PAID WELL'
	ELSE 'UNPAID'
END
FROM employees
order by salary desc

SELECT first_name, salary,
    CASE 
	WHEN salary < 100000 THEN 'UNDER PAID'
	WHEN salary > 100000 AND salary <160000 THEN 'PAID WELL'
	ELSE 'UNPAID'
END
FROM employees
order by salary desc

SELECT first_name, salary,
    CASE 
	WHEN salary < 100000 THEN 'UNDER PAID'
	WHEN salary > 100000 AND salary <160000 THEN 'PAID WELL'
	ELSE 'EXECUTIVE'
END
FROM employees
order by salary desc

SELECT a.category, COUNT(*)
FROM (
SELECT first_name, salary,
        CASE 
	WHEN salary < 100000 THEN 'UNDER PAID'
	WHEN salary > 100000 AND salary <160000 THEN 'PAID WELL'
	WHEN salary > 160000 THEN 'EXECUTIVE'
	ELSE 'UNPAID'
END as category
    FROM employees
    order by salary desc ) a
group by a.category

SELECT SUM(CASE WHEN salary < 100000 THEN 1 ELSE 0 END) as under_paid,
    SUM(CASE WHEN salary > 100000 AND salary < 150000 THEN 1 ELSE 0 END) as paid_well,
    SUM(CASE WHEN salary > 150000 THEN 1 ELSE 0 END) as executive
FROM employees

SELECT SUM(CASE WHEN department = 'Sports' THEN 1 ELSE 0 END) as Sports_employees,
    SUM(CASE WHEN department = 'Tools' THEN 1 ELSE 0 END) as Tools_employees,
    SUM(CASE WHEN department = 'Computers' THEN 1 ELSE 0 END) as Computers_employees,
    SUM(CASE WHEN department = 'Clothing' THEN 1 ELSE 0 END) as Clothing_employees
FROM employees

SELECT first_name,
    CASE WHEN region_id = 1 THEN(SELECT country
    FROM regions
    WHERE region_id =1) END region_1,
    CASE WHEN region_id = 2 THEN(SELECT country
    FROM regions
    WHERE region_id =1) END region_2
FROM employees

SELECT first_name,
    CASE WHEN region_id = 1 THEN(SELECT country
    FROM regions
    WHERE region_id =1) END region_1,
    CASE WHEN region_id = 2 THEN(SELECT country
    FROM regions
    WHERE region_id =2) END region_2,
    CASE WHEN region_id = 3 THEN(SELECT country
    FROM regions
    WHERE region_id =3) END region_3,
    CASE WHEN region_id = 4 THEN(SELECT country
    FROM regions
    WHERE region_id =4) END region_4,
    CASE WHEN region_id = 5 THEN(SELECT country
    FROM regions
    WHERE region_id =5) END region_5
FROM employees

SELECT first_name,
    CASE WHEN region_id = 1 THEN(SELECT country
    FROM regions
    WHERE region_id =1) END region_1,
    CASE WHEN region_id = 2 THEN(SELECT country
    FROM regions
    WHERE region_id =2) END region_2,
    CASE WHEN region_id = 3 THEN(SELECT country
    FROM regions
    WHERE region_id =3) END region_3,
    CASE WHEN region_id = 4 THEN(SELECT country
    FROM regions
    WHERE region_id =4) END region_4,
    CASE WHEN region_id = 5 THEN(SELECT country
    FROM regions
    WHERE region_id =5) END region_5,
    CASE WHEN region_id = 6 THEN(SELECT country
    FROM regions
    WHERE region_id =6) END region_6,
    CASE WHEN region_id = 7 THEN(SELECT country
    FROM regions
    WHERE region_id =7) END region_7
FROM employees

SELECT COUNT(a.region_1) + COUNT(a.region_2) + COUNT(a.region_3) as United_states
FROM (
SELECT first_name,
        CASE WHEN region_id = 1 THEN(SELECT country
        FROM regions
        WHERE region_id =1) END region_1,
        CASE WHEN region_id = 2 THEN(SELECT country
        FROM regions
        WHERE region_id =2) END region_2,
        CASE WHEN region_id = 3 THEN(SELECT country
        FROM regions
        WHERE region_id =3) END region_3,
        CASE WHEN region_id = 4 THEN(SELECT country
        FROM regions
        WHERE region_id =4) END region_4,
        CASE WHEN region_id = 5 THEN(SELECT country
        FROM regions
        WHERE region_id =5) END region_5,
        CASE WHEN region_id = 6 THEN(SELECT country
        FROM regions
        WHERE region_id =6) END region_6,
        CASE WHEN region_id = 7 THEN(SELECT country
        FROM regions
        WHERE region_id =7) END region_7
    FROM employees) a

SELECT
    first_name,
    salary
FROM employees
WHERE salary > (SELECT round(AVG(salary))
FROM employees)

SELECT
    first_name,
    salary
FROM employees e1
WHERE salary > (SELECT round(AVG(salary))
FROM employees e2
WHERE e1.department = e2.department)

SELECT
    first_name,
    salary
FROM employees e1
WHERE salary > (SELECT round(AVG(salary))
FROM employees e2
WHERE e1.region_id = e2.region_id)

SELECT department
FROM departments
WHERE 38 < (SELECT COUNT(*)
FROM employees e
WHERE e.department = departments.department)

SELECT distinct department
FROM departments e1
WHERE 38 < (SELECT COUNT(*)
FROM employees e2
WHERE e1.department = e2.department)

SELECT distinct department, (SELECT MAX(salary)
    FROM employees
    WHERE department = e1.department)
FROM departments e1
WHERE 38 < (SELECT COUNT(*)
FROM employees e2
WHERE e1.department = e2.department)

