--
--MIRGRATION UP
--當資料表有未完成交易時
--建立限制條件的作業會等到交易完成後再執行
--

--請使用兩個 Session 分別執行

--Session: 1
BEGIN TRANSACTION

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

ROLLBACK
GO

--Session: 2
--上面的連線要 ROLLBACK 或是 COMMIT 後才會建立完成
ALTER TABLE [Sales].[SalesOrderDetail_FKExample]
	WITH NOCHECK
	ADD CONSTRAINT [FK_Sales_SalesOrderDetail_FKExample_ProductID]
	FOREIGN KEY ([ProductID])
	REFERENCES [Production].[Product]([ProductID])
GO