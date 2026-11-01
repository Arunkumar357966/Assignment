CREATE DATABASE Inventory;
USE Inventory;

CREATE TABLE Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    price DECIMAL(10,2),
    stock_quantity INT,
    status VARCHAR(20) DEFAULT 'Available'
);

CREATE TABLE Inventory_Audit (
    audit_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    action_type VARCHAR(50),
    old_value VARCHAR(100),
    new_value VARCHAR(100),
    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER $$
CREATE TRIGGER prevent_negative_stock
BEFORE UPDATE ON Products
FOR EACH ROW
BEGIN
    IF NEW.stock_quantity < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Stock cannot be negative';
    END IF;
END $$
DELIMITER ;

UPDATE Products SET stock_quantity = -5 
WHERE product_id = 1;

DELIMITER $$
CREATE TRIGGER audit_price_changes
AFTER UPDATE ON Products
FOR EACH ROW
BEGIN
    IF OLD.price <> NEW.price THEN
        INSERT INTO Inventory_Audit
        (product_id, action_type, old_value, new_value)
        VALUES
        (NEW.product_id, 'Price Updated',
         OLD.price, NEW.price);
    END IF;
END $$
DELIMITER ;

UPDATE Products SET price = 1500
WHERE product_id = 1;

SELECT * FROM Inventory_Audit;

DELIMITER $$
CREATE TRIGGER update_stock_status
BEFORE UPDATE ON Products
FOR EACH ROW
BEGIN
    IF NEW.stock_quantity = 0 THEN
        SET NEW.status = 'Out of Stock';
    END IF;
END $$
DELIMITER ;

UPDATE Products SET stock_quantity = 0
WHERE product_id = 1;

SELECT * FROM Products;

DELIMITER $$
CREATE TRIGGER uppercase_product_name
BEFORE INSERT ON Products
FOR EACH ROW
BEGIN
    SET NEW.name = UPPER(NEW.name);
END $$
DELIMITER ;

INSERT INTO Products (name, price, stock_quantity)
VALUES ('laptop', 50000, 10);

SELECT * FROM Products;

DELIMITER $$
CREATE TRIGGER log_new_product
AFTER INSERT ON Products
FOR EACH ROW
BEGIN
    INSERT INTO Inventory_Audit
    (product_id, action_type, old_value, new_value)
    VALUES
    (NEW.product_id, 'New Product Added',
     NULL, NEW.name);
END $$
DELIMITER ;

INSERT INTO Products (name, price, stock_quantity)
VALUES ('Mobile', 20000, 15);

SELECT * FROM Inventory_Audit;

SHOW TRIGGERS;