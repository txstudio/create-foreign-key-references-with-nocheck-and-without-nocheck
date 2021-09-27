
#  SQL Server 建立 Foreign Key 限制條件時使用與不使用 WITH NOCHECK 的差異範例

## 環境

- Microsoft SQL Server 2019 (Container)
- AdventureWorks2019

## 備註

在已有資料的資料表建立 FOREIGN KEY 時可使用 WITH NOCHECK 

建立 FOREIGN KEY 不檢查既有資料快速建立限制條件，建立完成後**還是**會對新進來的資料做**檢查**

當有交易正在存取要修改的資料表時，需等到交易完成才會開始執行修改資料表的作業
