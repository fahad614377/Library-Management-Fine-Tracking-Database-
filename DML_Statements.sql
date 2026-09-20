

USE LibraryManagement
GO
-----Q1.Data Insertion into relatable Tables---------------------

INSERT INTO Members(MemberId,MemberFName,MemberLName,Phone,ContactAddress,City,MemberShipDate,ExpiredDate,MemberStatus)
VALUES
('M-101','Muhammad','Fahad','01601953678','NangalKot','Cumilla','2026-03-06','2027-03-06','Active'),
('M-102','Rahim','Uddin','01711111111','Dhanmondi','Dhaka','2026-01-10','2027-01-10','Active'),
('M-103','Karim','Hasan','01711111112','Agrabad','Chattogram','2024-02-05','2025-02-05','Expired'),
('M-104','Abdul','Kader','01711111113','Zindabazar','Sylhet','2025-06-12','2026-06-12','Active'),
('M-105','Sajid','Hossain','01711111114','Sonadanga','Khulna','2024-01-20','2025-01-20','Expired'),
('M-106','Mehedi','Hasan','01711111115','Sadar Road','Barishal','2024-02-18','2025-02-18','Expired'),
('M-107','Rafiq','Islam','01711111116','Kandirpar','Cumilla','2025-08-02','2026-08-02','Active'),
('M-108','Jahidul','Islam','01711111117','Rajpara','Rajshahi','2025-10-10','2026-10-10','Active'),
('M-109','Arif','Hossain','01711111118','Notun Bazar','Mymensingh','2026-01-25','2027-01-25','Active'),
('M-110','Tanvir','Ahmed','01711111119','Upashahar','Bogura','2026-02-11','2027-02-11','Active'),
('M-111','Imran','Khan','01711111120','Modhupur Road','Tangail','2025-12-05','2026-12-05','Active'),
('M-112','Shakil','Ahmed','01711111121','Station Road','Narsingdi','2026-02-09','2027-02-09','Active'),
('M-113','Nasir','Uddin','01711111122','Court Road','Pabna','2025-01-15','2026-01-15','Active'),
('M-114','Rakib','Hossain','01711111123','Chawk Bazar','Chandpur','2024-03-14','2025-03-14','Expired'),
('M-115','Faisal','Ahmed','01711111124','Kaptai Road','Rangamati','2024-02-22','2025-02-22','Expired'),
('M-116','Mamun','Mia','01711111125','Town Hall','Jamalpur','2026-01-30','2027-01-30','Active'),
('M-117','Habibur','Rahman','01711111126','Sadar','Kushtia','2024-04-01','2025-04-01','Expired'),
('M-118','Al','Amin','01711111127','Bhairab','Kishoreganj','2026-02-27','2027-02-27','Active'),
('M-119','Saiful','Islam','01711111128','Railgate','Dinajpur','2025-08-18','2026-08-18','Active'),
('M-120','Monir','Hossain','01711111129','Town Hall','Noakhali','2026-02-13','2027-02-13','Active'),
('M-121','Shuvo','Ahmed','01711111130','DC Road','Feni','2024-01-28','2025-01-28','Expired');

---------------------

INSERT INTO Authors(AuthorId,AuthorFName,AuthorLName,AuthorCountry)
VALUES
('A-101','Kazi Nazrul','Islam','Bangladesh'),
('A-102','Rabindranath','Tagore','Bangladesh'),
('A-103','JasimUddin',' ','Bangladesh'),
('A-104','Humayun','Ahmed','Bangladesh'),
('A-105','Sarat Chandra','Chattopadhyay','India'),
('A-106','Muhammad Zafar','Iqbal','Bangladesh'),
('A-107','Sunil','Gangopadhyay','Bangladesh'),
('A-108','Syed Mujtaba','Ali','Bangladesh'),
('A-109','Shirshendu','Mukhopadhyay','Bangladesh'),
('A-110','Selina','Hossain','Bangladesh'),
('A-111','J.K.','Rowling','England'),
('A-112','William','Shakespeare','England'),
('A-113','George','Orwell','India'),
('A-114','Mark','Twain','America'),
('A-115','Jane','Austen','England'),
('A-116','Ernest','Hemingway','America'),
('A-117','Leo','Tolstoy','Russia'),
('A-118','Charles','Dickens','England'),
('A-119','Stephen','King','America'),
('A-120','Victor','Hugo','France'),
('A-121','Fyodor','Dostoevsky','Russia');

---------------------

INSERT INTO Category(CategoryId,CategoryName)
VALUES 
(1001,'Novel'),
(1002,'Science'),
(1003,'Religion'),
(1004,'History'),
(1005,'Biography'),
(1006,'Technology'),
(1007,'Programming'),
(1008,'Mathematics'),
(1009,'Poetry');

----------------------

INSERT INTO Books(BookName,AuthorId,CategoryId,TotalCopies,ShelfLocation)
VALUES
('Bidrohi','A-101',1009,5,'S1-L1'),
('Agnibeena','A-101',1009,4,'S1-L2'),
('Gitanjali','A-102',1009,6,'S1-L3'),
('Shesher Kobita','A-102',1001,5,'S1-L4'),
('Nakshi Kanthar Math','A-103',1009,3,'S1-L5'),
('Himu','A-104',1001,7,'S2-L1'),
('Misir Ali','A-104',1001,6,'S2-L2'),
('Devdas','A-105',1001,5,'S2-L3'),
('Pather Dabi','A-105',1001,4,'S2-L4'),
('Quantum Mechanics','A-106',1002,5,'S2-L5'),
('Programming Basics','A-106',1007,8,'S3-L1'),
('Sei Somoy','A-107',1004,4,'S3-L2'),
('Aranyer Din Ratri','A-107',1001,3,'S3-L3'),
('Deshe Bideshe','A-108',1005,5,'S3-L4'),
('Chander Pahar','A-109',1001,6,'S3-L5'),
('Goynar Baksho','A-110',1001,4,'S4-L1'),
('Harry Potter ','A-111',1001,10,'S4-L2'),
('Hamlet','A-112',1001,5,'S4-L4'),
('Macbeth','A-112',1001,4,'S4-L5'),
('Animal Farm','A-113',1001,6,'S5-L1'),
('Old Man and the Sea','A-116',1001,4,'S6-L2'),
('War and Peace','A-117',1004,3,'S6-L3'),
('Les Miserables','A-120',1004,3,'S7-L4'),
('Crime and Punishment','A-121',1001,4,'S7-L5'),
('Chayanat','A-101',1009,3,'S1-L4'),
('Gora','A-102',1001,5,'S2-L2'),
('Chokher Bali','A-102',1001,4,'S2-L3'),
('Sojan Badiar Ghat','A-103',1001,3,'S2-L5'),
('Rakhali','A-103',1009,3,'S3-L1'),
('Beder Meye','A-103',1001,2,'S3-L2'),
('Misir Ali','A-104',1001,6,'S3-L4'),
('Srikanta','A-105',1001,4,'S4-L4'),
('Charitraheen','A-105',1001,3,'S4-L5');

--------------------------------------

INSERT INTO FinePolicy(FinePolicyId,Title,Descriptions,FineType,FineAmount)
Values
(501,'Late Return','Less than 5 days late','Per Day',10),
(502,'Late Return','6-9 days late','Per Day',20),
(503,'Late Return','10-14 days late','Per Day',30),
(504,'Late Return','More than 15 days late','Per Day',50),
(505,'Reference Book','Late return of reference books','Per Day',50),
(506,'Book Damage','Minor damage Like damage of book cover or small torn pages','Fixed',100),
(507,'Book Damage','Major damage such as missing pages or writing on book','Fixed',250),
(508,'Book Lost','If Book lost Or Cannot be returned','Fixed',600),
(509,'Magazine Issue','Late return of magazines','Per Day',15),
(510,'Library Property','Damaged barcode/label/stamp','Fixed',80);

-------------------------------------

INSERT INTO BookIssue(MemberId,BookId,IssueDate,ReturnDeadLine,ReturnDate,FinePolicyId)
Values
('M-105',6,'2025-01-05','2025-01-15','2025-01-14',NULL),
('M-103',8,'2025-02-12','2025-02-22','2025-03-02',503),
('M-104',1,'2025-03-10','2025-03-20','2025-03-19',NULL),
('M-105',12,'2025-04-02','2025-04-12','2025-04-20',502),
('M-119',4,'2025-04-15','2025-04-25','2025-04-24',NULL),
('M-107',15,'2025-05-05','2025-05-15','2025-05-14',NULL),
('M-108',9,'2025-05-20','2025-05-30','2025-06-10',503),
('M-109',7,'2025-06-10','2025-06-20','2025-06-19',NULL),
('M-110',18,'2025-06-25','2025-07-05','2025-07-04',NULL),
('M-108',10,'2025-07-08','2025-07-18','2025-07-25',502),
('M-112',5,'2025-07-20','2025-07-30','2025-07-29',NULL),
('M-103',21,'2025-08-05','2025-08-15','2025-08-30',504),
('M-114',14,'2025-08-18','2025-08-28','2025-08-27',NULL),
('M-103',16,'2025-09-10','2025-09-20',NULL,NULL),
('M-109',11,'2025-09-18','2025-09-28','2025-09-27',NULL),
('M-117',19,'2025-10-02','2025-10-12',NULL,NULL),
('M-118',23,'2025-10-10','2025-10-20','2025-10-19',NULL),
('M-119',2,'2025-10-20','2025-10-30',NULL,NULL),
('M-120',25,'2025-11-05','2025-11-15','2025-11-25',502),
('M-109',17,'2025-11-18','2025-11-28',NULL,NULL),
('M-105',20,'2025-12-02','2025-12-12','2025-12-11',NULL),
('M-102',13,'2025-12-10','2025-12-20',NULL,NULL),
('M-103',22,'2026-01-05','2026-01-15',NULL,NULL),
('M-104',26,'2026-01-10','2026-01-20','2026-01-19',NULL),
('M-105',6,'2026-01-18','2026-01-28',NULL,NULL),
('M-106',24,'2026-02-01','2026-02-11',NULL,NULL),
('M-112',1,'2026-02-05','2026-02-15','2026-02-14',NULL),
('M-108',27,'2026-02-10','2026-02-20',NULL,NULL),
('M-109',28,'2026-02-18','2026-02-28',NULL,NULL),
('M-110',3,'2026-03-02','2026-03-12','2026-03-11',NULL),
('M-109',9,'2026-03-05','2026-03-15','2026-03-22',502),
('M-112',30,'2026-03-09','2026-03-19','2026-03-18',NULL),
('M-113',4,'2026-03-12','2026-03-22',NULL,NULL),
('M-114',15,'2026-03-16','2026-03-26','2026-04-02',502),
('M-115',8,'2026-04-01','2026-04-11',NULL,NULL),
('M-116',12,'2026-04-05','2026-04-15','2026-04-18',501),
('M-117',29,'2026-04-08','2026-04-18',NULL,NULL),
('M-112',18,'2026-04-12','2026-04-22','2026-04-21',NULL),
('M-119',7,'2026-04-16','2026-04-26',NULL,NULL);


-----Q2. Write a query to find all members who currently have books that are not yet returned--
SELECT b.IssueId,m.MemberFName+' '+m.MemberLName AS MemberName,b.IssueDate,b.ReturnDate,m.Phone
FROM BookIssue AS b
JOIN Members AS m ON b.MemberId=m.MemberId
WHERE b.ReturnDate is NULL


-----Q3. Write a query to retrieve the list of books that have been issued 2 times or more--
SELECT b.BookName,a.AuthorFName+' '+a.AuthorLName AS AuthorName,
COUNT(*) AS BookCount
FROM BookIssue AS bi
JOIN Books AS b ON bi.BookId=b.BookId
JOIN Authors AS a ON b.AuthorId=a.AuthorId
GROUP BY b.BookName,AuthorFName,AuthorLName
HAVING COUNT(*)>=2


----Q4. Write a query to find members who have returned books after the deadline--------
SELECT IssueId,m.MemberFName+' '+m.MemberLName AS MemberName,b2.BookName,IssueDate,ReturnDeadLine,ReturnDate
FROM BookIssue AS b
JOIN Members AS m ON b.MemberId=m.MemberId
JOIN Books AS b2 ON b.BookId=b2.BookId
WHERE ReturnDate>ReturnDeadLine


-----Q5. Write a query to calculate fine amount collected based on FinePolicy for all returned books.-------
SELECT m.MemberFName+' '+m.MemberLName AS MemberName,b2.BookName,ReturnDeadLine,ReturnDate,f.FineAmount,
f.FineAmount * DATEDIFF(DAY,ReturnDeadLine,ReturnDate)AS FineAmount
FROM BookIssue AS b
JOIN FinePolicy AS f ON b.FinePolicyId=f.FinePolicyId
JOIN Members AS m ON b.MemberId=m.MemberId
JOIN Books AS b2 ON b.BookId=b2.BookId
WHERE b.FinePolicyId is not null


-------Q6.Write a query to find the most issued books in the library.-------------
SELECT  bi.BookId,b.BookName,COUNT(*) AS IssuedCount FROM BookIssue AS bi
JOIN Books AS b ON bi.BookId=b.BookId
GROUP BY BookName,bi.BookId
ORDER BY IssuedCount DESC


-------Q7.Write a query to retrieve members whose membership has already expired but still have issued books----
SELECT IssueId,MemberFName+' '+MemberLName AS MemberName,BookName,
IssueDate,ReturnDate,MemberStatus
FROM BookIssue AS b
JOIN Members AS m ON b.MemberId=m.MemberId
JOIN Books AS b2 ON b.BookId=b2.BookId
WHERE ReturnDate is Null
AND MemberStatus='Expired'


--------Q8.Write a query to find members who have never issued any book--
--SELECT * FROM Members WHERE MemberId NOT IN(
--SELECT DISTINCT MemberId FROM BookIssue)


--------Q9.Write a query to retrieve the top 3 members who issued the highest number of books--
SELECT TOP 3 b.MemberId,m.MemberFName+' '+m.MemberLName AS MemberName,COUNT(*) AS Issuecount FROM BookIssue AS b
JOIN Members AS m ON b.MemberId=m.MemberId
GROUP BY b.MemberId,m.MemberFName,m.MemberLName
ORDER BY COUNT(*) DESC



-----Q10.Write a query to retrieve all completed book issue transactions where the book has been returned,
--and either the issue date is later than January 1, 2025 or the assigned return deadline exceeds June 1, 2025.

SELECT IssueId,m.MemberFName+' '+m.MemberLName AS MemberName,b.BookName,bi.IssueDate,
bi.ReturnDeadLine,bi.ReturnDate,FinePolicyId
FROM BookIssue AS bi
JOIN Members AS m ON bi.MemberId=m.MemberId
JOIN Books AS b ON bi.BookId=b.BookId
WHERE ReturnDate Is NOT NULL
AND ( IssueDate>'2025-01-01'
OR ReturnDeadLine>'2025-06-01')
 

 ----Q11.Write a query to retrieve members whose city are all except 'Dhaka', 'Chattogram', 'Cumilla' and membership date is later than '2025-06-01'. 
 SELECT * FROM Members WHERE City NOT IN ('Dhaka','Chattogram','Feni')
 AND MemberShipDate>'2025-06-01'


 -------Q12.Write a query to retrieve book issue records from '2025-01-01' to '2025-03-31'. 
 SELECT * FROM BookIssue
 WHERE IssueDate BETWEEN '2025-01-01' AND '2025-03-31'


 ---Q13.Write a query to find all members whose city starts with 'D' and the next letter is one of A through M. 
SELECT * FROM Members WHERE City LIKE ('D[A-M]%')


----Q14.Write a query to find all members whose city starts with 'D' and the next letter is not in N through Z.
SELECT * FROM Members WHERE City LIKE ('D[^N-Z]%')


-----Q15.Write a query to retrieve 7 through 15 records from BookIssue table. 
SELECT * FROM BookIssue
ORDER BY IssueId OFFSET 6 Rows FETCH NEXT 9 ROWS only


-------Q16.Write a query to find members who have never returned any book late.
SELECT IssueId,b.MemberId,MemberFName+' '+MemberLName AS MemberName,IssueDate,ReturnDeadLine,ReturnDate
FROM BookIssue AS b
JOIN Members AS m ON b.MemberId=m.MemberId
WHERE b.MemberId NOT IN (
SELECT DISTINCT MemberId FROM BookIssue WHERE ISNULL(ReturnDate,GETDATE())>ReturnDeadLine)


----Q17.Write a query to find authors whose books have never been issued.---
SELECT AuthorId,AuthorFName+' '+AuthorLName AS AuthorName,AuthorCountry
FROM Authors WHERE AuthorId NOT IN
(
SELECT DISTINCT AuthorId FROM Books WHERE BookId IN (
SELECT Distinct BookId FROM BookIssue)
)


------Q18.Update Row----------------------
Update Category SET CategoryName='Mythology'
WHERE CategoryId=1010


---------Q19.Delete Rows-------------------------
DELETE Category WHERE CategoryId=1010


-------Q20.Use of Aggregate function--------------------
SELECT m.MemberFName + ' ' + m.MemberLName AS MemberName,COUNT(bi.BookId) AS TotalBooksIssued
FROM BookIssue AS bi
JOIN Members AS m ON bi.MemberId = m.MemberId
GROUP BY m.MemberFName, m.MemberLName


---------Q21.Merge---------

---Creating a Temporary Table For Merge
USE LibraryManagement
GO
SELECT * INTO ArchieveBook
FROM BookIssue WHERE ReturnDate IS Null


---------Creating a Temporary Table For Merge
SELECT * INTO Late_Unreturned_Book
FROM BookIssue WHERE ReturnDate>ReturnDeadLine
OR ReturnDate IS Null


MERGE ArchieveBook AS a
USING Late_Unreturned_Book AS lb
ON a.IssueId=lb.IssueId
WHEN MATCHED
THEN UPDATE SET a.ReturnDate=lb.ReturnDate,
a.finePolicyId=lb.finePolicyId

WHEN NOT MATCHED 
THEN INSERT(MemberId,BookId,IssueDate,ReturnDeadLine,ReturnDate,FinePolicyId)
VALUES(lb.MemberId,lb.BookId,lb.IssueDate,lb.ReturnDeadLine,lb.ReturnDate,lb.FinePolicyId)

WHEN NOT MATCHED BY SOURCE 
THEN DELETE;


-----Q22.Generate a report showing the total number of books issued by each member and each category,
--including subtotals for each member, each category, and a grand total, using the CUBE operator.

SELECT MemberFName+' '+MemberLName AS MemberName,CategoryName,Count(*) AS Issuecount
FROM BookIssue AS bi
JOIN Members AS m ON bi.MemberId=m.MemberId
JOIN Books AS b ON bi.BookId=b.BookId
JOIN Category AS c ON b.CategoryId=c.CategoryId
GROUP BY CUBE(  (MemberFName,MemberLName),c.CategoryName)


----Q23.Write a query to generate a hierarchical report showing total issued books by MemberId and overall total using ROLLUP.
SELECT b.MemberId,m.MemberFName + ' ' + m.MemberLName AS MemberName,COUNT(*) AS IssueCount FROM BookIssue AS b
JOIN Members AS m ON b.MemberId=m.MemberId
GROUP BY ROLLUP(b.MemberId,MemberFName,MemberLName)


----Q24. Write a query to generate total issued books separately by MemberId, by BookId and a grand total using GROUPING SETS.

SELECT bi.MemberId,MemberFName+' '+MemberLName AS MemberName,bi.BookId,b.BookName,COUNT(*) AS BookCount
FROM BookIssue AS bi
JOIN Members AS m ON bi.MemberId=m.MemberId
JOIN Books AS b ON bi.BookId=b.BookId
GROUP BY GROUPING SETS
(
(bi.MemberId,MemberFName,MemberLName),
(bi.BookId,b.BookName),()
)
ORDER BY 
GROUPING(bi.MemberId),
GROUPING(bi.BookId)


-----Q25.Write a query to display each book issue along with a running total of issued books using the OVER clause
SELECT IssueId,bi.MemberId,MemberFName+' '+MemberLName AS MemberName,BookName,IssueDate,
COUNT(*) OVER(PARTITION BY bi.MemberId ORDER BY IssueDate) AS BookCount
FROM BookIssue AS bi 
JOIN Members AS m ON bi.MemberId=m.MemberId
JOIN Books As b ON bi.BookId=b.BookId


------Q26.Data Sorting-------------------------
SELECT MemberId,MemberFName + ' ' + MemberLName AS MemberName,MemberShipDate
FROM Members
ORDER BY MemberShipDate DESC




-------Q27.Give an Example of Subquery--------------------
SELECT MemberFName+' '+MemberLName AS MemberName,Phone,City,MemberStatus
FROM Members WHERE MemberId IN(
SELECT DISTINCT MemberId FROM BookIssue)


-----Q28(a).Write a query to find books with more copies than books written by Sarat Chandra(All Keyword). 
SELECT BookId,BookName,AuthorFName+' '+AuthorLName AS AuthorName,TotalCopies
FROM Books AS b
JOIN Authors AS a ON b.AuthorId=a.AuthorId
WHERE TotalCopies>All(
SELECT TotalCopies FROM Books WHERE AuthorId='A-105')


---Q28(b)Write a query to find books with more copies than any of the Book Copies written by Sarat Chandra(Some/Any keyword).
SELECT BookId,BookName,AuthorFName+' '+AuthorLName AS AuthorName,TotalCopies
FROM Books AS b
JOIN Authors AS a ON b.AuthorId=a.AuthorId
WHERE TotalCopies>Any(
SELECT TotalCopies FROM Books WHERE AuthorId='A-105')


------Q29.Write a correlated subquery to find the latest issued book for each member based on IssueDate.
SELECT IssueId,MemberId,BookName,IssueDate,ReturnDate FROM BookIssue AS bi 
JOIN Books AS b ON bi.BookId=b.BookId
WHERE bi.IssueDate IN (
SELECT MAX(bi2.IssueDate) FROM BookIssue AS bi2
WHERE bi2.MemberId = bi.MemberId )


----Q30.Write a query to retrieve members who have issued at least one book using the EXISTS operator. 
SELECT m.MemberId,m.MemberFName + ' ' + m.MemberLName AS MemberName
FROM Members AS m
WHERE EXISTS (
SELECT MemberId FROM BookIssue AS bi WHERE bi.MemberId = m.MemberId )


-----Q31.Write a query using CTE to retrieve each member’s total issued books,fine per day, and total fine calculated based on overdue days.
WITH MemberSummary AS (
SELECT bi.MemberId,COUNT(bi.BookId) AS TotalIssued,SUM(ISNULL(fp.FineAmount, 0)) AS FinePerDay
FROM BookIssue AS bi
LEFT JOIN FinePolicy AS fp ON bi.FinePolicyId = fp.FinePolicyId
GROUP BY bi.MemberId   
),
FineCalculation AS(
SELECT bi.MemberId,SUM(DATEDIFF(DAY,ReturnDeadLine,ReturnDate)* (fp.FinePerDay)) AS TotalFine
FROM BookIssue AS bi
Left JOIN MemberSummary fp ON bi.MemberId = fp.MemberId
WHERE ReturnDate>ReturnDeadLine
GROUP BY bi.MemberId)

SELECT ms.MemberId,m.MemberFName + ' ' + m.MemberLName AS MemberName,ms.TotalIssued,ms.FinePerDay,
ISNULL(fc.TotalFine,0)
FROM MemberSummary ms
JOIN Members m ON ms.MemberId = m.MemberId
LEFT JOIN FineCalculation fc ON ms.MemberId = fc.MemberId
ORDER BY ms.TotalIssued DESC


------------Q32.CASE function -------------
SELECT IssueId,MemberId,FinePolicyId,
CASE FinePolicyId
WHEN 501 THEN '10 TK Per Day'
WHEN 502 THEN '20 TK Per Day'
WHEN 503 THEN '30 TK Per Day'
WHEN 504 THEN '40 TK Per Day' 
ELSE 'No Fine'
END
AS FineDesceiption
FROM BookIssue

-----------Q33.SEARCH CASE function-----------------
SELECT IssueId,MemberId,
Case 
WHEN DATEDIFF(day,ReturnDeadLine,ISNULL(ReturnDate,GETDATE()))>30 THEN 'You will never get a book'
WHEN DATEDIFF(day,ReturnDeadLine,ISNULL(ReturnDate,GETDATE()))>20 THEN 'You have to pay double Fine'
WHEN DATEDIFF(day,ReturnDeadLine,ISNULL(ReturnDate,GETDATE()))>15 THEN 'Please be careful when lending books'
ELSE 'No Problems Found'
END AS AdvicesForMember
FROM BookIssue

----------Q34.IIF functions-------
SELECT MemberId,COUNT(BookId)OVER(PARTITION BY MemberId) AS MemberIssuedBook,
IIF(COUNT(BookId)OVER(PARTITION BY MemberId)>3,'Premium Member','Avarage Member') AS MemberStatus
FROM BookIssue


----------Q35.COALESCE/ISNULL functions --------	
SELECT IssueId,MemberId,IssueDate,ReturnDate,ISNULL(ReturnDate,'3000-01-01') AS NewDate FROM BookIssue


----------Q36.Ranking functions (ROW_NUMBER, RANK, DENSE_RANK, NTILE)------
SELECT BookId,BookName,RANK() OVER (ORDER BY TotalCopies) AS RankNum,
ROW_NUMBER() OVER (ORDER BY TotalCopies) AS RowNum,
DENSE_RANK() OVER (ORDER BY TotalCopies) AS DenseRankNum,
NTILE(4) OVER (ORDER BY TotalCopies) AS TierNum
FROM Books


----Q37.Conversion of Data Type Using Cast,Convert,Try_Convert----
SELECT MemberId,MemberFName+' '+MemberLName AS MemberName,
CAST(MemberShipDate AS Varchar) AS DateVarchar_UsingCast,
CONVERT(varchar,ExpiredDate,7) AS DateVarchar_UsingConvert,
TRY_Convert(Varchar,MemberShipDate,101)DateVarchar_UsingTry_Convert
FROM Members

-----Q38.Use of Outer Join(Left join)
SELECT m.MemberId,m.MemberFName+' '+MemberLName AS MemberName,bi.BookId
FROM Members AS m
LEFT JOIN BookIssue AS bi ON m.MemberId = bi.MemberId

---(B)Right join---------
SELECT  m.MemberId,m.MemberFName+' '+m.MemberLName AS MemberName,bi.BookId
FROM Members m
RIGHT JOIN BookIssue bi ON m.MemberId = bi.MemberId;

--------Q39.Use of Union------------
---Write a query to display members who have returned books and members who have not returned books,along with their book names and status.
SELECT m.MemberId,m.MemberFName + ' ' + m.MemberLName AS MemberName,b.BookName,'Not Returned' AS Status
FROM BookIssue AS bi
JOIN Members AS m ON bi.MemberId = m.MemberId
JOIN Books AS b ON bi.BookId = b.BookId
WHERE bi.ReturnDate IS NULL

UNION

SELECT m.MemberId,m.MemberFName + ' ' + m.MemberLName AS MemberName,b.BookName,'Returned' AS Status
FROM BookIssue AS bi
JOIN Members AS m ON bi.MemberId = m.MemberId
JOIN Books AS b ON bi.BookId = b.BookId
WHERE bi.ReturnDate IS NOT NULL



-------------Q40.Analytical function -----------
---A(First Value)
SELECT IssueId,MemberId,FIRST_VALUE(BookName) OVER (PARTITION BY MemberId ORDER BY IssueDate) AS FirstBook
FROM BookIssue AS bi
JOIN Books As b ON bi.BookId = b.BookId;

----B(Last_Value)
SELECT IssueId,MemberId,LAST_VALUE(BookName) OVER (PARTITION BY MemberId ORDER BY IssueDate ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
AS LastBook FROM BookIssue AS bi
JOIN Books AS b ON bi.BookId = b.BookId;

-----C(LEAD)
SELECT BookId,MemberId,
LEAD(BookId) OVER (ORDER BY IssueDate) AS NextBook
FROM BookIssue;

-----D(LAG)
SELECT BookId,MemberId,
LAG(BookId) OVER (ORDER BY IssueDate) AS PrevBook
FROM BookIssue

-----E(Cumulative Distribution)
SELECT IssueId,MemberId,
CUME_DIST() OVER (ORDER BY IssueDate) AS CDist
FROM BookIssue





-----------Q41.Using @@identity And @@Rowcount(WITH TRANSACTION)------
BEGIN 
BEGIN TRY 
BEGIN TRAN 
DECLARE @LastModification int,@RowAffect int
INSERT INTO Books(BookName,AuthorId,CategoryId,TotalCopies,ShelfLocation)
VALUES('Lavay Lalshak Puber Akash','A-122',1009,5,'S3-L5')

SET @LastModification=@@IDENTITY
SET @RowAffect=@@ROWCOUNT

IF @RowAffect = 1
INSERT INTO BookIssue(MemberId,BookId,IssueDate,ReturnDeadLine,ReturnDate,FinePolicyId)
VALUES('M-109',@LastModification,'2026-03-17','2026-03-27',NULL,NULL)
COMMIT TRAN
END TRY 

BEGIN CATCH 
  ROLLBACK TRAN
END CATCH
END;
GO

-----Q42.Justification of Using @@identity And @@Rowcount(WITH TRANSACTION)----
SELECT * FROM Books WHERE AuthorId='A-122'
SELECT * FROM BookIssue WHERE BookId=34





----Q43.Justification of View-------------
SELECT * FROM vu_CityWiseBookLendingDetails



--Q44.Justification of view with Encryption------
EXEC sp_helptext vu_CityWiseBookLendingDetails2



----Q45.Justification of View with Schemabinding----------
Drop table Members


----Q46.Justification of View with encryption and schemabinding--
Exec sp_helptext vu_CityWiseBookLending4
DROP TAble Books


---Q47.Justification of Alter View--
Select * FROM vu_CityWiseBookLending4



----Q48.Justification of Updatable View-------
UPDATE vu_BookLendingDetailswithoutFine
SET IssueDate='2025-07-20' 
WHERE IssueId=40


INSERT INTO vu_BookLendingDetailswithoutFine 
VALUES('M-104',9,'2026-03-12','2026-03-20',NULL,NULL)


DELETE FROM vu_BookLendingDetailswithoutFine
WHERE IssueId=40 AND MemberId='M-104'



----Q49.Justification of Scalar function------
SELECT  dbo.fnBookscount('A-105')



----Q50.Justification of Simple Table valued  function---------
SELECT * FROM fnMemberwiseBookIssue ('M-107')


---Q51.Justification of Multi Statement Table valued function---
SELECT * FROM fnBooksLendingDetailsInfo(15)
exec sp_helptext fnBooksLendingDetailsInfo



----Q52.Justification of fucntion with encryption and schemabinding--------
exec sp_helptext fnBooksLendingDetailsInfo2



----Q53.Justification of ALTER FUNCTION-----------------
SELECT * FROM fnBooksLendingDetailsInfo(15)


----Q54.Justification of STORED PROCEDURE(Without Parameter)-------
EXEC spMemberDueDays



----Q55.Justification of STORED PROCEDURE(With Parameter)-----------
EXEC spCategoryWiseBook 1007


----Q56.Justification of STORED PROCEDURE(With optional Peramiter)-----------
EXEC spCategoryWiseBook2 



---Q57.Justification of Procedure with recompile----------
EXEC spCategoryWiseBook3 1009



----Q58.Justification of procedure with encryption--
sp_helpText spCategoryWiseBook4


----Q59.Justification of Data insertion through Procedure--
EXEC spDataInsertation 'A-122','AL',' Mahmud'



----Q60.Justification of Data update through Procedure-------
EXEC spAuthorDataUpdate 'A-122','Nazib','Mahfuz'



----Q63.Justification of Data Delete through Procedure-------
EXEC spAuthorDataDelete 'A-122'

----Q64.Justification of OUTPUT PROCEDURE -----------------------
DECLARE @bname varchar(50), @aname varchar(50)
EXEC spBookAndAuthorName 1 ,@bname OUTPUT, @aname OUTPUT
SELECT @bname AS bookName, @aname AS AuthorName



-----Q65.Justification of ALTER PROCEDURE--------
DECLARE @bName varchar(30) 
EXEC spBookAndAuthorName '5',@bName OUTPUT
SELECT @bName AS BookName




-----Q66.Justification of Procedure with error handle-----------------------
EXEC spAuthorDataInsertWithErrorHandle 'A-104','gggg','hhh'




----Q67.Justification of Data Modification and output return through Single Procedure(Insert,Update,DELETE,OUTPUT,RETURN)---------------

EXEC spBookSelectInsertUpdateDeleteOutputReturn 'S','','','','','','','',''

EXEC spBookSelectInsertUpdateDeleteOutputReturn 'I',34,'fff','A-101','1001',50,'','',''

EXEC spBookSelectInsertUpdateDeleteOutputReturn 'U','34','hhh','A-101','1001','10','','',''

EXEC spBookSelectInsertUpdateDeleteOutputReturn 'D','34','','','','','','',''

DECLARE @authorName varchar(30)
EXEC spBookSelectInsertUpdateDeleteOutputReturn 'O','','','A-101','','','',@authorName OUTPUT,''
SELECT @authorName AS AuthorNAme

DECLARE @bookCount int
EXEC @bookCount= spBookSelectInsertUpdateDeleteOutputReturn 'R','','','',1009,'','','',''
SELECT @bookCount as BookCount




---Q68.Justification of index creation--------------
sp_helpindex Books



----Q69.Justification of index deletation-------
sp_helpindex Books



----Q70.Justification of TRIGGER(For/After trigger)------
Insert INTO BookIssue(MemberId,BookId,IssueDate,ReturnDeadLine,ReturnDate,FinePolicyId)
VALUES('M-101',9,'2026-03-24','2026-04-01',NULL,NULL)

DELETE FROM BookIssue WHERE IssueId=41



-----Q71.Justification of Instead Of trigger----------
DELETE FROM BookIssue WHERE IssueId = 40



-----Q72.Justification of truncate Table-------
Select * FRom BookIssue