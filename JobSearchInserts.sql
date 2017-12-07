use JobSearch

insert into Companies
(CompanyName, Address1, Address2,city, [State], ZIP, Phone, Website, JobDescription, BusinessType, Agency)
values ('Kavaliro', '12001 Research Pkwy', '#344', 'Orlando', 'Florida', '32826', '(407) 243-6006', 'https://kavaliro.com/', 'Java Middle Tier/Back-End Developer', 'Technologies', 0)

insert into companies
(CompanyName, Address1,Address2, City, [State], ZIP, Phone, Website, JobDescription, BusinessType, Agency)
values ('Florida Dept of Children and Families Careers', '1389 W US Hwy 90', '#110', 'Lake City', 'Florida', '32055', '(866) 762-2237',
'http://www.myflorida.com/accessflorida/', 'Computer Programmer Analyst II', 'Technologies', 0)
		


alter table contacts
alter column Email nchar(50)


insert into Contacts
(CompanyID, CourtesyTitle, ContactFirstName, ContactLastName, Title, Phone, Extension, Fax, EMail, Comments, Active)
values (5, 'Mrs.', 'Pat', 'Zanaro', 'Pogram Engineer', '352-929-0147', '9923', '352-929-9924', 'patzanaro22@yahoo.com', 'Very nice lady', 1)


insert into Sources
(SourceName, SourceType, SourceLink, [Description])
values ('Dice', 'Website', 'https://www.dice.com/jobs/detail/Computer-Programmer-Analyst-II-Florida-Dept-of-Children-and-Families-Gainesville-FL-32641/10211388/60006898?icid=sr1-1p&q=programer&l=Gainesville,%20FL', 'Computer Programmer Analyst II')


select * from Sources







insert into Contacts 
(CompanyID, CourtesyTitle, ContactFirstName, ContactLastName, Title, Phone, Extension, EMail,  Comments, Active)
values (5, 'Ms.', 'Sandy', 'Hartfield', 'Public Relations', '352-302-2212', '9920', 'hartfields@floridadcf.com', 'Strict', 1)

select * from Contacts
alter table contacts
alter column title nchar(50)
insert into Contacts
(CompanyID, CourtesyTitle, ContactFirstName, ContactLastName, Title, Phone, Extension, Fax, EMail, Comments, Active)
values 
(3, 'Mr.', 'Martin', 'Perez', 'Public Relations Coordinator', '352-908-5579','1210', '352-908-5578', 'perezm@gmail.com', 'Mean', 0),
		(4, 'Mr.', 'Stephano', 'Vadosoki', 'CEO', '352-405-1912', '500', '352-305-1102', 'moneyman12@moneyman.com', 'Cool Guy', 1)
insert into sources
		(SourceName, SourceType, SourceLink, [Description])
values ('Indeed', 'Website', 'https://sjobs.brassring.com/TGnewUI/Search/home/HomeWithPreLoad?PageType=JobDetails&noback=0&partnerid=15783&siteid=5130&jobid=1396917#jobDetails=1396917_5130', 'Job'),
('Indeed', 'Website', 'http://jobs.kavaliro.com/index.smpl?arg=jb_details&POST_ID=3787050&rid=Indeed', 'Job')

insert into Leads
(JobTitle, JobDescription,EmploymentType, Location, Active, CompanyID, ContactID, SourceID, Selected)
values ('Computer Programmer Analyst II', 'The Office of Information Technology Services within the Department of Children and Families is seeking an individual to serve in a full-time position as an Application Systems Programmer. This position will assist with the development of web applications that support the departments executive and administrative management offices and programs. ',
'Full Time', 'Gainesville FL', 1, 5, 4, 3, 'Undetermined')
insert into Leads
(JobTitle, JobDescription,EmploymentType, Location, Active, CompanyID, ContactID, SourceID, Selected)
values ('Branch & Business Center Manager (MLO)', 'Manages and leads priorities through planning and execution to drive all aspects of branch performance including growth activities for outside business development. Executes relationship management activities with new and/or existing consumer and business clients to grow sales, revenue and market share with relevant sales goals. Sources and fulfills relationship retention through the entire life cycle. Leads and coaches a high performing team that drives acquisition of growth, mitigates risk, develops and maintains collaborative eco-system partnerships and promotes employee engagement and positive consumer/business experiences.',
'Full Time', 'Gainesville FL', 0, 3, 5, 4, 'Undetermined'),

 ('Engineering Technologist II', 'Kavaliro',
'Full Time', 'Gainesville FL', 1, 4, 6, 5, 'Undetermined')



insert into Activities
(LeadID, ActivityType, ActivityDetails, Complete)
values (3, 'Application', 'Applied via Electronic Appliction', 1)

insert into Activities
(LeadID, ActivityType, ActivityDetails, Complete)
values (3, 'Interview', 'Interviewed with Sandy', 1)



select * from Contacts