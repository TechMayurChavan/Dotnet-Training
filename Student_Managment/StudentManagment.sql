create database StudentManagment;

use StudentManagment;

create table UserInfo(ID int primary key Identity(1,1),
UserID varchar(100), Mathematics float ,Science float,
Geography float, History float, Enterdate date);
 

 select *from UserInfo;