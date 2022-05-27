create database Company;
use Company;

create table PersonalInfo(
PersonId int identity(1,1) primary key not null,
FullName varchar(200) not null,
AddressLine1  varchar(400) not null,
City varchar(200) not null,
PinCode varchar(100) not null,
ContactNo varchar(200) not null,
Email varchar(200) not null,
ImageFilePath varchar(200),
ProfileFilePath varchar(200));

alter table PersonalInfo add Status varchar(50);
alter table PersonalInfo add UserID varchar(100);


create table EducationalInfo(
EducationID int identity(1,1) primary key not null,
PersonId int  references PersonalInfo(PersonId) not null, 
SSCBoardName varchar(200) not null,
SSCPercentage float not null,
SSCPassingDate int,
HSCBoardName varchar(200),
HSCPercentage float,
HSCPassingDate int ,
DiplomaBoardName varchar(200),
DiplomaPercentage float,
DiplomaPassingDate int,
DegreeUniversityName varchar(200),
DegreePercentage float,
DegreeType varchar(200),
DegreePassingDate int,
MastersUniversityName varchar(200),
MastersPercentage float,
MastersPassingDate int,
HighestQuaification varchar(200));


create table ProfessionalInfo(
ProfessionalId int identity(1,1) primary key not null,
PersonId int  references PersonalInfo(PersonId) not null,
WorkExperience varchar(400),
Companies varchar(400),
ProjectInfo varchar(500) );

select *from PersonalInfo;
select *from EducationalInfo;
select *from ProfessionalInfo;
select *from Employeer;


create table Employeer(
EmployeerId int Identity(1,1) primary key not null,
EmployeerName varchar(200),
ContactNo Varchar (200),
Email varchar(200),
ImagePath varchar(200),
OrgName varchar(200),
OrgType varchar(200),
organizationInfo varchar(400),
OrgAddress varchar(200),
District varchar (200),
OrgState varchar(200),
OrgContact varchar(200));

alter table Employeer add UserID varchar(100);

select *from Employeer
--drop table Employeer;

--public int EmployerId { get; set; }
--        public string EmployerName { get; set; }
--        public string Designation { get; set; }
--        public string Contact { get; set; }
--        public string Email { get; set; }
--        public string ImagePath { get; set; }
--        public string Address { get; set; }
--        public string Info { get; set; }
--        public string OrgName { get; set; }
--        public string OrgType { get; set; }
--        public string Sector { get; set; }
--        public string OrgAddress { get; set; }
--        public string State { get; set; }
--        public string District { get; set; }
--        public string OrgContact { get; set; }
--        public string OrgEmail { get; set; }
--        public string WebAddress { get; set; }
















--drop table PersonalInfo;
--drop table EducationalInfo;
--drop table ProfessionalInfo;



--PErsonal: FullNAme, Address, COntact Info, EMail
--Education: SSC, HSC, Degree, MAsters
--Professional Info: e.g. Work Experience, Companies, Projects, etc.
--Image of the Job Seeker and also Upload the Resume (PDF, WOrd only)
