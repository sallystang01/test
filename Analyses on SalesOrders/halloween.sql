USE AdventureWorks2014
/*
DECLARE @HIREDATE DATETIME

SET @HIREDATE =   (SELECT TOP 1 e.HireDate
                  FROM HumanResources.Employee e
                  INNER JOIN Person.Person p
                  ON P.BusinessEntityID = e.BusinessEntityID
                  WHERE p.LastName = 'Gilbert' AND p.FirstName = 'Guy')

PRINT @HIREDATE
*/

use AdventureWorks2014

--Smallmoney 

declare @SMALLMONEY smallmoney 
set @SMALLMONEY = 
					(select top 1 sod.LineTotal
					from Production.Product p
					inner join
					sales.SalesOrderDetail sod
					on sod.ProductID = p.ProductID)

					Print @SMALLMONEY

--Money 
declare @MONEY money 
set @MONEY = 
					(select top 1 sum(sod.LineTotal * sod.UnitPrice)
					from Production.Product p
					inner join
					sales.SalesOrderDetail sod
					on sod.ProductID = p.ProductID
					where LineTotal > 1000)

					Print @MONEY
--Bigint
declare @BIGINT bigint
set @BIGINT =

(select sum(p.listprice * p.StandardCost * sod.LineTotal * 9999)
 from Production.Product p
 inner join sales.SalesOrderDetail sod
 on sod.ProductID = p.ProductID
 where ListPrice > 3000 and StandardCost <> 0 )

 print @BIGINT

--Int
declare @INT int
set @INT =

(select sum(listprice * StandardCost)
 from Production.Product
 where ListPrice <> 0 and StandardCost <> 0)

 print @INT
 --Smallint
 DECLARE @SMALLINT smallint

 SET @SMALLINT = 

 (select top 1 max(ListPrice) [Price]
 from Production.Product
 group by ProductID
 having max(ListPrice) < 32000
 order by Price desc)

 PRINT @SMALLINT
  --Tinyint
 DECLARE @TINYINT tinyint
 SET @TINYINT =

  (select top 1 max(ListPrice) [Price]
 from Production.Product
 group by ProductID
 having max(ListPrice) < 255
 order by Price desc)

 PRINT @TINYINT
  --Bit
 DECLARE @BIT bit
 SET @BIT =

 (select top 1 max(ListPrice) [Price]
 from Production.Product
 group by ProductID
 having max(ListPrice) < 2
 order by Price desc)

 PRINT @BIT 
   --Decimal
 DECLARE @DECIMAL decimal(10,2)
 SET @DECIMAL =

 (select top 1 ListPrice
 from Production.Product

  order by ListPrice desc)
 PRINT @DECIMAL
 
    --Float
 DECLARE @FLOAT float
 SET @FLOAT =
 (select top 1 ListPrice
 from Production.Product
 where ListPrice < 400
  order by ListPrice desc)

  PRINT @FLOAT
      --Real
   DECLARE @REAL real
 SET @REAL =
 (select top 1 ListPrice
 from Production.Product
 where ListPrice < 500
  order by ListPrice desc)

  PRINT @REAL

     --Datetime
  DECLARE @DATETIME datetime
  SET @DATETIME =

  (select top 1 edh.StartDate
  from HumanResources.Employee e
  inner join
  HumanResources.EmployeeDepartmentHistory edh
  on e.BusinessEntityID = edh.BusinessEntityID
  inner join
  Person.Person p
  on p.BusinessEntityID = e.BusinessEntityID)

  PRINT @DATETIME

       --SmallDateTime
    DECLARE @SMALLDATETIME SMALLDATETIME
  SET @SMALLDATETIME =

  (select top 1 edh.StartDate
  from HumanResources.Employee e
  inner join
  HumanResources.EmployeeDepartmentHistory edh
  on e.BusinessEntityID = edh.BusinessEntityID
  inner join
  Person.Person p
  on p.BusinessEntityID = e.BusinessEntityID
  where p.firstname = 'Mary' and p.lastname = 'Dempsey')
  PRINT @SMALLDATETIME


         --Timestamp
  --DECLARE @TIMESTAMP timestamp
  --SET @TIMESTAMP =
  --(select top 1 cast(shiftid as nvarchar(30))
  --from HumanResources.EmployeeDepartmentHistory)

  --PRINT @TIMESTAMP

  --Char
  DECLARE @CHAR char(20)
  SET @CHAR =
  
  (select top 1 Name
  from Production.Product
)

PRINT @CHAR

 --Varchar
  DECLARE @VARCHAR VARCHAR(20)
  SET @VARCHAR =
  
  (select top 1 Description
  from sales.SpecialOffer
)

PRINT @VARCHAR

--Binary
DECLARE @BINARY binary
SET @BINARY =

(select top 1 ThumbNailPhoto
from Production.ProductPhoto)
PRINT @BINARY;


--VARBINARY
DECLARE @VARBINARY varbinary
SET @VARBINARY =

(select top 1 LargePhoto
from Production.ProductPhoto
where ProductPhotoID = 70)
PRINT @VARBINARY;
--UNIQUEIDENTIFIER
DECLARE @UNIQUE uniqueidentifier
SET @UNIQUE =

(select top 1 rowguid
from Person.Person)

PRINT @UNIQUE