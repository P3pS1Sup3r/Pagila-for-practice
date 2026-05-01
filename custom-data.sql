-- CEO (корень иерархии)
INSERT INTO recursive.employee (employee_id, first_name, last_name, position, hire_date, salary, department, manager_id)
VALUES (1, 'John', 'Smith', 'CEO', '2010-01-15', 150000.00, 'Executive', NULL);

-- Топ-менеджеры (уровень 1)
INSERT INTO recursive.employee (employee_id, first_name, last_name, position, hire_date, salary, department, manager_id)
VALUES 
(2, 'Mary', 'Johnson', 'CTO', '2012-03-20', 125000.00, 'Technology', 1),
(3, 'Robert', 'Williams', 'CFO', '2011-05-18', 125000.00, 'Finance', 1),
(4, 'Lisa', 'Brown', 'COO', '2013-08-10', 125000.00, 'Operations', 1);

-- Менеджеры (уровень 2)
INSERT INTO recursive.employee (employee_id, first_name, last_name, position, hire_date, salary, department, manager_id)
VALUES 
(5, 'Michael', 'Davis', 'Development Manager', '2014-02-05', 95000.00, 'Technology', 2),
(6, 'Sarah', 'Miller', 'QA Manager', '2015-01-22', 90000.00, 'Technology', 2),
(7, 'James', 'Wilson', 'Accounting Manager', '2013-11-14', 92000.00, 'Finance', 3),
(8, 'Jennifer', 'Jones', 'Production Manager', '2014-06-28', 93000.00, 'Operations', 4);

-- Сотрудники (уровень 3)
INSERT INTO recursive.employee (employee_id, first_name, last_name, position, hire_date, salary, department, manager_id)
VALUES 
(9, 'David', 'Taylor', 'Senior Developer', '2016-04-12', 80000.00, 'Technology', 5),
(10, 'Emily', 'Anderson', 'Developer', '2017-08-24', 70000.00, 'Technology', 5),
(11, 'Andrew', 'Thomas', 'QA Lead', '2016-09-05', 75000.00, 'Technology', 6),
(12, 'Jessica', 'White', 'Accountant', '2015-12-18', 72000.00, 'Finance', 7),
(13, 'Kevin', 'Martinez', 'Production Lead', '2016-02-10', 74000.00, 'Operations', 8);

-- Сотрудники (уровень 4)
INSERT INTO recursive.employee (employee_id, first_name, last_name, position, hire_date, salary, department, manager_id)
VALUES 
(14, 'Daniel', 'Garcia', 'Junior Developer', '2018-07-15', 60000.00, 'Technology', 9),
(15, 'Rachel', 'Lee', 'QA Engineer', '2018-03-03', 65000.00, 'Technology', 11);