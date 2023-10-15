CREATE DATABASE  [TestDB]
USE [TestDB]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Customers](
	[CustomerID] [nchar](5) NOT NULL,
	[FirstName] [varchar](40) NOT NULL,
	[LastName] [varchar](30) NOT NULL,
	[City] [varchar](15) NOT NULL
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] NOT NULL,
	[ProductDesc] [varchar](40) NOT NULL,
	[InsertDate] [datetime] NOT NULL,
	[Price] [decimal](18, 0) NOT NULL
) ON [PRIMARY]
GO
insert into [dbo].[Products] values(1, 'bag', 01-01-2023 ,30)
insert into [dbo].[Products] values(2, 'purse', 02-02-2023 ,20)

CREATE TABLE [dbo].[Orders](
	[OrderID] [int] NOT NULL,
	[CustomerID] [nchar](5) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[PriceSum] [decimal](18, 0) NOT NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Order Details](
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [smallint] NOT NULL
) ON [PRIMARY]
GO

insert into [dbo].[Order Details] values(1, 2, 4)
insert into [dbo].[Order Details] values(2, 2, 2)

ALTER TABLE [dbo].[Customers] ADD CONSTRAINT PK_Customers PRIMARY KEY ([CustomerID])
ALTER TABLE [dbo].[Products] ADD CONSTRAINT PK_Products PRIMARY KEY ([ProductID])
ALTER TABLE [dbo].[Orders] ADD CONSTRAINT PK_Orders PRIMARY KEY ([OrderID])
ALTER TABLE [dbo].[Order Details] ADD CONSTRAINT PK_OrderDetails PRIMARY KEY ([OrderID], [ProductID])


-- כל פריט בנפרד
SELECT P.ProductID, P.ProductDesc, SUM(ISNULL(OD.Quantity, 0)) AS TotalQuantity
FROM [dbo].[Products] AS P
LEFT JOIN [dbo].[Order Details] AS OD ON P.ProductID = OD.ProductID
GROUP BY P.ProductID, P.ProductDesc




-- כל קניה בנפרד
SELECT P.ProductID, P.ProductDesc, ISNULL(OD.Quantity, 0) AS Quantity
FROM [dbo].[Products] AS P
LEFT JOIN [dbo].[Order Details] AS OD ON P.ProductID = OD.ProductID

