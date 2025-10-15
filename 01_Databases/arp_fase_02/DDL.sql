CREATE TABLE "Employees" (
	"EmployeeID" "int" IDENTITY (1, 1) NOT NULL ,
	"LastName" nvarchar (20) NOT NULL ,
	"FirstName" nvarchar (10) NOT NULL ,
	"Title" nvarchar (30) NULL ,
	"TitleOfCourtesy" nvarchar (25) NULL ,
	"BirthDate" "datetime" NULL ,
	"HireDate" "datetime" NULL ,
	"Address" nvarchar (60) NULL ,
	"City" nvarchar (15) NULL ,
	"Region" nvarchar (15) NULL ,
	"PostalCode" nvarchar (10) NULL ,
	"Country" nvarchar (15) NULL ,
	"HomePhone" nvarchar (24) NULL ,
	"Extension" nvarchar (4) NULL ,
	"Photo" "image" NULL ,
	"Notes" "ntext" NULL ,
	"ReportsTo" "int" NULL ,
	"PhotoPath" nvarchar (255) NULL ,
	PRIMARY KEY("EmployeeID")
)


CREATE TABLE "Categories" (
	"CategoryID" "int" IDENTITY (1, 1) NOT NULL ,
	"CategoryName" nvarchar (15) NOT NULL ,
	"Description" "ntext" NULL ,
	"Picture" "image" NULL ,
	PRIMARY KEY("CategoryID")
)


CREATE TABLE "Customers" (
	"CustomerID" nchar (5) NOT NULL ,
	"CompanyName" nvarchar (40) NOT NULL ,
	"ContactName" nvarchar (30) NULL ,
	"ContactTitle" nvarchar (30) NULL ,
	"Address" nvarchar (60) NULL ,
	"City" nvarchar (15) NULL ,
	"Region" nvarchar (15) NULL ,
	"PostalCode" nvarchar (10) NULL ,
	"Country" nvarchar (15) NULL ,
	"Phone" nvarchar (24) NULL ,
	"Fax" nvarchar (24) NULL ,
	PRIMARY KEY("CustomerID")
)


CREATE TABLE "Shippers" (
	"ShipperID" "int" IDENTITY (1, 1) NOT NULL ,
	"CompanyName" nvarchar (40) NOT NULL ,
	"Phone" nvarchar (24) NULL ,
	PRIMARY KEY("ShipperID")
)

CREATE TABLE "Suppliers" (
	"SupplierID" "int" IDENTITY (1, 1) NOT NULL ,
	"CompanyName" nvarchar (140) NOT NULL ,
	"ContactName" nvarchar (130) NULL ,
	"ContactTitle" nvarchar (130) NULL ,
	"Address" nvarchar (160) NULL ,
	"City" nvarchar (150) NULL ,
	"Region" nvarchar (150) NULL ,
	"PostalCode" nvarchar (100) NULL ,
	"Country" nvarchar (150) NULL ,
	"Phone" nvarchar (24) NULL ,
	"Fax" nvarchar (24) NULL ,
	"HomePage" "ntext" NULL ,
	PRIMARY KEY("SupplierID")
)

CREATE TABLE "Orders" (
	"OrderID" "int" IDENTITY (1, 1) NOT NULL ,
	"CustomerID" nchar (5) NULL ,
	"EmployeeID" "int" NULL ,
	"OrderDate" "datetime" NULL ,
	"RequiredDate" "datetime" NULL ,
	"ShippedDate" "datetime" NULL ,
	"ShipVia" "int" NULL ,
	"Freight" "money" NULL CONSTRAINT "DF_Orders_Freight" DEFAULT (0),
	"ShipName" nvarchar (100) NULL ,
	"ShipAddress" nvarchar (160) NULL ,
	"ShipCity" nvarchar (150) NULL ,
	"ShipRegion" nvarchar (150) NULL ,
	"ShipPostalCode" nvarchar (100) NULL ,
	"ShipCountry" nvarchar (150) NULL ,
	PRIMARY KEY("OrderID"),
	FOREIGN KEY ("CustomerID") REFERENCES "dbo"."Customers" ("CustomerID"),
	FOREIGN KEY ("EmployeeID") REFERENCES "dbo"."Employees" ("EmployeeID"),
	FOREIGN KEY ("ShipVia") REFERENCES "dbo"."Shippers" ("ShipperID")
)


CREATE TABLE "Products" (
	"ProductID" "int" IDENTITY (1, 1) NOT NULL ,
	"ProductName" nvarchar (255) NOT NULL ,
	"SupplierID" "int" NULL ,
	"CategoryID" "int" NULL ,
	"QuantityPerUnit" nvarchar (50) NULL ,
	"UnitPrice" "money" NULL CONSTRAINT "DF_Products_UnitPrice" DEFAULT (0),
	"UnitsInStock" "smallint" NULL CONSTRAINT "DF_Products_UnitsInStock" DEFAULT (0),
	"UnitsOnOrder" "smallint" NULL CONSTRAINT "DF_Products_UnitsOnOrder" DEFAULT (0),
	"ReorderLevel" "smallint" NULL CONSTRAINT "DF_Products_ReorderLevel" DEFAULT (0),
	"Discontinued" "bit" NOT NULL CONSTRAINT "DF_Products_Discontinued" DEFAULT (0),
	PRIMARY KEY  ("ProductID"),
	FOREIGN KEY ("CategoryID") REFERENCES "dbo"."Categories" ("CategoryID"),
	FOREIGN KEY ("SupplierID") REFERENCES "dbo"."Suppliers" ("SupplierID")
)


CREATE TABLE "OrderDetails" (
	"OrderDetailsID" "int" IDENTITY (1, 1) NOT NULL ,
	"OrderID" "int" NOT NULL ,
	"ProductID" "int" NOT NULL ,
	"UnitPrice" "money" NOT NULL CONSTRAINT "DF_Order_Details_UnitPrice" DEFAULT (0),
	"Quantity" "smallint" NOT NULL CONSTRAINT "DF_Order_Details_Quantity" DEFAULT (1),
	"Discount" "real" NOT NULL CONSTRAINT "DF_Order_Details_Discount" DEFAULT (0),
	PRIMARY KEY("OrderDetailsID"),
	FOREIGN KEY ("OrderID") REFERENCES "dbo"."Orders" ("OrderID"),
	FOREIGN KEY ("ProductID") REFERENCES "dbo"."Products" ("ProductID")
)