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

SELECT setval(
    pg_get_serial_sequence('recursive.employee', 'employee_id'),
    (SELECT COALESCE(MAX(employee_id), 1) FROM recursive.employee)
);

-- Меню: корень и вложенные категории + блюда (листья с ценой)
INSERT INTO recursive.menu_item (menu_item_id, name, kind, parent_id, price, sort_order)
VALUES (1, 'Меню', 'category', NULL, NULL, 0);

INSERT INTO recursive.menu_item (menu_item_id, name, kind, parent_id, price, sort_order)
VALUES
(2, 'Завтраки', 'category', 1, NULL, 1),
(3, 'Обед', 'category', 1, NULL, 2),
(4, 'Напитки', 'category', 1, NULL, 3);

INSERT INTO recursive.menu_item (menu_item_id, name, kind, parent_id, price, sort_order)
VALUES
(10, 'Сытный завтрак', 'category', 2, NULL, 1),
(11, 'Лёгкий завтрак', 'category', 2, NULL, 2);

INSERT INTO recursive.menu_item (menu_item_id, name, kind, parent_id, price, sort_order)
VALUES
(20, 'Омлет с ветчиной', 'dish', 10, 350.00, 1),
(21, 'Блины с творогом', 'dish', 10, 320.00, 2),
(22, 'Йогурт с гранолой', 'dish', 11, 280.00, 1),
(23, 'Каша овсяная', 'dish', 11, 190.00, 2);

INSERT INTO recursive.menu_item (menu_item_id, name, kind, parent_id, price, sort_order)
VALUES
(30, 'Первые блюда', 'category', 3, NULL, 1),
(31, 'Вторые блюда', 'category', 3, NULL, 2);

INSERT INTO recursive.menu_item (menu_item_id, name, kind, parent_id, price, sort_order)
VALUES
(40, 'Борщ', 'dish', 30, 290.00, 1),
(41, 'Солянка', 'dish', 30, 310.00, 2),
(42, 'Котлета по-киевски', 'dish', 31, 420.00, 1),
(43, 'Паста карбонара', 'dish', 31, 380.00, 2);

INSERT INTO recursive.menu_item (menu_item_id, name, kind, parent_id, price, sort_order)
VALUES
(50, 'Горячие напитки', 'category', 4, NULL, 1),
(51, 'Холодные напитки', 'category', 4, NULL, 2);

INSERT INTO recursive.menu_item (menu_item_id, name, kind, parent_id, price, sort_order)
VALUES
(60, 'Эспрессо', 'dish', 50, 120.00, 1),
(61, 'Капучино', 'dish', 50, 180.00, 2),
(62, 'Лимонад домашний', 'dish', 51, 150.00, 1);

SELECT setval(
    pg_get_serial_sequence('recursive.menu_item', 'menu_item_id'),
    (SELECT COALESCE(MAX(menu_item_id), 1) FROM recursive.menu_item)
);