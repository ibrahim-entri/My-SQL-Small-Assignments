CREATE DATABASE IF NOT EXISTS employee;
USE employee;

CREATE TABLE IF NOT EXISTS departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) UNIQUE NOT NULL
);
INSERT INTO departments (department_id, department_name) VALUES
(1, 'Software Development'),
(2, 'Marketing'),
(3, 'Data Science'),
(4, 'Human Resources'),
(5, 'Product Management'),
(6, 'Content Creation'),
(7, 'Finance'),
(8, 'Design'),
(9, 'Research and Development'),
(10, 'Customer Support'),
(11, 'Business Development'),
(12, 'IT'),
(13, 'Operations');

CREATE TABLE IF NOT EXISTS location (
    location_id INT AUTO_INCREMENT PRIMARY KEY,
    location VARCHAR(100) UNIQUE NOT NULL
);
INSERT INTO location (location) VALUES
('Chennai'),
('Bangalore'),
('Hyderabad'),
('Pune');


CREATE TABLE IF NOT EXISTS employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    gender CHAR(1),
    age INT,
    hire_date DATE,
    designation VARCHAR(100),
    department_id INT,
    location_id INT,
    salary INT,
    
    FOREIGN KEY (department_id) REFERENCES departments(department_id),
    FOREIGN KEY (location_id) REFERENCES location(location_id)
);
INSERT INTO employees (employee_id, employee_name, gender, age, hire_date, designation, department_id, location_id, salary) VALUES
(5001, 'Vihaan Singh', 'M', 27, '2015-01-20', 'Data Analyst', 3, 4, 60000),
(5002, 'Reyansh Singh', 'M', 31, '2015-03-10', 'Network Engineer', 12, 1, 80000),
(5003, 'Aaradhya Iyer', 'F', 26, '2015-05-20', 'Customer Support Executive', 10, 2, 45000),
(5004, 'Kiara Malhotra', 'F', 29, '2015-07-05', NULL, 8, 3, 70000),
(5005, 'Anvi Chaudhary', 'F', 25, '2015-09-11', 'Business Development Executive', 11, 1, 55000),
(5006, 'Dhruv Shetty', 'M', 28, '2015-11-20', 'UI Developer', 8, 2, 65000),
(5007, 'Anushka Singh', 'F', 32, '2016-01-15', 'Marketing Manager', 2, 3, 90000),
(5008, 'Diya Jha', 'F', 27, '2016-03-05', 'Graphic Designer', 8, 4, 70000),
(5009, 'Kiaan Desai', 'M', 30, '2016-05-20', 'Sales Executive', 11, 3, 55000),
(5010, 'Atharv Yadav', 'M', 29, '2016-07-10', 'Systems Administrator', 12, 4, 80000),
(5011, 'Saanvi Patel', 'F', 28, '2016-09-20', 'Marketing Analyst', 2, 1, 60000),
(5012, 'Myra Verma', 'F', 26, '2016-11-05', 'Operations Manager', 13, 2, 95000),
(5013, 'Arnav Rao', 'M', 33, '2017-01-20', 'Customer Success Manager', 10, 3, 75000),
(5014, 'Vihaan Mohan', 'M', 30, '2017-03-10', 'Supply Chain Analyst', 10, 2, 60000),
(5015, 'Ishaan Kumar', 'M', 27, '2017-05-20', 'Financial Analyst', 7, 1, 85000),
(5016, 'Zoya Khan', 'F', 31, '2017-07-05', 'Legal Counsel', 4, 4, 100000),
(5017, 'Kabir Nair', 'M', 28, '2017-09-11', 'IT Support Specialist', 12, 2, 80000),
(5018, 'Ishan Mishra', 'M', 25, '2017-11-20', 'Research Scientist', 9, 3, 75000),
(5019, 'Ishika Patel', 'F', 29, '2018-01-15', 'Talent Acquisition Specialist', 4, 4, 55000),
(5020, 'Aarav Nair', 'M', 32, '2018-03-05', 'Software Engineer', 1, 1, 90000),
(5021, 'Advik Kapoor', 'M', 26, '2018-05-20', 'Finance Analyst', 7, 3, 85000),
(5022, 'Aadhya Iyengar', 'F', 28, '2018-07-10', 'HR Specialist', 4, 4, 60000),
(5023, 'Anika Paul', 'F', 30, '2018-09-20', 'Public Relations Specialist', 2, 2, 70000),
(5024, 'Aryan Shetty', 'M', 27, '2018-11-05', 'Product Manager', 5, 1, 95000),
(5025, 'Avni Iyengar', 'F', 31, '2019-01-20', 'Data Scientist', 3, 4, 100000),
(5026, 'Vivaan Singh', 'M', 29, '2019-03-10', 'Business Analyst', 3, 2, 75000),
(5027, 'Ananya Paul', 'F', 32, '2019-05-20', 'Content Writer', 6, 3, 60000),
(5028, 'Anaya Kapoor', 'F', 26, '2019-07-05', 'Event Coordinator', 6, 1, 60000),
(5029, 'Arjun Kumar', 'M', 33, '2019-09-11', 'Quality Assurance Analyst', 12, 2, 80000),
(5030, 'Sara Iyer', 'F', 28, '2019-11-20', 'Project Manager', 5, 1, 90000);

select * from departments;
select * from location;
select * from employees;

-- Distinct Values a query to retrieve distinct salaries from the Employees table

SELECT DISTINCT salary FROM employees;

-- Alias (AS) Provide aliases for the "age" and "salary" columns as "Employee_Age" and "Employee_Salary", respectively

	select age as employee_age,
               salary as employee_salary
	from employees;
    
    -- Where Clause & Operators 
    -- Retrieve employees with a salary greater than ₹50000 and hired before 2016-01-01.
    -- Find the employee whose designation is missing and fill it with "Data Scientist".
    
    select * from employees
    where salary > 50000
    and hire_date < '2016-01-01';
    
    set sql_safe_updates = 0;
   UPDATE employees
   SET designation = 'Data Scientist'
   WHERE designation IS NULL AND employee_id IS NOT NULL;
   
   -- Sorting and Grouping Data
   -- ORDER BY:
   --  Find employees sorted by department ID in ascending order and salary in descending order.
   
   select * from employees
   order by department_id asc, salary desc;
   
   -- limit
   -- Display the first 5 employees hired in the year 2018
   
   select * from employees
   where year(hire_date) = 2018
   limit 5;
   
   -- Aggregate Functions
   -- Calculate the sum of all salaries in the Finance department.
   -- Find the minimum age among all employees
    
    select sum(e.salary) as total_salary
    from employees e
    join departments d
    on e.department_id = d.department_id
    where d.department_name = 'finance';
    
    SELECT MIN(age) FROM employees;
    
    -- GROUP BY:
    -- List the maximum salary for each location.
    -- Calculate the average salary for each designation containing the word 'Analyst'.
    
    select location_id, max(salary) as max_salary
    from employees 
    group by location_id;
    
    select designation, avg(salary) as avg_salary
    from employees
    where designation like '%analyst'
    group by designation;
    
    
    -- HAVING
    -- Find departments with less than 3 employees
    -- Find locations with female employees whose average age is below 30
    
    SELECT department_id, COUNT(*) AS total_emp
    FROM employees
    GROUP BY department_id
    HAVING COUNT(*) < 3;
    
    select location_id, avg(age) as avg_age
    from employees
    where gender = 'F'
    group by location_id
    having avg(age) < 30;
    
    -- Joins:
	-- Inner Join:
    -- List employee names, their designations, and department names where employees are assigned to a department.
    
   SELECT e.employee_name, e.designation, d.department_name
   FROM employees e
   INNER JOIN departments d
   ON e.department_id = d.department_id;
   
   -- Left Join:
   -- List all departments along with the total number of employees in each department, including departments with no employees.
    
    SELECT d.department_name, COUNT(e.employee_id) AS total_emp
    FROM departments d
    LEFT JOIN employees e
    ON d.department_id = e.department_id
    GROUP BY d.department_name;
    
    -- Right Join:
    -- Display all locations along with the names of employees assigned to each location. 
    -- If no employees are assigned to a location, display NULL for employee name.
    
    SELECT l.location, e.employee_name
    FROM location l
    RIGHT JOIN employees e
    ON l.location_id = e.location_id;