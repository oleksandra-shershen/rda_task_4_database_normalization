-- Recreate database
DROP DATABASE IF EXISTS ShopDB;
CREATE DATABASE ShopDB;
USE ShopDB;

CREATE TABLE Countries (
    ID INT NOT NULL AUTO_INCREMENT,
    Name VARCHAR(50) NOT NULL,
    PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Products (
    ID INT NOT NULL AUTO_INCREMENT,
    ProductName VARCHAR(50) NOT NULL,
    PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Warehouses (
    ID INT NOT NULL AUTO_INCREMENT,
    WarehouseName VARCHAR(50) NOT NULL,
    WarehouseAddress VARCHAR(100) NOT NULL,
    CountryID INT NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (CountryID)
        REFERENCES Countries(ID)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Inventory (
    ProductID INT NOT NULL,
    WarehouseID INT NOT NULL,
    WarehouseAmount INT NOT NULL,
    PRIMARY KEY (ProductID, WarehouseID),
    FOREIGN KEY (ProductID)
        REFERENCES Products(ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (WarehouseID)
        REFERENCES Warehouses(ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO Countries (Name) VALUES ('Country1');
INSERT INTO Countries (Name) VALUES ('Country2');

INSERT INTO Products (ProductName) VALUES ('AwesomeProduct');

INSERT INTO Warehouses (WarehouseName, WarehouseAddress, CountryID) VALUES
('Warehouse-1', 'City-1, Street-1', 1),
('Warehouse-2', 'City-2, Street-2', 2);

INSERT INTO Inventory (ProductID, WarehouseID, WarehouseAmount) VALUES
(1, 1, 2),
(1, 2, 5);
