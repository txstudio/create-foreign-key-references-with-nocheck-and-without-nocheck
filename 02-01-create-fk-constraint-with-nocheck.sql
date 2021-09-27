--
--MIRGRATION UP
--建立 FOREIGN KEY CONSTRAINT 的時候不對既有資料做檢查
--
--雖然建立 FOREIGN KEY 的時候忽略檢查當下資料
--但在日後新增的資料還是會進行檢查
--
--忽略檢查 (NOCHECK) 建立速度很快
--
ALTER TABLE [Sales].[SalesOrderDetail_FKExample]
	WITH NOCHECK
	ADD CONSTRAINT [FK_Sales_SalesOrderDetail_FKExample_ProductID]
	FOREIGN KEY ([ProductID])
	REFERENCES [Production].[Product]([ProductID])
GO

--此時新增一筆違反限制條件的資料
--會出現錯訊息
INSERT INTO [Sales].[SalesOrderDetail_FKExample] (
	[CarrierTrackingNumber]
	, [OrderQty]				
	, [ProductID]				
	, [SpecialOfferID]		
	, [UnitPrice]				
	, [UnitPriceDiscount]		
	, [ModifiedDate]	
) VALUES (
	'4911-403C-98'
	, 7
	, -1				
	, 1		
	, 2999				
	, 0			
	, GETDATE()	
)
GO

--
--MIRGRATION DOWN
--
ALTER TABLE [Sales].[SalesOrderDetail_FKExample]
	DROP CONSTRAINT [FK_Sales_SalesOrderDetail_FKExample_ProductID]
GO

DELETE FROM [Sales].[SalesOrderDetail_FKExample]
	WHERE [ProductID] = (-1)
GO
