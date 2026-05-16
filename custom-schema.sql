CREATE SCHEMA recursive;

CREATE TABLE recursive.employee (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    position VARCHAR(100) NOT NULL,
    hire_date DATE NOT NULL,
    salary NUMERIC(10, 2) NOT NULL,
    department VARCHAR(50) NOT NULL,
    manager_id INTEGER,
    CONSTRAINT fk_manager FOREIGN KEY (manager_id) REFERENCES recursive.employee(employee_id)
);

-- Иерархия пунктов меню: категории и блюда (самоссылка parent_id).
CREATE TABLE recursive.menu_item (
    menu_item_id SERIAL PRIMARY KEY,
    name VARCHAR(120) NOT NULL,
    kind VARCHAR(20) NOT NULL CHECK (kind IN ('category', 'dish')),
    parent_id INTEGER,
    price NUMERIC(10, 2),
    sort_order SMALLINT NOT NULL DEFAULT 0,
    CONSTRAINT fk_menu_parent FOREIGN KEY (parent_id) REFERENCES recursive.menu_item(menu_item_id),
    CONSTRAINT chk_dish_price CHECK (
        (kind = 'dish' AND price IS NOT NULL)
        OR (kind = 'category' AND price IS NULL)
    )
);