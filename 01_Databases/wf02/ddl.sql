-- Create the database
CREATE DATABASE WF02;
GO

-- Use the database
USE WF02;
GO

-- 1. Create the Regions table
CREATE TABLE Regions (
    RegionID INT PRIMARY KEY IDENTITY(1,1),
    RegionName VARCHAR(100) UNIQUE NOT NULL
);
GO

-- 2. Create the Managers table
CREATE TABLE Managers (
    ManagerID INT PRIMARY KEY IDENTITY(1,1),
    ManagerName VARCHAR(100) NOT NULL
);
GO

-- 3. Create the Stores table with foreign keys
CREATE TABLE Stores (
    StoreID INT PRIMARY KEY,
    StoreName VARCHAR(100),
    RegionID INT,
    ManagerID INT,
    QuantitySold FLOAT,
    Address VARCHAR(200),
    OpeningDate DATE,
    FOREIGN KEY (RegionID) REFERENCES Regions(RegionID),
    FOREIGN KEY (ManagerID) REFERENCES Managers(ManagerID)
);
GO