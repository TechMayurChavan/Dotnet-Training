--Create a Stored Procedure that will perform an Insert Operation on Employee Table.
create proc sp_InsertEmployeeData_3
@EmpNo int, @EmpName varchar (200), @salary int, @Designation varchar (200), @DeptNo int, @Email varchar(100)
As
Begin
	Begin try
		Insert into Employee(EmpNo, EmpName, salary, Designation, DeptNo, Email )
		Values
			(@EmpNo, @EmpName, @salary, @Designation, @DeptNo, @Email )
	End try

	Begin Catch
	  -- Catch the exception if the DeptNo is alredy present
	 select ERROR_NUMBER() as Error_Number,
			 ERROR_MESSAGE() as Error_Message,
			 ERROR_SEVERITY() as Error_Severity

	End Catch
End;
go

Exec  sp_InsertEmployeeData_3 @EmpNo=22, @EmpName='Ashish', @salary=16000, @Designation=Engineer, @DeptNo=30, @Email='Ashish@msit.com';
Select * from Employee;
go;
drop procedure sp_InsertEmployeeData_3;

----------------------------------------------------------------------------------------------------------------------------

Go
-- USing Function
-- Syntax
	-- Create function [Name](PARAMETERS,,,,) returns [TYPE] As Beging ..... return [Parameter|LOCAL VARIABLE] End; 
create function ValidateData_1 (@EmpNo int, @EmpName varchar (200), @salary int, @Designation varchar (200), @DeptNo int, @Email varchar(100))
returns Varchar(100)
As
Begin
	-- declare a local variable
	declare @message varchar(100);
	If @EmpNo <=0 
		set @message = 'Make Sure that the Empno ,ust be a positive integer';

   else if(@salary <=0 )
        set @message = 'Make Sure that the salary ,ust be a positive integer';

	Else
		set @message = 'Data is validated successfully';	
	return @message;
End;
go
 --Note: Using the 'dbo' object to execute the Custom Function
 --This object will make the Custom Function as a Global Function

select dbo.ValidateData(22,'Ashish',16000,'Engineer',30,'Ashish@msit.com');

drop function ValidateData_1;

--------------------------------------------------------------------------------------------------------------------

Go
-- IF Conditoin (IF-Else)
create proc sp_InsertEmployeeData1
@EmpNo int, @EmpName varchar (200), @salary int, @Designation varchar (200), @DeptNo int, @Email varchar(100)
As
begin
  if(@EmpNo <= 0)
	select 'DeptNo Cannot be 0 or -ve';

  --else if(@EmpName != '^[a-zA-Z0-9]+$')
  --  select 'EmpName Must containing Characters';

  else if(@salary <=0)
    select 'salary Cannot be 0 or -ve';
 
  else
	Insert into Employee(EmpNo, EmpName, salary, Designation, DeptNo, Email )
		Values
			(@EmpNo, @EmpName, @salary, @Designation, @DeptNo, @Email )
End;


exec sp_InsertEmployeeData1   @EmpNo=122, @EmpName='Ashish', @salary=16000, @Designation=Engineer, @DeptNo=30, @Email='Ashish@msit.com';
go

Select * from Employee;
drop procedure sp_InsertEmployeeData1;

----------------------------------------------------------------------------------------------------------------------------


Go
create function  ValidateEmployeeData_3
(@EmpNo int, @salary int)
returns int
as
begin

       declare @result int
	   If @EmpNo <=0 
		set @result = 0;

   else if(@salary <=0 )
        set @result = 0;

	Else
		set @result = 1;
		
	return @result;
End;
----------------------------------------------------------------------------------------------------------------------------

Go
create Procedure sp_InsertEmployeeData_1
(@EmpNo int, @EmpName varchar (200), @salary int, @Designation varchar (200), @DeptNo int, @Email varchar(100))

as
begin   
         if dbo.ValidateEmployeeData_2(@EmpNo, @salary )=0
		    select 'entered data is not correct';
      else
       Insert into Employee(EmpNo, EmpName, salary, Designation, DeptNo, Email )
		Values
			(@EmpNo, @EmpName, @salary, @Designation, @DeptNo, @Email )


--declare @return_result1
select dbo. ValidateEmployeeData_2 (@EmpNo, @salary)
end;

Go
declare @return_result1 varchar
exec  @return_result1 = sp_InsertEmployeeData_1 @EmpNo=-125, @EmpName='Ashish', @salary=16000, @Designation=Engineer, @DeptNo=30, @Email='Ashish@msit.com';
               

---------------------------------------------------------------------------------------------------------------------------------
select *from Employee;
delete from Employee where EmpNo=124;
drop procedure sp_InsertEmployeeData_1;

--drop function ValidateEmployeeData_3;

Go
----------------------------------------------------------------------------------------------------------------------------

--Create a Stored Provcedure that will perform an Insert Operation on Employee Table. 
--But before Performing the insert operation, this SP Must call the ValidateData()
--function which will accept the Employee Row parameters and vbalidate it based on following conditions
--EmpNo Must be +ve integer
--EmpName Must containing Characters
--Salary Must be +Ve integer
--DeptNo Muset be present into Department table (Optional) The alidateData() function will return 0 is any of the record-value is invalid else will return 1. The SP will perform insert operation accordingly


create function  ValidateEmployeeDataNew
(@EmpNo int, @salary int, @EmpName varchar (200))
returns int
as 
begin
            declare @result int
			if @EmpNo<=0 OR @salary<=0 OR @EmpName not like '%[*a-zA-Z]%'
			     set @result =0;
		    
			Else
			    set @result=1;

				return @result;
End;
GO
--drop function ValidateEmployeeData_2;
---------------------------------------------------------------------------------------------------------------------------------

create proc sp_InsertEmployeeDataNew
(@EmpNo int, @EmpName varchar (200), @salary int, @Designation varchar (200), @DeptNo int, @Email varchar(100))
As 
Begin
     if dbo.ValidateEmployeeDataNew(@EmpNo, @salary, @EmpName)=0
	    select 'Enter data is in invalid format';

	else 
	     Insert into Employee(EmpNo, EmpName, salary, Designation, DeptNo, Email)
		Values
			(@EmpNo, @EmpName, @salary, @Designation, @DeptNo, @Email )
End;

Exec sp_InsertEmployeeDataNew @EmpNo=129, @EmpName='Manoj', @salary=16000, @Designation=Engineer, @DeptNo=30, @Email='Manoj@msit.com';
Exec sp_InsertEmployeeDataNew @EmpNo=-123, @EmpName='A9hish', @salary=14000, @Designation=Operator, @DeptNo=40, @Email='Ashish@msit.com';
Exec sp_InsertEmployeeDataNew @EmpNo=124, @EmpName='Kiran', @salary=11000, @Designation=Engineer, @DeptNo=30, @Email='Kiran@msit.com';
Exec sp_InsertEmployeeDataNew @EmpNo=125, @EmpName='Rajendra', @salary=18000,@Designation=Manager, @DeptNo=10,@Email='Rajendra@msit.com';
Exec sp_InsertEmployeeDataNew @EmpNo=126, @EmpName='Laxman', @salary=30000, @Designation=CEO,       @DeptNo=20, @Email='Laxman@msit.com';

Go
----------------------------------------------------------------------------------------------------------------------------------------

select *From Employee;

--drop function ValidateEmployeeData;
--drop proc sp_InsertEmployeeData;
delete from Employee where EmpNo=129;
	 select EmpName from Employee where EmpName  like  '%[*a-zA-Z]%';