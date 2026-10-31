USE Customer;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    Address VARCHAR(200),
    City VARCHAR(50),
    RegistrationDate DATE
);


DELIMITER $$
CREATE PROCEDURE AddCustomer(
    IN p_FirstName VARCHAR(50),
    IN p_LastName VARCHAR(50),
    IN p_Email VARCHAR(100),
    IN p_Phone VARCHAR(15),
    IN p_Address VARCHAR(200),
    IN p_City VARCHAR(50),
    IN p_RegistrationDate DATE
)
BEGIN
    INSERT INTO Customers
    (FirstName, LastName, Email, Phone, Address, City, RegistrationDate)
    VALUES
    (p_FirstName, p_LastName, p_Email, p_Phone, p_Address, p_City, p_RegistrationDate);
END $$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE GetCustomerByID(
    IN p_CustomerID INT
)
BEGIN
    SELECT * FROM Customers
    WHERE CustomerID = p_CustomerID;
END $$

DELIMITER ;

DELIMITER $$
CREATE PROCEDURE UpdateCustomerContact(
    IN p_CustomerID INT,
    IN p_Email VARCHAR(100),
    IN p_Phone VARCHAR(15)
)
BEGIN
    UPDATE Customers
    SET Email = p_Email,
        Phone = p_Phone
    WHERE CustomerID = p_CustomerID;
END $$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE GetCustomersByCity(
    IN p_City VARCHAR(50)
)
BEGIN
    SELECT * FROM Customers
    WHERE City = p_City;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE DeleteCustomer(
    IN p_CustomerID INT
)
BEGIN
    DELETE FROM Customers
    WHERE CustomerID = p_CustomerID;
END $$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE GetCustomersByDateRange(
    IN p_StartDate DATE,
    IN p_EndDate DATE
)
BEGIN
    SELECT * FROM Customers
    WHERE RegistrationDate BETWEEN p_StartDate AND p_EndDate;
END $$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE SearchCustomer(
    IN p_Name VARCHAR(50)
)
BEGIN
    SELECT * FROM Customers
    WHERE FirstName LIKE CONCAT('%', p_Name, '%')
       OR LastName LIKE CONCAT('%', p_Name, '%');
END $$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE UpdateCustomerAddress(
    IN p_CustomerID INT,
    IN p_Address VARCHAR(200),
    IN p_City VARCHAR(50)
)
BEGIN
    UPDATE Customers
    SET Address = p_Address,
        City = p_City
    WHERE CustomerID = p_CustomerID;
END $$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE GetTotalCustomers()
BEGIN
    SELECT COUNT(*) AS TotalCustomers
    FROM Customers;
END $$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE GetCustomersWithoutEmail()
BEGIN
    SELECT * FROM Customers
    WHERE Email IS NULL OR Email = '';
END$$
DELIMITER ;