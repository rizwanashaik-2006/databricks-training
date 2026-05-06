-- Day 1 SQL Practice

-- 1. Select all columns from Employee --
SELECT * FROM Employee;

-- 2. Select name and salary --
SELECT name, salary FROM Employee;

-- 3. Employees older than 30 --
SELECT * FROM Employee
WHERE age > 30;

-- 4. Names of all departments --
SELECT name FROM Department;

-- 5. Employees in IT department --
SELECT * FROM Employee
WHERE department_id = (
    SELECT department_id FROM Department WHERE name = 'IT'
);

-- 6. Names start with J --
SELECT * FROM Employee
WHERE name LIKE 'J%';

-- 7. Names end with e --
SELECT * FROM Employee
WHERE name LIKE '%e';

-- 8. Names contain a --
SELECT * FROM Employee
WHERE name LIKE '%a%';

-- 9. Names with 9 characters --
SELECT * FROM Employee
WHERE CHAR_LENGTH(name) = 9;

-- 10. 'o' as second character --
SELECT * FROM Employee
WHERE name LIKE '_o%';

-- 11. Hired in 2020 --
SELECT * FROM Employee
WHERE hire_date BETWEEN '2020-01-01' AND '2020-12-31';

-- 12. Hired in January --
SELECT * FROM Employee
WHERE MONTH(hire_date) = 1;

-- 13. Hired before 2019 --
SELECT * FROM Employee
WHERE hire_date < '2019-01-01';

-- 14. Hired on/after March 1 2021 --
SELECT * FROM Employee
WHERE hire_date >= '2021-03-01';

-- 15. Hired in last 2 years --
SELECT * FROM Employee
WHERE hire_date >= DATE_SUB(CURDATE(), INTERVAL 2 YEAR);

-- 16. Total salary --
SELECT SUM(salary) AS total_salary FROM Employee;

-- 17. Average salary --
SELECT AVG(salary) AS avg_salary FROM Employee;

-- 18. Minimum salary --
SELECT MIN(salary) AS min_salary FROM Employee;

-- 19. Employees count per department --
SELECT department_id, COUNT(*) AS total
FROM Employee
GROUP BY department_id;

-- 20. Avg salary per department --
SELECT department_id, AVG(salary) AS avg_salary
FROM Employee
GROUP BY department_id;

-- 21. Total salary per department --
SELECT department_id, SUM(salary) AS total_salary
FROM Employee
GROUP BY department_id;

-- 22. Avg age per department --
SELECT department_id, AVG(age) AS avg_age
FROM Employee
GROUP BY department_id;

-- 23. Employees hired per year --
SELECT YEAR(hire_date) AS year, COUNT(*) AS total
FROM Employee
GROUP BY YEAR(hire_date);

-- 24. Highest salary per department --
SELECT department_id, MAX(salary) AS max_salary
FROM Employee
GROUP BY department_id;

-- 25. Department with highest avg salary --
SELECT department_id
FROM Employee
GROUP BY department_id
ORDER BY AVG(salary) DESC
LIMIT 1;

-- 26. Departments with >2 employees --
SELECT department_id
FROM Employee
GROUP BY department_id
HAVING COUNT(*) > 2;

-- 27. Departments avg salary > 55000 --
SELECT department_id
FROM Employee
GROUP BY department_id
HAVING AVG(salary) > 55000;

-- 28. Years with >1 employee hired --
SELECT YEAR(hire_date)
FROM Employee
GROUP BY YEAR(hire_date)
HAVING COUNT(*) > 1;

-- 29. Departments total salary < 100000 --
SELECT department_id
FROM Employee
GROUP BY department_id
HAVING SUM(salary) < 100000;

-- 30. Departments max salary > 75000 --
SELECT department_id
FROM Employee
GROUP BY department_id
HAVING MAX(salary) > 75000;

-- 31. Employees by salary ASC --
SELECT * FROM Employee
ORDER BY salary ASC;

-- 32. Employees by age DESC --
SELECT * FROM Employee
ORDER BY age DESC;

-- 33. Employees by hire date ASC --
SELECT * FROM Employee
ORDER BY hire_date ASC;

-- 34. Order by department then salary --
SELECT * FROM Employee
ORDER BY department_id, salary;

-- 35. Departments by total salary --
SELECT department_id, SUM(salary) AS total_salary
FROM Employee
GROUP BY department_id
ORDER BY total_salary;

-- 36. Employee + department names --
SELECT e.name, d.name AS department
FROM Employee e
JOIN Department d
ON e.department_id = d.department_id;

-- 37. Project + department names --
SELECT p.name, d.name AS department
FROM Project p
JOIN Department d
ON p.department_id = d.department_id;

-- 38. Employee + project names (via department) --
SELECT e.name AS employee, p.name AS project
FROM Employee e
JOIN Project p
ON e.department_id = p.department_id;

-- 39. All employees + departments --
SELECT e.name, d.name AS department
FROM Employee e
LEFT JOIN Department d
ON e.department_id = d.department_id;

-- 40. All departments + employees --
SELECT d.name AS department, e.name AS employee
FROM Department d
LEFT JOIN Employee e
ON d.department_id = e.department_id;

-- 41. Employees without project --
SELECT e.*
FROM Employee e
WHERE e.department_id NOT IN (
    SELECT DISTINCT department_id FROM Project WHERE department_id IS NOT NULL
) OR e.department_id IS NULL;

-- 42. Employees + number of projects in dept --
SELECT e.name, COUNT(p.project_id) AS project_count
FROM Employee e
LEFT JOIN Project p
ON e.department_id = p.department_id
GROUP BY e.emp_id, e.name;

-- 43. Departments with no employees --
SELECT d.*
FROM Department d
LEFT JOIN Employee e
ON d.department_id = e.department_id
WHERE e.emp_id IS NULL;

-- 44. Same department as John Doe --
SELECT *
FROM Employee
WHERE department_id IN (
    SELECT department_id FROM Employee WHERE name = 'John Doe'
);

-- 45. Department name with highest avg salary --
SELECT d.name
FROM Department d
JOIN Employee e ON d.department_id = e.department_id
GROUP BY d.department_id, d.name
ORDER BY AVG(e.salary) DESC
LIMIT 1;

-- 46. Employee with highest salary --
SELECT *
FROM Employee
WHERE salary = (SELECT MAX(salary) FROM Employee);

-- 47. Salary above average --
SELECT *
FROM Employee
WHERE salary > (SELECT AVG(salary) FROM Employee);

-- 48. Second highest salary --
SELECT MAX(salary)
FROM Employee
WHERE salary < (SELECT MAX(salary) FROM Employee);

-- 49. Department with most employees --
SELECT department_id
FROM Employee
GROUP BY department_id
ORDER BY COUNT(*) DESC
LIMIT 1;

-- 50. Salary > dept avg --
SELECT *
FROM Employee e
WHERE salary > (
    SELECT AVG(salary)
    FROM Employee
    WHERE department_id = e.department_id
);

-- 51. 3rd highest salary --
SELECT salary
FROM (
    SELECT DISTINCT salary FROM Employee ORDER BY salary DESC
) AS temp
LIMIT 1 OFFSET 2;

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

-- 55. Same hire date as Jane Smith --
SELECT *
FROM Employee
WHERE hire_date = (
    SELECT hire_date FROM Employee WHERE name='Jane Smith'
);

-- 56. Total salary hired in 2020 --
SELECT SUM(salary)
FROM Employee
WHERE YEAR(hire_date)=2020;

-- 57. Avg salary per dept DESC --
SELECT department_id, AVG(salary) AS avg_salary
FROM Employee
GROUP BY department_id
ORDER BY avg_salary DESC;

-- 58. Dept >1 employee & avg >55000 --
SELECT department_id
FROM Employee
GROUP BY department_id
HAVING COUNT(*)>1 AND AVG(salary)>55000;

-- 59. Employees hired last 2 years ordered --
SELECT *
FROM Employee
WHERE hire_date >= DATE_SUB(CURDATE(), INTERVAL 2 YEAR)
ORDER BY hire_date;

-- 60. Count & avg salary (dept >2 emp) --
SELECT department_id, COUNT(*) AS total_employees, AVG(salary) AS avg_salary
FROM Employee
GROUP BY department_id
HAVING COUNT(*) > 2;

-- 61. Name & salary > dept avg --
SELECT name, salary
FROM Employee e
WHERE salary > (
    SELECT AVG(salary)
    FROM Employee
    WHERE department_id = e.department_id
);

-- 62. Same hire date as oldest employee --
SELECT name
FROM Employee
WHERE hire_date = (
    SELECT hire_date
    FROM Employee
    WHERE age = (SELECT MAX(age) FROM Employee)
);

-- 63. Dept + total projects ordered --
SELECT d.name, COUNT(p.project_id) AS total_projects
FROM Department d
LEFT JOIN Project p
ON d.department_id = p.department_id
GROUP BY d.department_id, d.name
ORDER BY total_projects DESC;

-- 64. Highest salary in each department --
SELECT *
FROM Employee e
WHERE salary = (
    SELECT MAX(salary)
    FROM Employee
    WHERE department_id = e.department_id
)
AND department_id IS NOT NULL;

-- 65. Older than dept avg age --
SELECT name, salary
FROM Employee e
WHERE age > (
    SELECT AVG(age)
    FROM Employee
    WHERE department_id = e.department_id
);
