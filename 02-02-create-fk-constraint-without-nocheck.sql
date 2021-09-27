--
--MIRGRATION UP
--建立 FOREIGN KEY CONSTRAINT 的時候對既有資料做檢查
--
--資料有違反限制條件時
--FOREIGN KEY 就不會建立成功
--
--相較於忽略檢查 (NOCHECK) 建立速度慢
--
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

--沒有指定 WITH NOCHECK 的話
--建立 FOREIGN KEY 的時候會對既有資料做檢查
--有違反限制條件就停止
ALTER TABLE [Sales].[SalesOrderDetail_FKExample]
	--WITH NOCHECK
	ADD CONSTRAINT [FK_Sales_SalesOrderDetail_FKExample_ProductID]
	FOREIGN KEY ([ProductID])
	REFERENCES [Production].[Product]([ProductID])
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
