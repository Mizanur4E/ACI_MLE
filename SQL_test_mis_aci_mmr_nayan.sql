--Beginner Level
--Question 1
SELECT COUNT(DISTINCT DepotCode) FROM Depot d 

--Question 2

SELECT COUNT(DISTINCT InvoicePeriod) FROM Invoice i 



--Question 3
SELECT COUNT(*) FROM Invoice i 
WHERE i.InvoicePeriod = '202302'

--Question 4
SELECT COUNT(DISTINCT CustomerCode) FROM Invoice i 
WHERE i.InvoicePeriod = '202301'


--Question 5
SELECT i.InvoiceNo, id.ProductCode
INTO #tempT
FROM Invoice i 
INNER JOIN InvoiceDetails id 
ON i.InvoiceNo  = id.Invoiceno 
WHERE i.InvoicePeriod = '202303'


SELECT COUNT(*) 
FROM #tempT

Question 6
SELECT DepotCode, InvoicePeriod,  SUM(NSI) AS MonthlySales
FROM Invoice i 
GROUP BY DepotCode , InvoicePeriod 

--Question 7

SELECT psc.CategoryID, i.InvoicePeriod, SUM(i.NSI) AS MonthlySales
FROM Invoice i 
INNER JOIN InvoiceDetails id 
ON i.InvoiceNo = id.Invoiceno 
INNER JOIN Product p 
ON id.ProductCode = p.ProductCode 
INNER JOIN ProductSubCategory psc 
ON p.SubCategoryID = psc.SubCategoryID 
GROUP BY psc.CategoryID , i.InvoicePeriod 
ORDER BY psc.CategoryID DESC 

--Question 8

SELECT id.ProductCode, SUM(id.SalesQTY) AS Demand
INTO #tempT
FROM InvoiceDetails id 
GROUP BY id.ProductCode 

SELECT MAX(Demand)
FROM #tempT

SELECT ProductCode 
FROM #tempt
WHERE  Demand = 234735


--Question 9

SELECT i.DepotCode,  p.SubCategoryID ,SUM(id.SalesQTY) as quantity,  SUM(i.NSI) AS MonthlySales
INTO #tempT
FROM Invoice i 
INNER JOIN InvoiceDetails id 
ON i.InvoiceNo = id.Invoiceno 
INNER JOIN Product p 
ON id.ProductCode = p.ProductCode 
GROUP BY i.DepotCode ,  p.SubCategoryID


select DepotCode , max(quantity)
from #tempT
group by DepotCode 


--Question 10

SELECT SUM(i.NSI) 
FROM Invoice i 
WHERE i.InvoicePeriod = '202304' AND DAY(i.InvoiceDate) < 16 

SELECT SUM(i.NSI) 
FROM Invoice i 
WHERE i.InvoicePeriod = '202304' AND DAY(i.InvoiceDate) > 15


-- Advanced LEVEL 

-- 2 (i)
SELECT  TOP 1 InvoicePeriod ,  SUM(NSI) AS MonthlySales
FROM Invoice i 
GROUP BY InvoicePeriod 
ORDER BY MonthlySales  DESC 


-- 2 (ii)

SELECT   InvoicePeriod ,  SUM(NSI) AS MonthlySales, COUNT (DISTINCT  InvoiceNo) AS MonthlyInvoiceCount
INTO #TempT
FROM Invoice i 
GROUP BY InvoicePeriod 
ORDER BY MonthlySales  DESC 

SELECT AVG(MonthlySales), AVG(MonthlyInvoiceCount) 
FROM #TempT



-- 2 (iii)

SELECT   TOP 1 InvoiceDate  ,  SUM(NSI) AS  SalesAmount
FROM Invoice i 
GROUP BY InvoiceDate 
ORDER BY SalesAmount  DESC 


-- 2 (iv)

SELECT   TOP 1 InvoiceDate  ,   COUNT (DISTINCT  InvoiceNo) AS DailyInvoiceCount
FROM Invoice i 
GROUP BY InvoiceDate 
ORDER BY DailyInvoiceCount  DESC 


--4

SELECT  p.ProductCode 
FROM Invoice i 
INNER JOIN InvoiceDetails id 
ON i.InvoiceNo = id.Invoiceno 
INNER JOIN Product p 
ON id.ProductCode = p.ProductCode 
WHERE i.InvoicePeriod = '202304'  
 
EXCEPT 

SELECT   p.ProductCode 
FROM Invoice i 
INNER JOIN InvoiceDetails id 
ON i.InvoiceNo = id.Invoiceno 
INNER JOIN Product p 
ON id.ProductCode = p.ProductCode 
WHERE i.InvoicePeriod = '202303'  


--5
SELECT DISTINCT CustomerCode 
FROM Invoice i 
WHERE InvoicePeriod ='202303' AND CustomerCode IS NOT NULL

EXCEPT 

SELECT DISTINCT CustomerCode 
FROM Invoice i 
WHERE InvoicePeriod ='202304' AND CustomerCode IS NOT NULL


--6


SELECT TOP 10  i .CustomerCode , SUM(i.NSI) AS PurchasedAmount,  c.CustomerName , c.Add1 , c.Add2, c.Email, c.Mobile  
FROM Invoice i 
INNER JOIN Customer c 
ON i.CustomerCode = c.CustomerCode  
WHERE  i.CustomerCode != '' AND i.InvoicePeriod > '202301' AND i.InvoicePeriod < '202304' 
GROUP BY i.CustomerCode , c.CustomerName , c.Add1 , c.Add2, c.Email, c.Mobile  
ORDER BY PurchasedAmount DESC


--7



SELECT    InvoiceDate, DepotCode,  DATENAME(MONTH,InvoiceDate) AS Monthn, 
DATENAME(WEEKDAY,InvoiceDate) AS Weekday ,  COUNT (DISTINCT  InvoiceNo) AS WeekdayWiseInvcCount
INTO #TEMP_12
FROM Invoice i 
GROUP BY InvoiceDate , DepotCode 
ORDER BY DepotCode,  Weekday

SELECT DepotCode , Monthn, Weekday,  SUM(WeekdayWiseInvcCount) AS Daywise
FROM #TEMP_12
GROUP BY DepotCode, Monthn, Weekday 
ORDER BY DepotCode , Monthn, Weekday 




