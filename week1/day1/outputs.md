-- 1. Select all columns from Employee --
SELECT * FROM Employee;

Output :

| emp_id | name        | age | salary  | department_id | hire_date  |
| ------ | ----------- | --- | ------- | ------------- | ---------- |
| 1      | John Doe    | 28  | 50000.0 | 1             | 2020-01-15 |
| 2      | Jane Smith  | 34  | 60000.0 | 2             | 2019-07-23 |
| 3      | Bob Brown   | 45  | 80000.0 | 1             | 2018-02-12 |
| 4      | Alice Blue  | 25  | 45000.0 | 3             | 2021-03-22 |
| 5      | Charlie P.  | 29  | 50000.0 | 2             | 2019-12-01 |
| 6      | David Green | 38  | 70000.0 | 4             | 2022-05-18 |
| 7      | Eve Black   | 40  | 55000.0 | 3             | 2021-08-30 |
| 8      | Frank White | 32  | 48000.0 |               | 2021-07-10 |
| 9      | Grace Kelly | 27  | 65000.0 | 1             | 2018-11-13 |
| 10     | Hannah Lee  | 30  | 53000.0 | 4             | 2020-02-25 |



-- 2. Select name and salary --
SELECT name, salary FROM Employee;

Output:

| name        | salary  |
| ----------- | ------- |
| John Doe    | 50000.0 |
| Jane Smith  | 60000.0 |
| Bob Brown   | 80000.0 |
| Alice Blue  | 45000.0 |
| Charlie P.  | 50000.0 |
| David Green | 70000.0 |
| Eve Black   | 55000.0 |
| Frank White | 48000.0 |
| Grace Kelly | 65000.0 |
| Hannah Lee  | 53000.0 |


-- 3. Employees older than 30 --
SELECT * FROM Employee
WHERE age > 30;

Output:

| emp_id | name        | age | salary  | department_id | hire_date  |
| ------ | ----------- | --- | ------- | ------------- | ---------- |
| 2      | Jane Smith  | 34  | 60000.0 | 2             | 2019-07-23 |
| 3      | Bob Brown   | 45  | 80000.0 | 1             | 2018-02-12 |
| 6      | David Green | 38  | 70000.0 | 4             | 2022-05-18 |
| 7      | Eve Black   | 40  | 55000.0 | 3             | 2021-08-30 |
| 8      | Frank White | 32  | 48000.0 |               | 2021-07-10 |


-- 4. Names of all departments --
SELECT name FROM Department;

Output:

| name      |
| --------- |
| IT        |
| HR        |
| Finance   |
| Marketing |



-- 5. Employees in IT department --
SELECT * FROM Employee
WHERE department_id = (
    SELECT department_id FROM Department WHERE name = 'IT'
);

Output:

| emp_id | name        | age | salary  | department_id | hire_date  |
| ------ | ----------- | --- | ------- | ------------- | ---------- |
| 1      | John Doe    | 28  | 50000.0 | 1             | 2020-01-15 |
| 3      | Bob Brown   | 45  | 80000.0 | 1             | 2018-02-12 |
| 9      | Grace Kelly | 27  | 65000.0 | 1             | 2018-11-13 |


-- 6. Names start with J --
SELECT * FROM Employee
WHERE name LIKE 'J%';

Output:

| emp_id | name       | age | salary  | department_id | hire_date  |
| ------ | ---------- | --- | ------- | ------------- | ---------- |
| 1      | John Doe   | 28  | 50000.0 | 1             | 2020-01-15 |
| 2      | Jane Smith | 34  | 60000.0 | 2             | 2019-07-23 |


-- 7. Names end with e --
SELECT * FROM Employee
WHERE name LIKE '%e';

Output:
| emp_id | name        | age | salary  | department_id | hire_date  |
| ------ | ----------- | --- | ------- | ------------- | ---------- |
| 1      | John Doe    | 28  | 50000.0 | 1             | 2020-01-15 |
| 4      | Alice Blue  | 25  | 45000.0 | 3             | 2021-03-22 |
| 8      | Frank White | 32  | 48000.0 |               | 2021-07-10 |
| 10     | Hannah Lee  | 30  | 53000.0 | 4             | 2020-02-25 |



-- 8. Names contain a --
SELECT * FROM Employee
WHERE name LIKE '%a%';

Output:
| emp_id | name        | age | salary  | department_id | hire_date  |
| ------ | ----------- | --- | ------- | ------------- | ---------- |
| 2      | Jane Smith  | 34  | 60000.0 | 2             | 2019-07-23 |
| 4      | Alice Blue  | 25  | 45000.0 | 3             | 2021-03-22 |
| 5      | Charlie P.  | 29  | 50000.0 | 2             | 2019-12-01 |
| 6      | David Green | 38  | 70000.0 | 4             | 2022-05-18 |
| 7      | Eve Black   | 40  | 55000.0 | 3             | 2021-08-30 |
| 8      | Frank White | 32  | 48000.0 |               | 2021-07-10 |
| 9      | Grace Kelly | 27  | 65000.0 | 1             | 2018-11-13 |
| 10     | Hannah Lee  | 30  | 53000.0 | 4             | 2020-02-25 |



-- 9. Names with 9 characters --
SELECT * FROM Employee
WHERE CHAR_LENGTH(name) = 9;

Output:
| emp_id | name      | age | salary  | department_id | hire_date  |
| ------ | --------- | --- | ------- | ------------- | ---------- |
| 3      | Bob Brown | 45  | 80000.0 | 1             | 2018-02-12 |
| 7      | Eve Black | 40  | 55000.0 | 3             | 2021-08-30 |


-- 10. 'o' as second character --
SELECT * FROM Employee
WHERE name LIKE '_o%';

Output:
| emp_id | name      | age | salary  | department_id | hire_date  |
| ------ | --------- | --- | ------- | ------------- | ---------- |
| 1      | John Doe  | 28  | 50000.0 | 1             | 2020-01-15 |
| 3      | Bob Brown | 45  | 80000.0 | 1             | 2018-02-12 |



-- 11. Hired in 2020 --
SELECT * FROM Employee
WHERE hire_date BETWEEN '2020-01-01' AND '2020-12-31';

Output:
| emp_id | name       | age | salary  | department_id | hire_date  |
| ------ | ---------- | --- | ------- | ------------- | ---------- |
| 1      | John Doe   | 28  | 50000.0 | 1             | 2020-01-15 |
| 10     | Hannah Lee | 30  | 53000.0 | 4             | 2020-02-25 |



-- 12. Hired in January --
SELECT * FROM Employee
WHERE MONTH(hire_date) = 1;

Output:
| emp_id | name     | age | salary  | department_id | hire_date  |
| ------ | -------- | --- | ------- | ------------- | ---------- |
| 1      | John Doe | 28  | 50000.0 | 1             | 2020-01-15 |


-- 13. Hired before 2019 --
SELECT * FROM Employee
WHERE hire_date < '2019-01-01';

Output:
| emp_id | name        | age | salary  | department_id | hire_date  |
| ------ | ----------- | --- | ------- | ------------- | ---------- |
| 3      | Bob Brown   | 45  | 80000.0 | 1             | 2018-02-12 |
| 9      | Grace Kelly | 27  | 65000.0 | 1             | 2018-11-13 |


-- 14. Hired on/after March 1 2021 --
SELECT * FROM Employee
WHERE hire_date >= '2021-03-01';

Output:

| emp_id | name        | age | salary  | department_id | hire_date  |
| ------ | ----------- | --- | ------- | ------------- | ---------- |
| 4      | Alice Blue  | 25  | 45000.0 | 3             | 2021-03-22 |
| 6      | David Green | 38  | 70000.0 | 4             | 2022-05-18 |
| 7      | Eve Black   | 40  | 55000.0 | 3             | 2021-08-30 |
| 8      | Frank White | 32  | 48000.0 |               | 2021-07-10 |


-- 15. Hired in last 2 years --
SELECT * FROM Employee
WHERE hire_date >= DATE_SUB(CURDATE(), INTERVAL 2 YEAR);

Output:

There are no results to be displayed.

-- 16. Total salary --
SELECT SUM(salary) AS total_salary FROM Employee;

Output:
| total_salary |
| ------------ |
| 576000.0     |


-- 17. Average salary --
SELECT AVG(salary) AS avg_salary FROM Employee;

Output:
| avg_salary |
| ---------- |
| 57600.0    |


-- 18. Minimum salary --
SELECT MIN(salary) AS min_salary FROM Employee;

Output:
| min_salary |
| ---------- |
| 45000.0    |


-- 19. Employees count per department --
SELECT department_id, COUNT(*) AS total
FROM Employee
GROUP BY department_id;

Output:

| department_id | total |
| ------------- | ----- |
|               | 1     |
| 1             | 3     |
| 2             | 2     |
| 3             | 2     |
| 4             | 2     |


-- 20. Avg salary per department --
SELECT department_id, AVG(salary) AS avg_salary
FROM Employee
GROUP BY department_id;

Output:

| department_id | avg_salary |
| ------------- | ---------- |
|               | 48000.0    |
| 1             | 65000.0    |
| 2             | 55000.0    |
| 3             | 50000.0    |
| 4             | 61500.0    |


-- 21. Total salary per department --
SELECT department_id, SUM(salary) AS total_salary
FROM Employee
GROUP BY department_id;

Output:

| department_id | total_salary |
| ------------- | ------------ |
|               | 48000.0      |
| 1             | 195000.0     |
| 2             | 110000.0     |
| 3             | 100000.0     |
| 4             | 123000.0     |


-- 22. Avg age per department --
SELECT department_id, AVG(age) AS avg_age
FROM Employee
GROUP BY department_id;

Output:

| department_id | avg_age |
| ------------- | ------- |
|               | 32.0    |
| 1             | 33.3333 |
| 2             | 31.5    |
| 3             | 32.5    |
| 4             | 34.0    |


-- 23. Employees hired per year --
SELECT YEAR(hire_date) AS year, COUNT(*) AS total
FROM Employee
GROUP BY YEAR(hire_date);

Output:
| year | total |
| ---- | ----- |
| 2018 | 2     |
| 2019 | 2     |
| 2020 | 2     |
| 2021 | 3     |
| 2022 | 1     |



-- 24. Highest salary per department --
SELECT department_id, MAX(salary) AS max_salary
FROM Employee
GROUP BY department_id;

Output:

| department_id | max_salary |
| ------------- | ---------- |
|               | 48000.0    |
| 1             | 80000.0    |
| 2             | 60000.0    |
| 3             | 55000.0    |
| 4             | 70000.0    |


-- 25. Department with highest avg salary --
SELECT department_id
FROM Employee
GROUP BY department_id
ORDER BY AVG(salary) DESC
LIMIT 1;

Output:
| department_id |
| ------------- |
| 1             |


-- 26. Departments with >2 employees --
SELECT department_id
FROM Employee
GROUP BY department_id
HAVING COUNT(*) > 2;

Output:
| department_id |
| ------------- |
| 1             |

-- 27. Departments avg salary > 55000 --
SELECT department_id
FROM Employee
GROUP BY department_id
HAVING AVG(salary) > 55000;

Output:

| department_id |
| ------------- |
| 1             |
| 4             |



-- 28. Years with >1 employee hired --
SELECT YEAR(hire_date)
FROM Employee
GROUP BY YEAR(hire_date)
HAVING COUNT(*) > 1;

Output:

| YEAR(hire_date) |
| --------------- |
| 2018            |
| 2019            |
| 2020            |
| 2021            |


-- 29. Departments total salary < 100000 --
SELECT department_id
FROM Employee
GROUP BY department_id
HAVING SUM(salary) < 100000;

Output:
| department_id |
| ------------- |
|               |


-- 30. Departments max salary > 75000 --
SELECT department_id
FROM Employee
GROUP BY department_id
HAVING MAX(salary) > 75000;

Output:
| department_id |
| ------------- |
| 1             |


-- 31. Employees by salary ASC --
SELECT * FROM Employee
ORDER BY salary ASC;

Output:

| emp_id | name        | age | salary  | department_id | hire_date  |
| ------ | ----------- | --- | ------- | ------------- | ---------- |
| 4      | Alice Blue  | 25  | 45000.0 | 3             | 2021-03-22 |
| 8      | Frank White | 32  | 48000.0 |               | 2021-07-10 |
| 1      | John Doe    | 28  | 50000.0 | 1             | 2020-01-15 |
| 5      | Charlie P.  | 29  | 50000.0 | 2             | 2019-12-01 |
| 10     | Hannah Lee  | 30  | 53000.0 | 4             | 2020-02-25 |
| 7      | Eve Black   | 40  | 55000.0 | 3             | 2021-08-30 |
| 2      | Jane Smith  | 34  | 60000.0 | 2             | 2019-07-23 |
| 9      | Grace Kelly | 27  | 65000.0 | 1             | 2018-11-13 |
| 6      | David Green | 38  | 70000.0 | 4             | 2022-05-18 |
| 3      | Bob Brown   | 45  | 80000.0 | 1             | 2018-02-12 |



-- 32. Employees by age DESC --
SELECT * FROM Employee
ORDER BY age DESC;

Output:

| emp_id | name        | age | salary  | department_id | hire_date  |
| ------ | ----------- | --- | ------- | ------------- | ---------- |
| 3      | Bob Brown   | 45  | 80000.0 | 1             | 2018-02-12 |
| 7      | Eve Black   | 40  | 55000.0 | 3             | 2021-08-30 |
| 6      | David Green | 38  | 70000.0 | 4             | 2022-05-18 |
| 2      | Jane Smith  | 34  | 60000.0 | 2             | 2019-07-23 |
| 8      | Frank White | 32  | 48000.0 |               | 2021-07-10 |
| 10     | Hannah Lee  | 30  | 53000.0 | 4             | 2020-02-25 |
| 5      | Charlie P.  | 29  | 50000.0 | 2             | 2019-12-01 |
| 1      | John Doe    | 28  | 50000.0 | 1             | 2020-01-15 |
| 9      | Grace Kelly | 27  | 65000.0 | 1             | 2018-11-13 |
| 4      | Alice Blue  | 25  | 45000.0 | 3             | 2021-03-22 |


-- 33. Employees by hire date ASC --
SELECT * FROM Employee
ORDER BY hire_date ASC;

Output:
| emp_id | name        | age | salary  | department_id | hire_date  |
| ------ | ----------- | --- | ------- | ------------- | ---------- |
| 3      | Bob Brown   | 45  | 80000.0 | 1             | 2018-02-12 |
| 9      | Grace Kelly | 27  | 65000.0 | 1             | 2018-11-13 |
| 2      | Jane Smith  | 34  | 60000.0 | 2             | 2019-07-23 |
| 5      | Charlie P.  | 29  | 50000.0 | 2             | 2019-12-01 |
| 1      | John Doe    | 28  | 50000.0 | 1             | 2020-01-15 |
| 10     | Hannah Lee  | 30  | 53000.0 | 4             | 2020-02-25 |
| 4      | Alice Blue  | 25  | 45000.0 | 3             | 2021-03-22 |
| 8      | Frank White | 32  | 48000.0 |               | 2021-07-10 |
| 7      | Eve Black   | 40  | 55000.0 | 3             | 2021-08-30 |
| 6      | David Green | 38  | 70000.0 | 4             | 2022-05-18 |


-- 34. Order by department then salary --
SELECT * FROM Employee
ORDER BY department_id, salary;

Output:

| emp_id | name        | age | salary  | department_id | hire_date  |
| ------ | ----------- | --- | ------- | ------------- | ---------- |
| 8      | Frank White | 32  | 48000.0 |               | 2021-07-10 |
| 1      | John Doe    | 28  | 50000.0 | 1             | 2020-01-15 |
| 9      | Grace Kelly | 27  | 65000.0 | 1             | 2018-11-13 |
| 3      | Bob Brown   | 45  | 80000.0 | 1             | 2018-02-12 |
| 5      | Charlie P.  | 29  | 50000.0 | 2             | 2019-12-01 |
| 2      | Jane Smith  | 34  | 60000.0 | 2             | 2019-07-23 |
| 4      | Alice Blue  | 25  | 45000.0 | 3             | 2021-03-22 |
| 7      | Eve Black   | 40  | 55000.0 | 3             | 2021-08-30 |
| 10     | Hannah Lee  | 30  | 53000.0 | 4             | 2020-02-25 |
| 6      | David Green | 38  | 70000.0 | 4             | 2022-05-18 |


-- 35. Departments by total salary --
SELECT department_id, SUM(salary) AS total_salary
FROM Employee
GROUP BY department_id
ORDER BY total_salary;

Output:

| department_id | total_salary |
| ------------- | ------------ |
|               | 48000.0      |
| 3             | 100000.0     |
| 2             | 110000.0     |
| 4             | 123000.0     |
| 1             | 195000.0     |


-- 36. Employee + department names --
SELECT e.name, d.name AS department
FROM Employee e
JOIN Department d
ON e.department_id = d.department_id;

Output:
| name        | department |
| ----------- | ---------- |
| John Doe    | IT         |
| Bob Brown   | IT         |
| Grace Kelly | IT         |
| Jane Smith  | HR         |
| Charlie P.  | HR         |
| Alice Blue  | Finance    |
| Eve Black   | Finance    |
| David Green | Marketing  |
| Hannah Lee  | Marketing  |


-- 37. Project + department names --
SELECT p.name, d.name AS department
FROM Project p
JOIN Department d
ON p.department_id = d.department_id;

Output:
| name            | department |
| --------------- | ---------- |
| Project Alpha   | IT         |
| Project Gamma   | IT         |
| Project Theta   | IT         |
| Project Beta    | HR         |
| Project Delta   | Finance    |
| Project Eta     | Finance    |
| Project Epsilon | Marketing  |
| Project Zeta    | Marketing  |


-- 38. Employee + project names (via department) --
SELECT e.name AS employee, p.name AS project
FROM Employee e
JOIN Project p
ON e.department_id = p.department_id;

Output:

| employee    | project         |
| ----------- | --------------- |
| John Doe    | Project Alpha   |
| Bob Brown   | Project Alpha   |
| Grace Kelly | Project Alpha   |
| Jane Smith  | Project Beta    |
| Charlie P.  | Project Beta    |
| John Doe    | Project Gamma   |
| Bob Brown   | Project Gamma   |
| Grace Kelly | Project Gamma   |
| Alice Blue  | Project Delta   |
| Eve Black   | Project Delta   |
| David Green | Project Epsilon |
| Hannah Lee  | Project Epsilon |
| David Green | Project Zeta    |
| Hannah Lee  | Project Zeta    |
| Alice Blue  | Project Eta     |
| Eve Black   | Project Eta     |
| John Doe    | Project Theta   |
| Bob Brown   | Project Theta   |
| Grace Kelly | Project Theta   |

-- 39. All employees + departments --
SELECT e.name, d.name AS department
FROM Employee e
LEFT JOIN Department d
ON e.department_id = d.department_id;

Output:
| name        | department |
| ----------- | ---------- |
| John Doe    | IT         |
| Bob Brown   | IT         |
| Grace Kelly | IT         |
| Jane Smith  | HR         |
| Charlie P.  | HR         |
| Alice Blue  | Finance    |
| Eve Black   | Finance    |
| David Green | Marketing  |
| Hannah Lee  | Marketing  |
| Frank White |            |


-- 40. All departments + employees --
SELECT d.name AS department, e.name AS employee
FROM Department d
LEFT JOIN Employee e
ON d.department_id = e.department_id;

Output:

| department | employee    |
| ---------- | ----------- |
| IT         | John Doe    |
| IT         | Bob Brown   |
| IT         | Grace Kelly |
| HR         | Jane Smith  |
| HR         | Charlie P.  |
| Finance    | Alice Blue  |
| Finance    | Eve Black   |
| Marketing  | David Green |
| Marketing  | Hannah Lee  |



-- 41. Employees without project --
SELECT e.*
FROM Employee e
WHERE e.department_id NOT IN (
    SELECT DISTINCT department_id FROM Project WHERE department_id IS NOT NULL
) OR e.department_id IS NULL;

Output:
| emp_id | name        | age | salary  | department_id | hire_date  |
| ------ | ----------- | --- | ------- | ------------- | ---------- |
| 8      | Frank White | 32  | 48000.0 |               | 2021-07-10 |


-- 42. Employees + number of projects in dept --
SELECT e.name, COUNT(p.project_id) AS project_count
FROM Employee e
LEFT JOIN Project p
ON e.department_id = p.department_id
GROUP BY e.emp_id, e.name;

Output:
| name        | project_count |
| ----------- | ------------- |
| John Doe    | 3             |
| Jane Smith  | 1             |
| Bob Brown   | 3             |
| Alice Blue  | 2             |
| Charlie P.  | 1             |
| David Green | 2             |
| Eve Black   | 2             |
| Frank White | 0             |
| Grace Kelly | 3             |
| Hannah Lee  | 2             |


-- 43. Departments with no employees --
SELECT d.*
FROM Department d
LEFT JOIN Employee e
ON d.department_id = e.department_id
WHERE e.emp_id IS NULL;

Output:
There are no results to be displayed.


-- 44. Same department as John Doe --
SELECT *
FROM Employee
WHERE department_id IN (
    SELECT department_id FROM Employee WHERE name = 'John Doe'
);

Output:
| emp_id | name        | age | salary  | department_id | hire_date  |
| ------ | ----------- | --- | ------- | ------------- | ---------- |
| 1      | John Doe    | 28  | 50000.0 | 1             | 2020-01-15 |
| 3      | Bob Brown   | 45  | 80000.0 | 1             | 2018-02-12 |
| 9      | Grace Kelly | 27  | 65000.0 | 1             | 2018-11-13 |


-- 45. Department name with highest avg salary --
SELECT d.name
FROM Department d
JOIN Employee e ON d.department_id = e.department_id
GROUP BY d.department_id, d.name
ORDER BY AVG(e.salary) DESC
LIMIT 1;

Output:

| name |
| ---- |
| IT   |

-- 46. Employee with highest salary --
SELECT *
FROM Employee
WHERE salary = (SELECT MAX(salary) FROM Employee);

Output:
| emp_id | name      | age | salary  | department_id | hire_date  |
| ------ | --------- | --- | ------- | ------------- | ---------- |
| 3      | Bob Brown | 45  | 80000.0 | 1             | 2018-02-12 |


-- 47. Salary above average --
SELECT *
FROM Employee
WHERE salary > (SELECT AVG(salary) FROM Employee);

Output:
| emp_id | name      | age | salary  | department_id | hire_date  |
| ------ | --------- | --- | ------- | ------------- | ---------- |
| 3      | Bob Brown | 45  | 80000.0 | 1             | 2018-02-12 |


-- 48. Second highest salary --
SELECT MAX(salary)
FROM Employee
WHERE salary < (SELECT MAX(salary) FROM Employee);

Output:
| MAX(salary) |
| ----------- |
| 70000.0     |


-- 49. Department with most employees --
SELECT department_id
FROM Employee
GROUP BY department_id
ORDER BY COUNT(*) DESC
LIMIT 1;

Output:
| department_id |
| ------------- |
| 1             |


-- 50. Salary > dept avg --
SELECT *
FROM Employee e
WHERE salary > (
    SELECT AVG(salary)
    FROM Employee
    WHERE department_id = e.department_id
);

Output:
| emp_id | name        | age | salary  | department_id | hire_date  |
| ------ | ----------- | --- | ------- | ------------- | ---------- |
| 2      | Jane Smith  | 34  | 60000.0 | 2             | 2019-07-23 |
| 3      | Bob Brown   | 45  | 80000.0 | 1             | 2018-02-12 |
| 6      | David Green | 38  | 70000.0 | 4             | 2022-05-18 |
| 7      | Eve Black   | 40  | 55000.0 | 3             | 2021-08-30 |

-- 51. 3rd highest salary --
SELECT salary
FROM (
    SELECT DISTINCT salary FROM Employee ORDER BY salary DESC
) AS temp
LIMIT 1 OFFSET 2;

Output:
| salary  |
| ------- |
| 65000.0 |


-- 52. Older than all HR employees --
SELECT *
FROM Employee
WHERE age > ALL (
    SELECT age FROM Employee
    WHERE department_id = (
        SELECT department_id FROM Department WHERE name='HR'
    )
    AND age IS NOT NULL
);

Output:
| emp_id | name        | age | salary  | department_id | hire_date  |
| ------ | ----------- | --- | ------- | ------------- | ---------- |
| 3      | Bob Brown   | 45  | 80000.0 | 1             | 2018-02-12 |
| 6      | David Green | 38  | 70000.0 | 4             | 2022-05-18 |
| 7      | Eve Black   | 40  | 55000.0 | 3             | 2021-08-30 |



-- 53. Departments avg salary > 55000 --
SELECT department_id
FROM Employee
GROUP BY department_id
HAVING AVG(salary) > 55000;

-- 54. Employees in dept with >=2 projects --
SELECT *
FROM Employee
WHERE department_id IN (
    SELECT department_id
    FROM Project
    WHERE department_id IS NOT NULL
    GROUP BY department_id
    HAVING COUNT(*) >= 2
);

Output:
| emp_id | name        | age | salary  | department_id | hire_date  |
| ------ | ----------- | --- | ------- | ------------- | ---------- |
| 1      | John Doe    | 28  | 50000.0 | 1             | 2020-01-15 |
| 3      | Bob Brown   | 45  | 80000.0 | 1             | 2018-02-12 |
| 4      | Alice Blue  | 25  | 45000.0 | 3             | 2021-03-22 |
| 6      | David Green | 38  | 70000.0 | 4             | 2022-05-18 |
| 7      | Eve Black   | 40  | 55000.0 | 3             | 2021-08-30 |
| 9      | Grace Kelly | 27  | 65000.0 | 1             | 2018-11-13 |
| 10     | Hannah Lee  | 30  | 53000.0 | 4             | 2020-02-25 |



-- 55. Same hire date as Jane Smith --
SELECT *
FROM Employee
WHERE hire_date = (
    SELECT hire_date FROM Employee WHERE name='Jane Smith'
);

Output:
| emp_id | name       | age | salary  | department_id | hire_date  |
| ------ | ---------- | --- | ------- | ------------- | ---------- |
| 2      | Jane Smith | 34  | 60000.0 | 2             | 2019-07-23 |


-- 56. Total salary hired in 2020 --
SELECT SUM(salary)
FROM Employee
WHERE YEAR(hire_date)=2020;

Output:

| SUM(salary) |
| ----------- |
| 103000.0    |


-- 57. Avg salary per dept DESC --
SELECT department_id, AVG(salary) AS avg_salary
FROM Employee
GROUP BY department_id
ORDER BY avg_salary DESC;

Output:
| department_id | avg_salary |
| ------------- | ---------- |
| 1             | 65000.0    |
| 4             | 61500.0    |
| 2             | 55000.0    |
| 3             | 50000.0    |
|               | 48000.0    |


-- 58. Dept >1 employee & avg >55000 --
SELECT department_id
FROM Employee
GROUP BY department_id
HAVING COUNT(*)>1 AND AVG(salary)>55000;

Output:
| department_id |
| ------------- |
| 1             |
| 4             |


-- 59. Employees hired last 2 years ordered --
SELECT *
FROM Employee
WHERE hire_date >= DATE_SUB(CURDATE(), INTERVAL 2 YEAR)
ORDER BY hire_date;

Output:
There are no results to be displayed.

-- 60. Count & avg salary (dept >2 emp) --
SELECT department_id, COUNT(*) AS total_employees, AVG(salary) AS avg_salary
FROM Employee
GROUP BY department_id
HAVING COUNT(*) > 2;

Output:
| department_id | total_employees | avg_salary |
| ------------- | --------------- | ---------- |
| 1             | 3               | 65000.0    |


-- 61. Name & salary > dept avg --
SELECT name, salary
FROM Employee e
WHERE salary > (
    SELECT AVG(salary)
    FROM Employee
    WHERE department_id = e.department_id
);

Output:
| name        | salary  |
| ----------- | ------- |
| Jane Smith  | 60000.0 |
| Bob Brown   | 80000.0 |
| David Green | 70000.0 |
| Eve Black   | 55000.0 |



-- 62. Same hire date as oldest employee --
SELECT name
FROM Employee
WHERE hire_date = (
    SELECT hire_date
    FROM Employee
    WHERE age = (SELECT MAX(age) FROM Employee)
);

Output:
| name      |
| --------- |
| Bob Brown |


-- 63. Dept + total projects ordered --
SELECT d.name, COUNT(p.project_id) AS total_projects
FROM Department d
LEFT JOIN Project p
ON d.department_id = p.department_id
GROUP BY d.department_id, d.name
ORDER BY total_projects DESC;

Output:
| name      | total_projects |
| --------- | -------------- |
| IT        | 3              |
| Finance   | 2              |
| Marketing | 2              |
| HR        | 1              |


-- 64. Highest salary in each department --
SELECT *
FROM Employee e
WHERE salary = (
    SELECT MAX(salary)
    FROM Employee
    WHERE department_id = e.department_id
)
AND department_id IS NOT NULL;

Output:
| emp_id | name        | age | salary  | department_id | hire_date  |
| ------ | ----------- | --- | ------- | ------------- | ---------- |
| 2      | Jane Smith  | 34  | 60000.0 | 2             | 2019-07-23 |
| 3      | Bob Brown   | 45  | 80000.0 | 1             | 2018-02-12 |
| 6      | David Green | 38  | 70000.0 | 4             | 2022-05-18 |
| 7      | Eve Black   | 40  | 55000.0 | 3             | 2021-08-30 |


-- 65. Older than dept avg age --
SELECT name, salary
FROM Employee e
WHERE age > (
    SELECT AVG(age)
    FROM Employee
    WHERE department_id = e.department_id
);

Output:
| name        | salary  |
| ----------- | ------- |
| Jane Smith  | 60000.0 |
| Bob Brown   | 80000.0 |
| David Green | 70000.0 |
| Eve Black   | 55000.0 |
