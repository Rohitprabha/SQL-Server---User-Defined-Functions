--scalar functions

CREATE FUNCTION CalculateAge(@DOB Date)
RETURNS INT
BEGIN
DECLARE @AGE INT
SET @AGE = DATEDIFF(YEAR, @DOB, GETDATE())-
		CASE
			WHEN (MONTH(@DOB) > MONTH(GETDATE())) OR
				(MONTH(@DOB) = MONTH(GETDATE()) AND DAY(@DOB) > DAY(GETDATE()))
			THEN 1
			ELSE 0
		END
RETURN @AGE
END

--STORED PROCEDURE FOR ABOVE CALCULATEAGE

CREATE PROC spAge
@DOB Date
AS
BEGIN
DECLARE @AGE INT
SET @AGE = DATEDIFF(YEAR, @DOB, GETDATE())-
		CASE
			WHEN (MONTH(@DOB) > MONTH(GETDATE())) OR
				(MONTH(@DOB) = MONTH(GETDATE()) AND DAY(@DOB) > DAY(GETDATE()))
			THEN 1
			ELSE 0
		END
SELECT @AGE
END

--Inline Table Valued Functions

CREATE FUNCTION fn_EmployeeByDepartment(@dept nvarchar(10))
returns TABLE
AS
RETURN (select ID,Name,Department,Salary from Employee1 where Department=@dept)

--multi-statement Table-valued Functions
CREATE FUNCTION fn_MSTVF_GetEmployees()
RETURNS @Table Table (ID int, Name nvarchar(20), Salary int)
as
Begin
	insert into @Table
	select ID,Name,Salary from Employee1
	Return
End