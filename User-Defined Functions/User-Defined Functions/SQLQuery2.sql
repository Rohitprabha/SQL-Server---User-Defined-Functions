--using scalar function
SELECT dbo.CalculateAge('12/25/1997') as Age
select StdID,FirstName,DateOfBirth, dbo.CalculateAge(DateOfBirth) as Age from Student
select StdID,FirstName,DateOfBirth, dbo.CalculateAge(DateOfBirth) as Age from Student where dbo.CalculateAge(DateOfBirth)>25

SP_helptext CalculateAge			-- text of CalulateAge function

--using STORED PROCEDURE
EXECUTE spAge '12/25/1997'		--we can't use SP in select and Where clause
select StdID,FirstName,DateOfBirth, dbo.spAge(DateOfBirth) as Age from Student			--error

--using Inline Table Valued Functions
select * from fn_EmployeeByDepartment('IT')
select * from fn_EmployeeByDepartment('IT') where ID=1
update fn_EmployeeByDepartment('IT') set Name='Param' where ID=5			--update possible

select ID,Name,DepartmentName,salary from fn_EmployeeByDepartment('IT') Emp				--used in Joins
join Department1 Dept on Emp.Department=Dept.DepartmentName

--using multi-statement Table-valued Functions
select * from fn_MSTVF_GetEmployees()
update fn_MSTVF_GetEmployees() set Name='Rohit' where ID=1					--error cannot be modified