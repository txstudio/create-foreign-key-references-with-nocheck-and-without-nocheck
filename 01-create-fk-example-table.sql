--
--MIRGRATION UP
--重複複製 [Sales].[SalesOrderDetail] 資料到新的資料表
--
CREATE TABLE [Sales].[SalesOrderDetail_FKExample]
(
	[CarrierTrackingNumber]	[nvarchar](25) 		NULL,
	[OrderQty]				[smallint] 			NOT NULL,
	[ProductID]				[int] 				NOT NULL,
	[SpecialOfferID]		[int] 				NOT NULL,
	[UnitPrice]				[money] 			NOT NULL,
	[UnitPriceDiscount]		[money] 			NOT NULL,
	[rowguid]				[uniqueidentifier]	DEFAULT NEWSEQUENTIALID(),
	[ModifiedDate]			[datetime]			NOT NULL,
	
	CONSTRAINT [PK_SalesOrderDetail_FKExample]
		PRIMARY KEY NONCLUSTERED ([rowguid])
	
) ON [PRIMARY]
GO

DECLARE @index INT
DECLARE @index_max INT

SET @index = 0
SET @index_max = 100

WHILE @index < @index_max
BEGIN

	INSERT INTO [Sales].[SalesOrderDetail_FKExample](
		[CarrierTrackingNumber]
	   ,[OrderQty]
	   ,[ProductID]
	   ,[SpecialOfferID]
	   ,[UnitPrice]
	   ,[UnitPriceDiscount]
	   ,[ModifiedDate]
	)
	SELECT [CarrierTrackingNumber]
	   ,[OrderQty]
	   ,[ProductID]
	   ,[SpecialOfferID]
	   ,[UnitPrice]
	   ,[UnitPriceDiscount]
	   ,[ModifiedDate]
	FROM [Sales].[SalesOrderDetail]

	SET @index = (@index + 1)
END
GO

--
--MIRGRATION DOWN
--
DROP TABLE [Sales].[SalesOrderDetail_FKExample]
GO