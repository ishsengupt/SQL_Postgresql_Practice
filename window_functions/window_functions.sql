SELECT first_name, hire_date, salary,
    SUM(salary) OVER(ORDER BY hire_date RANGE BETWEEN UNBOUNDED PRECEDING
				AND CURRENT ROW) as running_total_of_salries
FROM employees

SELECT first_name, hire_date, salary,
    SUM(salary) OVER(PARTITION BY department ORDER BY hire_date) as running_total_of_salries
FROM employees

SELECT first_name, hire_date, salary,
    SUM(salary) OVER( ORDER BY hire_date ROWS BETWEEN 1 PRECEDING AND CURRENT ROW)
FROM employees

SELECT first_name, hire_date, department, salary,
    SUM(salary) OVER( ORDER BY hire_date ROWS BETWEEN 1000 PRECEDING AND CURRENT ROW)
FROM employees

SELECT first_name, hire_date, department, salary,
    SUM(salary) OVER( ORDER BY hire_date ROWS BETWEEN 1000 PRECEDING AND CURRENT ROW)
FROM employees

SELECT first_name, email, department, salary,
    RANK() OVER(PARTITION BY department ORDER BY salary DESC)
FROM employees

SELECT *
FROM
    (SELECT first_name, email, department, salary,
        RANK() OVER(PARTITION BY department ORDER BY salary DESC)
    FROM employees) a
WHERE rank = 8

SELECT first_name, email, department, salary,
    NTILE(5) OVER(PARTITION BY department ORDER BY salary DESC)
FROM employees

SELECT first_name, email, department, salary,
    NTILE(5) OVER(PARTITION BY department ORDER BY salary DESC) salary_bracket
FROM employees

SELECT first_name, email, department, salary,
    MAX(salary) OVER(PARTITION BY department ORDER BY salary DESC) salary_bracket
FROM employees

    SELECT first_name, email, department, salary,
        MAX(salary) OVER(PARTITION BY department ORDER BY salary DESC) salary_bracket
    FROM employees
EXCEPT
    SELECT first_name, email, department, salary,
        FIRST_VALUE(salary) OVER(PARTITION BY department ORDER BY salary DESC) salary_bracket
    FROM employees

SELECT first_name, email, department, salary,
    FIRST_VALUE(salary) OVER(PARTITION BY department ORDER BY first_name DESC) salary_bracket
FROM employees

select first_name, last_name, salary,
    LAG(salary) OVER() previous_salary
FROM employees

SELECT department, last_name, salary,
    LAG(salary) OVER (ORDER BY salary desc) next_higher_salary
FROM employees

CREATE TABLE sales
(
    continent varchar(20),
    country varchar(20),
    city varchar(20),
    units_sold integer
);

INSERT INTO sales
VALUES
    ('North America', 'Canada', 'Toronto', 10000);
INSERT INTO sales
VALUES
    ('North America', 'Canada', 'Montreal', 5000);
INSERT INTO sales
VALUES
    ('North America', 'Canada', 'Vancouver', 15000);
INSERT INTO sales
VALUES
    ('Asia', 'China', 'Hong Kong', 7000);
INSERT INTO sales
VALUES
    ('Asia', 'China', 'Shanghai', 3000);
INSERT INTO sales
VALUES
    ('Asia', 'Japan', 'Tokyo', 5000);
INSERT INTO sales
VALUES
    ('Europe', 'UK', 'London', 6000);
INSERT INTO sales
VALUES
    ('Europe', 'UK', 'Manchester', 12000);
INSERT INTO sales
VALUES
    ('Europe', 'France', 'Paris', 5000);


SELECT continent, sum(units_sold)
FROM sales
GROUP BY continent

SELECT city, sum(units_sold)
FROM sales
GROUP BY city

SELECT continent, country, city, sum(units_sold)
FROM sales
GROUP BY GROUPING SETS(continent, country, city)

SELECT continent, country, city, sum(units_sold)
FROM sales
GROUP BY ROLLUP(continent, country, city)

SELECT continent, country, city, sum(units_sold)
FROM sales
GROUP BY CUBE(continent, country, city)






