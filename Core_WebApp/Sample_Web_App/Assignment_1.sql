-- Create Database
Create Database Enterprise1;

-- Use the database so that all operations will be in that database
Use Enterprise1;

--creat table
create table Employee(EmpNo int primary key,
EmpName varchar (200) not null,salary int not null,
Designation varchar (200) not null,
DeptNo int not null  References Department (DeptNo), Email varchar(100) not null);

Alter Table Employee 
	Add Tax float not null default 0;

select *from Employee;

insert into Employee values (101, 'Mayur', 14000, 'Manager', 10,'Mayur@msit.com');
insert into Employee values (102, 'Anand', 20000, 'CEO', 20,'Anand@msit.com');
insert into Employee values (103, 'Sumit', 13000, 'Engineer', 30,'Sumit@msit.com');
insert into Employee values (104, 'Karan', 12000, 'Operator', 40,'Karan@msit.com');
insert into Employee values (105, 'Ram', 10000, 'Manager', 10,'Ram@msit.com');
insert into Employee values (106, 'Laxman', 23000, 'CEO', 20,'Laxman@msit.com');
insert into Employee values (107, 'Anket', 16000, 'Engineer', 30,'Anket@msit.com');
insert into Employee values (108, 'Manoj', 11000, 'Operator', 40,'Manoj@msit.com');
insert into Employee values (109, 'Sam', 23000, 'Manager', 10,'Sam@msit.com');
insert into Employee values (110, 'Tejas', 30000, 'Manager', 10,'Tejas@msit.com');
insert into Employee values (111, 'Raja', 15000, 'Operator', 40,'Raja@msit.com');
insert into Employee values (112, 'Raman', 40000, 'Engineer', 30,'Raman@msit.com');
insert into Employee values (113, 'Aniket', 19000, 'Manager', 10,'Aniket@msit.com');
insert into Employee values (114, 'Prem', 10000, 'Engineer', 30,'Prem@msit.com');
insert into Employee values (115, 'Ratan', 18000, 'Manager', 10,'Ratan@msit.com');
insert into Employee values (116, 'Karam', 13000, 'Operator', 40,'Karam@msit.com');
insert into Employee values (117, 'Suman', 21000, 'Manager', 10,'Suman@msit.com');
insert into Employee values (118, 'Suyog', 50000, 'CEO', 20,'Suyog@msit.com');
insert into Employee values (119, 'Yash', 25000, 'Operator', 40,'Yash@msit.com');
insert into Employee values (120, 'Sasi', 16000, 'Engineer', 30,'Sasi@msit.com');

select *from Employee;
delete Employee where EmpNo=133;

--1.Select Second Max Salary Per DeptNo
select DeptNo, max(salary) as Salary  from Employee  where Salary < (Select max(Salary) from Employee ) Group by DeptNo;

--2.Select Max salary for each designation
select Designation, Max(salary) as Salary from Employee Group by Designation;

--3. Select Second Max Salary for Each Designation
select Designation, max(salary) as Salary  from Employee  where Salary < (Select max(Salary) from Employee ) Group by Designation;


--4.Create a Store Procedure that will insert row in Employee Table
Go
Create proc sp_InsertNewEmployee
@EmpNo int, @EmpName varchar (100), @Designation varchar(100), @salary int,@DeptNo int,@Email varchar (100)
As
Begin
  -- Always Specify columns of which values are inserted	 	
  Insert into Employee (EmpNo,EmpName, Designation, salary,DeptNo,Email)
  Values
    -- Pass Parameters
	(@EmpNo, @EmpName, @Designation,@salary,@DeptNo,@Email);
End;
Go;
-- Execute Store Procedure
Exec sp_InsertNewEmployee @EmpNo=122, @EmpName='Sudhir', @Designation='Manager', @salary=20000, @DeptNo=10,@Email='Sudhir@msit.com';
Go

select *from Employee;


--Table 2
Create Table Department (
  DeptNo int Primary Key,
  DeptName varchar(100) not null,
  Location varchar(100),
  Capacity int not null
);
insert into Department Values
(
  10, 'IT', 'Pune', 1000
);
insert into Department Values
(
  20, 'HR', 'Thane', 25
);
insert into Department Values
(
  30, 'SL', 'Mumbai', 45
);
insert into Department Values
(
  40, 'AC', 'Chennai', 18
);

select *from Department;

--drop table Department;
--delete Department where DeptNo=100;

--5.Create Strore Proc (SP) that will return Max Salary per DeptName
--Use Group By
Go
create proc sp_MaxSalaryByDeptName_1
as
Begin
    select DeptName, Max(Salary) as Salary
from Employee, Department -- Join
Where Employee.DeptNo = Department.DeptNo
Group by (Department.DeptName) -- Group By
Order By DeptName Desc -- Order by
end;

exec sp_MaxSalaryByDeptName_1;
Go

--  select EmpNo,EmpName,Designation,salary,Email 
--from Employee, Department -- Join
--Where Employee.DeptNo = Department.DeptNo
--Group by (Department.DeptName) -- Group By
--Order By DeptName Desc -- Order by




insert into Department Values
(
  90, 'IT', 'Nashik', 500
);
insert into Department Values
(
  100, 'HR', 'Mumbai', 200
);
insert into Department Values
(
  70, 'SL', 'Raigad', 300
);

select *from Department;
select *from Employee;

delete Department where DeptNo=123;
delete Employee where EmpNo=122;


create table UserInfo(UserID int Identity(1,1) primary key, UserName varchar(200),Password varchar(200));

insert into UserInfo values('Mayur','Mayur123');
insert into UserInfo values('Manoj','man789');
insert into UserInfo values('Karan','Karan67');
insert into UserInfo values('Ram','Ram@345');

select *from UserInfo;

select *from Employee;
select *from LogTable;
select *from ExceptionLogTable;


create table LogTable(
RequestId int Identity(1,1) primary key,
RequestDateTime datetime,
ControllerName varchar(50),
ActionName varchar(50),
ExecutionCompletionTime varchar(50)
);

create table ExceptionLogTable(
RequestId int Identity(1,1) primary key,
RequestDateTime datetime,
ControllerName varchar(50),
ActionName varchar(50),
ExecutionCompletionTime varchar(50),
ExceptionType varchar(200),
ExceptionMessage varchar(200)
);



