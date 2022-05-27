CREATE database restaurant;
use restaurant;

create Table Dish(DishNo int identity(1,1) primary key not null, DishName Varchar (200) not null, Rate Float not null);


insert into Dish values('Roti',20);
insert into Dish values('Rice',60);
insert into Dish values('Chapati',10);
insert into Dish values('ChikenThali',150);
insert into Dish values('ChikenTikka',170);
insert into Dish values('ChikenChilli',130);
insert into Dish values('FishThali',200);
insert into Dish values('VegThali',100);
insert into Dish values('ShahiPaneer',120);
insert into Dish values('PaneerTikka',150);
insert into Dish values('PaneerPalak',130);
insert into Dish values('FriedRice',130);
insert into Dish values('ChickenLoliipop',120);
insert into Dish values('ChickenBiryani',170);
insert into Dish values('VegBiryani',120);
insert into Dish values('ChickenHandi',350);


select *from Dish;

create table CustomorInfo(CustomorID int identity(1,1) primary key, CustName Varchar(200), MobileNo varchar(200));

create table DishInfo(LogID int identity(1,1) primary key, CustomorID int references CustomorInfo(CustomorID), DishNo int References Dish(DishNo), DishName varchar (200), Quantity int ,Rate float, Amount float);

create table Bill( Date date, BillNo int identity(1,1) primary Key, CustomorID int references CustomorInfo(CustomorID),CustName Varchar(200), MobileNo varchar(200), TableNo int, 
SubTotal float, Tax float ,TotalBill Float, PaymentMode Varchar(200));

SET IDENTITY_INSERT DishInfo ON

select *from Dish;

select *from DishInfo;
select *from Bill;
select *from CustomorInfo;


--delete from Bill where BillNo=5;
--delete from Dishinfo where LogID=33;
--delete from CustomorInfo where CustomorID=11;




--drop table Bill;
--drop table DishInfo;
--drop table CustomorInfo;
--drop table dish;

