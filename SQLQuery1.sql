CREATE DATABASE store7;
GO

USE store7;
GO

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY IDENTITY(1,1),
    CategoryName NVARCHAR(50) NOT NULL
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName NVARCHAR(50) NOT NULL,
    CategoryID INT NOT NULL,
    Price DECIMAL(10, 2),
    CONSTRAINT FK_Category_Product FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    ProductID INT,
    Quantity INT,
    TotalPrice DECIMAL(10, 2),
    OrderDate DATE,
    CONSTRAINT FK_Product_Order FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Categories (CategoryName)
VALUES
('Бытовая техника'),
('Телефоны'),
('Ноутбуки'),
('Роутеры'),
('Телевизоры');

INSERT INTO Products (ProductName, CategoryID, Price)
VALUES
('Холодильник Haier C2F636CXMV', 1, 45000.00),
('iPhone 15 Pro', 2, 138000.00),
('Huawei MateBook D16', 3, 110000.00),
('TP-LINK Deco X50-PoE', 4, 8000.00),
('HUAWEI Vision S 65', 5, 67000.00);

INSERT INTO Orders (ProductID, Quantity, TotalPrice, OrderDate)
VALUES
(1, 2, 45000.00, '2024-03-15'),
(2, 1, 138000.00, '2024-03-15'),
(3, 3, 110000.00, '2024-03-16'),
(1, 1, 45000.00, '2024-03-16'),
(2, 2, 67000.00, '2024-03-17');