
-----------------Q1.Database Create---------------------------------

USE MASTER
GO
if DB_id('LibraryManagement') is not null
DROP DATABASE LibraryManagement;
GO
CREATE DATABASE LibraryManagement
On(
name='LibraryManagement_DATA_1',
FileName='C:\Program Files\Microsoft SQL Server\MSSQL17.MSSQLSERVER\MSSQL\DATA\LibraryManagement_DATA_1.mdf',
size=30mb,
Maxsize=100mb,
FileGrowth=5%
)
LOG On(
name='LibraryManagement_LOG_1',
FileName='C:\Program Files\Microsoft SQL Server\MSSQL17.MSSQLSERVER\MSSQL\DATA\LibraryManagement_LOG_1.ldf',
size=2mb,
Maxsize=50mb,
FileGrowth=1mb
)
GO

---------------Q2.Creating Relatable Tables------------
USE LibraryManagement
GO
CREATE TABLE Members(
MemberId varchar(10) not null PRIMARY KEY ,
MemberFName varchar(20) not null,
MemberLName varchar(20) not null,
Phone Varchar(11) not null UNIQUE,
ContactAddress Varchar(50) not null,
City varChar(20) not null,
MemberShipDate DATE not null DEFAULT GETDATE(),
ExpiredDate Date not null,
MemberStatus Char(10) not null Default 'Active'
)


CREATE TABLE Authors(
AuthorId varchar(10) not null PRIMARY KEY,
AuthorFName Varchar(20) not null,
AuthorLName Varchar(20) not null,
AuthorCountry varchar(20) not null
)



CREATE TABLE Category(
CategoryId int not null PRIMARY KEY,
CategoryName varchar(20) not null
)


CREATE TABLE Books(
BookId int not null PRIMARY KEY IDENTITY(1,1),
BookName VarChar(30) not null,
AuthorId varchar(10) not null REFERENCES Authors(AuthorId),
CategoryId int not null REFERENCES Category(CategoryId),
TotalCopies int Not null,
ShelfLocation varchar(15)
)



CREATE TABLE FinePolicy(
FinePolicyId int Not Null Primary KEY,
Title varchar(20) not null,
Descriptions varchar(60) not null,
FineType varchar(15) not null,
FineAmount money not null
)


CREATE TABLE BookIssue(
IssueId int Not Null PRIMARY KEY IDENTITY(1,1),
MemberId varchar(10) not null REFERENCES Members(MemberId),
BookId int Not null REFERENCES Books(BookId),
IssueDate Date Not null DEFAULT GetDate(),
ReturnDeadLine Date not null,
ReturnDate date,
FinePolicyId int REFERENCES FinePolicy(FinePolicyId)
)



-------------Q3.View--------------------------------------------------------
USE LibraryManagement
GO
CREATE VIEW vu_CityWiseBookLendingDetails
AS
SELECT bi.IssueId,MemberFName+' '+MemberLName AS MemberName,
m.Phone,m.City,b.BookName,a.AuthorFName+' '+a.AuthorLName AS AuthorName 
FROM BookIssue as bi
JOIN Members AS m ON bi.MemberId=m.MemberId
JOIN Books as b ON bi.BookId=b.BookId
JOIN Authors AS a on b.AuthorId=a.AuthorId
WHERE m.City in ('Cumilla','Khulna','Dhaka')
GO


---------------Q4.View with Encryption--------------------------------------
CREATE VIEW vu_CityWiseBookLendingDetails2
With Encryption
AS
SELECT bi.IssueId,m.MemberFName+' '+m.MemberLName AS MemberName,
m.Phone,b.BookName,a.AuthorFName+' '+a.AuthorLName AS AuthorName
FROM BookIssue as bi
JOIN Members AS m ON bi.MemberId=m.MemberId
JOIN Books as b ON bi.BookId=b.BookId
JOIN Authors AS a on b.AuthorId=a.AuthorId
WHERE m.City in ('Cumilla','Khulna','Dhaka')
GO




------------Q5.View with Schemabinding-----------------------------------
CREATE VIEW vu_CityWiseBookLending3
With Schemabinding
AS
SELECT bi.IssueId,m.MemberFName+' '+m.MemberLName AS MemberName,
m.Phone,b.BookName,a.AuthorFName+' '+a.AuthorLName AS AuthorName
FROM dbo.BookIssue as bi
JOIN  dbo.Members AS m ON bi.MemberId=m.MemberId
JOIN  dbo.Books as b ON bi.BookId=b.BookId
JOIN  dbo.Authors AS a on b.AuthorId=a.AuthorId
WHERE m.City in ('Cumilla','Feni','Dhaka')
GO


-----------Q6.View with encryption and schemabinding Altogether--------------------
CREATE VIEW vu_CityWiseBookLending4
With Schemabinding,Encryption
AS
SELECT bi.IssueId,m.MemberFName+' '+m.MemberLName AS MemberName,
m.Phone,b.BookName,a.AuthorFName+' '+a.AuthorLName AS AuthorName
FROM dbo.BookIssue as bi
JOIN  dbo.Members AS m ON bi.MemberId=m.MemberId
JOIN  dbo.Books as b ON bi.BookId=b.BookId
JOIN  dbo.Authors AS a on b.AuthorId=a.AuthorId
WHERE m.City in ('Cumilla','Feni','Dhaka')
GO


------------Q7.ALTER View-----------------------------------------------
ALTER VIEW vu_CityWiseBookLending4
as
SELECT bi.IssueId,m.MemberFName+' '+m.MemberLName AS MemberName,
m.Phone,m.City,b.BookName,a.AuthorFName+' '+a.AuthorLName AS AuthorName,bi.IssueDate 
FROM dbo.BookIssue as bi
JOIN  dbo.Members AS m ON bi.MemberId=m.MemberId
JOIN  dbo.Books as b ON bi.BookId=b.BookId
JOIN  dbo.Authors AS a on b.AuthorId=a.AuthorId
WHERE m.City in ('Cumilla','Feni','Dhaka','Khulna')
AND bi.IssueDate<='2026-02-10'
GO




---------Q8.Updatable View-----------------------------------------------
CREATE VIEW vuBookLendingDetailswithoutFine
AS
SELECT * FROM BookIssue WHERE FinePolicyId is NULL
AND IssueDate<='2025-10-30'
GO




---------Q9.Delete View-------------------------------------------------
DROP VIEW vu_CityWiseBookLendingDetails2
GO



---------------Q10.Function(scalar)-----------------------------------------
Create function fnBookscount(@AuthorId varchar(10))
RETURNS int
BEGIN 
RETURN
(Select COUNT(*) FROM Books WHERE AuthorId=@AuthorId)
END
GO


-------------Q11.Function(Simple Table valued )--------------------------------
CREATE FUNCTION fnMemberwiseBookIssue(@MemberId varchar(10))
RETURNS TABLE
AS
RETURN
(SELECT IssueId,bi.MemberId,m.MemberFName+' '+m.MemberLName AS MemberName,
bi.IssueDate,bi.ReturnDeadLine,bi.ReturnDate
FROM BookIssue AS bi
JOIN Members AS m ON bi.MemberId=m.MemberId
WHERE bi.MemberId=@MemberId)
GO



------Q12.Function(Multi Statement Table value)----------------------

CREATE FUNCTION fnBooksLendingDetailsInfo(@bookId int)
RETURNS @LendInfo TABLE
(IssueId int,MemberName varchar(30),BookName varchar(20),AuthorName varchar(30),IssueDate date,ReturnDate date)
AS
BEGIN
INSERT INTO @LendInfo

SELECT bi.IssueId,m.MemberFName+' '+m.MemberLName AS MemberName,
b.BookName,a.AuthorFName+' '+a.AuthorLName AS AuthorName,bi.IssueDate,bi.ReturnDate

FROM BookIssue AS bi
JOIN Members AS m ON bi.MemberId=m.MemberId
JOIN Books AS b ON bi.BookId=b.BookId
JOIN Authors AS a ON b.AuthorId=a.AuthorId
WHERE bi.BookId=@bookId
RETURN
END
go


---------Q13.fucntion with encryption and schemabinding Altogether------------------

CREATE FUNCTION fnBooksLendingDetailsInfo2(@bookId int)
RETURNS @LendInfo TABLE
(
IssueId int,MemberName varchar(30),BookName varchar(20),AuthorName varchar(30),IssueDate date,ReturnDate date
)
with encryption,Schemabinding
AS
BEGIN
INSERT INTO @LendInfo

SELECT bi.IssueId,m.MemberFName+' '+m.MemberLName AS MemberName,
b.BookName,a.AuthorFName+' '+a.AuthorLName AS AuthorName,bi.IssueDate,bi.ReturnDate
FROM dbo.BookIssue AS bi
JOIN dbo.Members AS m ON bi.MemberId=m.MemberId
JOIN dbo.Books AS b ON bi.BookId=b.BookId
JOIN dbo.Authors AS a ON b.AuthorId=a.AuthorId
WHERE bi.BookId=@bookId
RETURN
END
GO


-----------------Q14.ALTER FUNCTION------------------------------------------
ALTER FUNCTION fnBooksLendingDetailsInfo(@bookId int)
RETURNS @LendInfo TABLE
(IssueId int,MemberName varchar(30),BookName varchar(20),AuthorName varchar(30),IssueDate date,ReturnDeadLine date,
ReturnDate date,OverDueDays int)
AS
BEGIN
INSERT INTO @LendInfo

SELECT bi.IssueId,m.MemberFName+' '+m.MemberLName AS MemberName,
b.BookName,a.AuthorFName+' '+a.AuthorLName AS AuthorName,
bi.IssueDate,bi.ReturnDeadLine,bi.ReturnDate,
DATEDIFF(DAY,ReturnDeadLine,ISNULL(ReturnDate,GETDATE())) AS OverDueDays

FROM BookIssue AS bi
JOIN Members AS m ON bi.MemberId=m.MemberId
JOIN Books AS b ON bi.BookId=b.BookId
JOIN Authors AS a ON b.AuthorId=a.AuthorId
WHERE bi.BookId=@bookId

RETURN
END
GO



---------Q15.DELETE FUNCTION-----------------------------------------
DROP FUNCTION fnBooksLendingDetailsInfo2
GO


----------Q16.STORED PROCEDURE(Without Parameter)-----------------------
CREATE PROC spMemberDueDays
AS
SELECT bi.IssueId,m.MemberFName+' '+m.MemberLName AS MemberName,
b.BookName,bi.ReturnDeadLine,bi.ReturnDate,
DATEDIFF(DAY,ReturnDeadLine,ISNULL(ReturnDate,GETDATE())) AS OverDueDays
FROM BookIssue AS bi 
JOIN Members AS m ON bi.MemberId=m.MemberId
JOIN Books AS b ON bi.BookId=b.BookId
WHERE bi.FinePolicyId is not null
GO




----------Q17.STORED PROCEDURE(With Parameter)--------------------------

CREATE PROC spCategoryWiseBook
@categoryId int 
AS
SELECT * FROM Books
WHERE CategoryId=@categoryId
GO


--------Q18.STORED PROCEDURE(With optional Peramiter)-------------------
CREATE PROC spCategoryWiseBook2
( @categoryId int = 1009 )
AS
SELECT * FROM Books
WHERE CategoryId=@categoryId
GO



---------Q19.Procedure with recompile-----------------------------------
CREATE PROC spCategoryWiseBook3
 @categoryId int 
 WITH RECOMPILE
AS
SELECT * FROM Books
WHERE CategoryId=@categoryId
GO



----------Q20.procedure with encryption------------------------------
CREATE PROC spCategoryWiseBook4
 @categoryId int 
 WITH ENCRYPTION
AS
SELECT * FROM Books
WHERE CategoryId=@categoryId
GO



------------Q21.Data insert through Procedure--------------------------------

CREATE PROC spDataInsertation
@authorId varchar(10),
@authorFName varchar(20),
@AuthorLName varchar(20)
AS
INSERT INTO Authors (AuthorId,AuthorFName,AuthorLName)
VALUES(@authorId,@authorFName,@AuthorLName)
GO


---------Q22.Data update through Procedure------------------------------------
CREATE PROC spAuthorDataUpdate
@authorId varchar(10),
@authorFName varchar(20),
@authorLName varchar(20)
AS
UPDATE Authors SET AuthorFName=@authorFName, AuthorLName= @authorLName
WHERE AuthorId=@authorId
GO



-----------Q23.Data Delete through Procedure---------------------------------
CREATE PROC spAuthorDataDelete
@authorId varchar(10)
AS
DELETE FROM Authors
WHERE AuthorId=@authorId
GO



-----------Q24.OUTPUT PROCEDURE-----------------------------------------------
CREATE PROC spBookAndAuthorName
@bookId int,
@bookName varchar(30) OUTPUT,
@authorName varchar(30) OUTPUT
AS
SELECT @bookName=BookName,
@authorName=a.AuthorFName+' '+a.AuthorLName  FROM Books AS b
JOIN Authors AS a ON b.AuthorId=a.AuthorId
WHERE BookId=@bookId
GO



---------Q25.ALTER PROCEDURE----------------------------------------------------
ALTER PROC spBookAndAuthorName
@bookId int,
@bookName varchar(30) OUTPUT
AS
SELECT @bookName=BookName FROM Books 
WHERE BookId=@bookId
GO



----------Q26.Procedure with error handle-----------------------------------------
CREATE PROC spAuthorDataInsertWithErrorHandle
@authorId varchar(10),
@authorFName varchar(20),
@authorLName varchar(20)
AS
BEGIN 
  BEGIN TRY 
		INSERT INTO Authors (AuthorId,AuthorFName,AuthorLName)
		VALUES(@authorId,@authorFName,@authorLName)
  END TRY
 BEGIN CATCH
   SELECT ERROR_MESSAGE() AS ErMsg,ERROR_LINE() AS ErLine,ERROR_NUMBER() AS ErNo,ERROR_SEVERITY() AS ErSeverity
 END CATCH
END
GO





------Q27.Data Modification and output return through Single Procedure(Insert,Update,DELETE,OUTPUT,RETURN using transaction)------

CREATE PROC spBookSelectInsertUpdateDeleteOutputReturn
@opType char(1),
@bookId int,
@bookName varchar(30),
@authorId varchar(10),
@categoryId int,
@totalCopies int,
@shelfLocation varchar(30) = NULL,
@authorName varchar(30) OUTPUT,
@Count int
AS
BEGIN

if @opType='S'
BEGIN 
SELECT * FROM Books
END

if @opType='I'
BEGIN 
  BEGIN TRY
	BEGIN TRAN
		INSERT INTO Books(BookId,BookName,AuthorId,CategoryId,TotalCopies,ShelfLocation)
		VALUES(@bookId,@bookName,@authorId,@categoryId,@totalCopies,@shelfLocation)
	COMMIT TRAN
  END TRY 
 BEGIN CATCH
	SELECT ERROR_MESSAGE() AS ErMsg,ERROR_LINE() AS ErLine,ERROR_NUMBER() AS ErNo,ERROR_SEVERITY() AS ErSeverity
	ROLLBACK TRANSACTION 
 END CATCH
END

if @opType='U'
BEGIN 
 BEGIN TRY 
	BEGIN TRAN
	   UPDATE Books SET BookName=@bookName,AuthorId=@authorId,CategoryId=@categoryId,
	   TotalCopies=@totalCopies,ShelfLocation=@shelfLocation
	   WHERE BookId=@bookId
	COMMIT TRAN
 END TRY

BEGIN CATCH
	SELECT ERROR_MESSAGE() AS ErMsg,ERROR_LINE() AS ErLine,ERROR_NUMBER() AS ErNo,ERROR_SEVERITY() AS ErSeverity
	ROLLBACK TRANSACTION 
END CATCH
END

if @opType='D'
BEGIN 
 BEGIN TRY 
	BEGIN TRAN
	   DELETE FROM Books WHERE BookId=@bookId
	COMMIT TRAN
 END TRY

 BEGIN CATCH
	SELECT ERROR_MESSAGE() AS ErMsg,ERROR_LINE() AS ErLine,ERROR_NUMBER() AS ErNo,ERROR_SEVERITY() AS ErSeverity
	ROLLBACK TRANSACTION 
 END CATCH
END

if @opType='O'
BEGIN 
  BEGIN TRY 
	BEGIN TRAN
	  SELECT @authorName=AuthorFName+' '+AuthorLName FROM Authors
	  WHERE AuthorId=@authorId
	COMMIT TRAN
  END TRY

 BEGIN CATCH
    SELECT ERROR_MESSAGE() AS ErMsg,ERROR_LINE() AS ErLine,ERROR_NUMBER() AS ErNo,ERROR_SEVERITY() AS ErSeverity
	ROLLBACK TRANSACTION 
 END CATCH
END

if @opType='R'
BEGIN 
  BEGIN TRY 
	BEGIN TRAN
	  SELECT @Count= COUNT(*) FROM Books 
	  WHERE CategoryId=@categoryId
	COMMIT TRAN
	RETURN @Count
  END TRY

 BEGIN CATCH
   SELECT ERROR_MESSAGE() AS ErMsg,ERROR_LINE() AS ErLine,ERROR_NUMBER() AS ErNo,ERROR_SEVERITY() AS ErSeverity
	ROLLBACK TRANSACTION 
 END CATCH
END
END
GO


---------Q28.DELETE PROCEDURE--------
DROP PROC spBookSelectInsertUpdateDeleteOutputReturn
GO


-------Q29.create index-------
CREATE nonclustered INDEX ix_Books_bookName
ON Books(BookName)




--------Q30.Delete Index-----
Drop Index ix_Books_bookName
ON  Books






------------Q31.TRIGGER(For/After trigger)------------
--Write a trigger to log all INSERT and DELETE operations on the BookIssue table into a BookIssueLog table.
 
-----------------Log Table create For trigger record----
CREATE TABLE BookIssueLog (
LogId INT IDENTITY(1,1) PRIMARY KEY,
IssueId INT,
MemberId VARCHAR(10),
BookId INT,
IssueDate DATE,
ReturnDeadLine DATE,
ReturnDate Date,
FinePolicyId int,
LogType varchar(15))
GO


CREATE TRIGGER trg_BookIssue_Insert_Delete
ON BookIssue
After INSERT,Delete
AS
BEGIN
    INSERT INTO BookIssueLog (IssueId, MemberId, BookId, IssueDate, ReturnDeadLine,
	ReturnDate,FinePolicyId,LogType)
    SELECT i.IssueId,i.MemberId,i.BookId,i.IssueDate,i.ReturnDeadLine,i.ReturnDate,i.FinePolicyId,'Inserted'
   FROM INSERTED AS i

    INSERT INTO BookIssueLog (IssueId, MemberId, BookId, IssueDate, ReturnDeadLine,
	ReturnDate,FinePolicyId,LogType)
    SELECT d.IssueId,d.MemberId,d.BookId,d.IssueDate,d.ReturnDeadLine,d.ReturnDate,d.FinePolicyId,'Deleted'
   FROM deleted AS d
END
GO




----------Q32.Instead Of trigger-----------
---Write an INSTEAD OF DELETE trigger to prevent deletion of book issue records where the book has not been returned.
CREATE TRIGGER trg_BookIssue_InsteadOfDelete
ON BookIssue
INSTEAD OF DELETE
AS
BEGIN
DELETE FROM BookIssue WHERE IssueId IN 
(SELECT d.IssueId FROM DELETED AS d WHERE d.ReturnDate IS NOT NULL);
END
GO



--------Q33.DELETE TRIGGER------------
DROP TRIGGER trg_BookIssue_InsteadOfDelete;


----------Q34.Create Sequence----
CREATE SEQUENCE Seq_BookIssue
START WITH 1000
INCREMENT BY 10
MINVALUE 1000 
MAXVALUE 99999
CYCLE 
CACHE 10
-----------Justify-------
--SELECT NEXT VALUE FOR Seq_BookIssue



-------Q35.Alter Sequence---
ALTER SEQUENCE Seq_BookIssue
INCREMENT BY 20
CACHE 15


------Q36.Deletes all records from the BookIssue table (Using Truncate)-------
Truncate table BookIssue



------------Q37.LOG In Create----------
CREATE LOGIN ArifHasan 
WITH PASSWORD = 'pt8806FG$B', 
DEFAULT_DATABASE = LibraryManagement
GO

-----------Q38ALTER LOG IN------------
ALTER LOGIN ArifHasan 
WITH PASSWORD = 'NewStrongP@ssword2026';
GO

------------Q39.DROP LOG IN----------
DROP LOGIN ArifHasan


-----------Q40.USER CREATE----------
CREATE USER ArifHasan FOR LOGIN ArifHasan
WITH DEFAULT_SCHEMA = dbo;
GO

----------Q41.Alter User -----------
ALTER USER ArifHasan WITH NAME = AsadAli 


-------Q42.DELETE USER---------
DROP USER AsadAli
GO


------Q43.Giving Permission to someone--------
GRANT INSERT, UPDATE, DELETE 
ON Books
TO AsadAli
GO

------Q44.Revoke Permission-------------------- 
REVOKE DELETE,Update
ON Books
FROM AsadAli
GO


