USE MASTER
if (select count(*) 
    from sys.databases where name = 'JobSearch') > 0
BEGIN
		DROP DATABASE JobSearch;
END

create database JobSearch
yolo
GO
USE JobSearch

exec sp_changedbowner 'sa'

create table Sources
(
SourceID int not null identity (1, 1),
SourceName nchar(100),
SourceType nchar(100) ,
SourceLink nchar(200),
Description nchar(1000) 
primary key (SourceID)

)

Create table BusinessType
(
BusinessType nchar(100) not null 
Primary key (BusinessType)
)


create table Companies
(
CompanyID int not null identity (1, 1),
CompanyName nchar(100) not null,
Address1 nchar(50) not null,
Address2 nchar(50) null,
City nchar(50) not null,
[State] nchar(50) not null,
ZIP nchar(20) not null,
Phone nchar(15) not null,
Fax nchar(15) null,
EMail nchar(50)  null,
Website nchar(100) null,
JobDescription nchar(1000) null,
BusinessType nchar(100)  null,
Agency bit not null,
ModifiedDate datetime DEFAULT GETDATE(),
primary key (CompanyID),
CONSTRAINT fk_BusinessType FOREIGN KEY (BusinessType)
 REFERENCES Businesstype(businesstype)
)

create INDEX IDX_Companies on COMPANIES(COMPANYID)
GO



create table Companies_1
(
CompanyID int not null identity (1, 1),
CompanyName nchar(100) not null,
Address1 nchar(50) not null,
Address2 nchar(50) null,
City nchar(50) not null,
[State] nchar(50) not null,
ZIP nchar(20) not null,
Phone nchar(15) not null,
Fax nchar(15) null,
EMail nchar(50) not null,
Website nchar(100) null,
Description nchar(1000) null,
BusinessType nchar(100) null,
Agency bit not null
primary key (CompanyID)
)

create table Contacts
(
ContactID int not null identity (1, 1),
CompanyID int  not null,
CourtesyTitle nchar(50) ,
ContactFirstName nchar(50) ,
ContactLastName nchar(50) ,
Title nchar(20),
Phone nchar(15) ,
Extension nchar(10),
Fax nchar(15) ,
EMail nchar(10) ,
Comments nchar(1000) ,
Active int ,
ModifiedDate datetime DEFAULT GETDATE(),
PRIMARY KEY (ContactID),
CONSTRAINT fk_CompanyID FOREIGN KEY (CompanyID)
 REFERENCES Companies(CompanyID)
)


CREATE INDEX IDX_CONTACTS on CONTACTS(CONTACTID)
GO

Create table Leads
(
LeadID int not null identity(1, 1),
RecordDate datetime DEFAULT GETDATE(),
JobTitle nchar(50) ,
[JobDescription] nchar(1000) ,
EmploymentType nchar(50)  
	CONSTRAINT CK_EmploymentType CHECK (EmploymentType IN ('Full Time', 'Part Ttime', 'Temporary')),
Location nchar(100) ,
Active bit CONSTRAINT DF_Active DEFAULT (1)  ,
CompanyID int foreign key references Companies(CompanyID) ,
AgencyID int foreign key references Companies_1(CompanyID) ,
ContactID int foreign key references Contacts(ContactID) ,
SourceID int foreign key references Sources(SourceID),
Selected nchar(20) ,
ModifiedDate datetime DEFAULT GETDATE(),
CONSTRAINT CK_ModifiedDate_NoFutureDates CHECK (ModifiedDate <= GETDATE()),
PRIMARY KEY (LeadID)

)

CREATE INDEX IDX_LEADS on LEADS(LEADID)
GO

create table Activities 
(
ActivityID int not null identity (1, 1),
LeadID int foreign key references leads(LeadID) ,
ActivityDate datetime DEFAULT GETDATE(),
ActivityType nchar(50) ,
ActivityDetails nchar(50),
Complete int ,
ReferenceLink nchar(255) ,
ModifiedDate datetime DEFAULT GETDATE(),
PRIMARY KEY (ActivityID)
)
GO
CREATE TRIGGER trgRecordModifyLeads
ON Leads
AFTER Insert, UPDATE
AS
BEGIN

	UPDATE		l
	SET			l.ModifiedDate = GETDATE()
	FROM		Leads l
	

END
GO


CREATE TRIGGER trgRecordModifyActivities
ON Activities
AFTER Insert, UPDATE
AS
BEGIN

	UPDATE		a
	SET			a.ModifiedDate = GETDATE() 
	FROM		Activities a
	

END
GO

CREATE INDEX IDX_ACTIVITIES on ACTIVITIES(ACTIVITYID)
GO
insert into BusinessType
(BusinessType)
values ('BusinessType'),
('Accounting'),
('Advertising/Marketing'),
('Agriculture'),
('Architecture'),
('Arts/Entertainment'),
('Aviation'),
('Beauty/Fitness'),
('Business Services'),
('Communications'),
('Computer/Hardware'),
('Computer/Services'),
('Computer/Software'),
('Computer/Training'),
('Construction'),
('Consulting'),
('Crafts/Hobbies'),
('Education'),
('Electrical'),
('Electronics'),
('Employment'),
('Engineering'),
('Environmental'),
('Fashion'),
('Financial'),
('Food/Beverage'),
('Government'),
('Health/Medicine'),
('Home & Garden'),
('Immigration'),
('Import/Export'),
('Industrial'),
('Industrial Medicine'),
('Information Services'),
('Insurance'),
('Internet'),
('Legal & Law'),
('Logistics'),
('Manufacturing'),
('Mapping/Surveying'),
('Marine/Maritime'),
('Motor Vehicle'),
('Multimedia'),
('Network Marketing'),
('News & Weather'),
('Non-Profit'),
('Petrochemical'),
('Pharmaceutical'),
('Printing/Publishing'),
('Real Estate'),
('Restaurants'),
('Restaurants Services'),
('Service Clubs'),
('Service Industry'),
('Shopping/Retail'),
('Spiritual/Religious'),
('Sports/Recreation'),
('Storage/Warehousing'),
('Technologies'),
('Transportation'),
('Travel'),
('Utilities'),
('Venture Capital'),
('Wholesale')



insert into Companies
(CompanyName, Address1, City, [State], ZIP, Phone, BusinessType, Agency)
values ('Mccall Technology Group', '238 NE 13th St,', 'Ocala', 'Florida','34471', '(352) 369-1600', 'Technologies', '0'),
('Moy Media', '36 SE Magnolia Exd Ste 200-300', 'Ocala', 'Florida','34471', '(352) 867-0221', 'Technologies', '0'),
('PNC Financial Services', ' 716 E Silver Springs Blvd', 'Ocala', 'Florida','34471', '(352) 732-5141', 'Technologies', '0')




insert into Sources
(SourceName, SourceType)
values
 ('Roddy Tatom', 'Friend'),
 ('Indeed', 'Wesbite')

insert into Contacts
(CompanyID,Title, ContactFirstName, ContactLastName, Phone, Active)
values
		 (1, 'Public Relations', 'Julia', 'Smith', '352-888-1212', 1),
		(2, 'Human-Resources', 'Alex', 'Brown', '352-838-1242', 1)

insert into Leads
(JobTitle, JobDescription, EmploymentType, Location, Active, CompanyID, ContactID, SourceID, Selected)

values
('Programming Assistant','Programming Websites and Databases','Full Time', 'Ocala', 1, 1, 1, 1, 'Undetermined'),
		('Website Developer','Developing Websites','Full Time', 'Ocala', 1, 2, 2, 2, 'Undetermined')

insert into Activities
(LeadID, ActivityType, ActivityDetails, Complete)
values 
(1, 'Application','Filled Out Application', 1),
(1, 'Interview','Interviewed with Julia', 1)

