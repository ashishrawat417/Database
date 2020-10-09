drop table MetabolicCategory cascade constraints;
drop table FamilyDoc cascade constraints;
drop table MedicalPractitioner cascade constraints;
drop table Naturopath cascade constraints;
drop table RelevantCondition cascade constraints;
drop table MedicalCondition cascade constraints;
drop table Habit cascade constraints;
drop table Patient cascade constraints;
drop table MetabolicFunction cascade constraints;
drop table PatientMetabolic cascade constraints;
drop table Visit cascade constraints;
drop table PatientPractioner cascade constraints;
drop table PatientRelCon cascade constraints;
drop table PatientHabit cascade constraints;
drop table PatientMedCon cascade constraints;
drop table RelConDetail cascade constraints;

drop sequence categorySequence;
drop sequence gpSequence;
drop sequence praSequence;
drop sequence npSequence;
drop sequence rcSequence;
drop sequence mcSequence;
drop sequence habitSequence;
drop sequence patientSequence;
drop sequence  functionSequence;
drop sequence visitSequence;

purge recyclebin;

Create table MetabolicCategory(
CategoryNo		varchar2(10)	not null,
Name			varchar2(20),
Primary key(categoryNo));

Create table FamilyDoc(
GPNo		varchar2(10)	not null,
name			varchar2(20),
contactNo		varchar2(10),
primary key(GPNo));

create table MedicalPractitioner(
practionerNo		varchar2(10)	not null,
name			varchar2(20),
contactNo		varchar2(10),
speciality		varchar2(20),
primary key(practionerNo));

create table Naturopath(
naturopathNo		varchar2(10)	not null,
name			varchar2(20),
contactNo		varchar2(10),
officeStartTime		date,
officeEndTime		date,
emailAddress		varchar2(30),
primary key(naturopathNo));

create table RelevantCondition(
conditionId		varchar2(10)	not null,
name			varchar2(20),
primary key(conditionId));

create table MedicalCondition(
conditionId		varchar2(10)	not null,
name			varchar2(30),
primary key(conditionId));

create table Habit(
conditionId		varchar2(10)	not null,
name			varchar2(20),
primary key(conditionId));

Create table Patient(
patientId		varchar2(10)	not null,
name			varchar2(20),
DOB				date,
gender			char(1)		check(gender IN('m','M','f','F')),
Address			varchar2(50),
state			varchar2(10),
Postcode		varchar2(10),
homePhone		varchar2(10),
businessPhone		varchar2(10),
maritalStatus	CHAR(1) 	CHECK(maritalStatus IN('n','N','Y','y')),
occupation		varchar2(15),
duration		number,
unit			varchar2(10),
race			varchar2(20),
registrationDate date,
GPNo			varchar2(10),
naturopathNo		varchar2(10),
primary key(patientId),
foreign key(GPNo) references FamilyDoc(GPNo),
foreign key(naturopathNo) references Naturopath(naturopathNo)
);

create table MetabolicFunction(
functionNo		varchar2(10)	not null,
name			varchar2(50),
categoryNo		varchar2(10),
primary key(functionNo),
foreign key(categoryNo) references MetabolicCategory(categoryNo));

create table PatientMetabolic(
patientId		varchar2(10)	not null,
functionNo		varchar2(10)	not null,
score			number,
primary key(patientId, functionNo),
foreign key(patientId) references Patient(patientId),
foreign key(functionNo) references MetabolicFunction(functionNo));

create table Visit(
visitNo			varchar2(10)	not null,
visitDate			date,
time			date,
amountPaid		number(10,2),
receiptNo		varchar2(15),
service			varchar2(100),
medication		varchar2(30),
chiefComplaints	varchar2(50),
patientId		varchar2(10),
primary key(visitNo),
foreign key(patientId) references Patient(patientId));

create table PatientPractioner(
patientId		varchar2(10)	not null,
practionerNo	varchar2(10)	not null,
primary key(patientId, practionerNo),
foreign key(patientId) references Patient(patientId),
foreign key(practionerNo) references MedicalPractitioner(practionerNo)) ;

create table PatientRelCon(
patientId		varchar2(10)	not null,
conditionId		varchar2(10)	not null,
notes			varchar2(50),
primary key(patientId, conditionId),
foreign key(patientId) references Patient(patientId),
foreign key(conditionId) references RelevantCondition(conditionId));

create table PatientHabit(
patientId		varchar2(10)	not null,
conditionId		varchar2(10)	not null,
year			number,
average		number,
unit		varchar2(10),
notes			varchar2(50),
primary key(patientId, conditionId),
foreign key(patientId) references Patient(patientId),
foreign key(conditionId) references Habit(conditionId));

Create table PatientMedCon(
patientId		varchar2(10)		not null,
conditionId		varchar2(10)		not null,
notes			varchar2(50),
primary key(patientId, conditionId),
foreign key(patientId) references Patient(patientId),
foreign key(conditionId) references MedicalCondition(conditionId));

create table RelConDetail(
patientId		varchar2(10)	not null,
conditionId		varchar2(10)	not null,
specify		varchar2(20)	not null,
primary key(patientId, conditionId, specify),
foreign  key(patientId, conditionId) references PatientRelCon(patientId, conditionId));


create sequence categorySequence start with 1 increment by 1;
create sequence gpSequence start with 1 increment by 1;
create sequence praSequence start with 1 increment by 1;
create sequence npSequence start with 1 increment by 1;
create sequence rcSequence start with 1 increment by 1;
create sequence mcSequence start with 1 increment by 1;
create sequence habitSequence start with 1 increment by 1;
create sequence patientSequence start with 1 increment by 1;
create sequence functionSequence start with 1 increment by 1;
create sequence visitSequence start with 1 increment by 1;

---------------------Insert Cagegory Table------------------------
insert into MetabolicCategory
values
('Cat'||categorySequence.nextVal,'Digestive Tract');

insert into MetabolicCategory
values
('Cat'||categorySequence.nextVal,'Ears');

insert into MetabolicCategory
values
('Cat'||categorySequence.nextVal,'Emotions');

insert into MetabolicCategory
values
('Cat'||categorySequence.nextVal,'Energy/Activity');

insert into MetabolicCategory
values
('Cat'||categorySequence.nextVal,'Eyes');

insert into MetabolicCategory
values
('Cat'||categorySequence.nextVal,'Head');

insert into MetabolicCategory
values
('Cat'||categorySequence.nextVal,'Heart');

insert into MetabolicCategory
values
('Cat'||categorySequence.nextVal,'Joints/Muscles');

---------------------Insert Family Doc Table-----------------------
insert into FamilyDoc
 values
('GP'||gpSequence.nextval,'Bryan Singer','93821837');

insert into FamilyDoc
 values
('GP'||gpSequence.nextval,'Hugh Laurie','94837244');

insert into FamilyDoc
 values
('GP'||gpSequence.nextval,'Robert Sean Leonard','24857323');

insert into FamilyDoc
 values
('GP'||gpSequence.nextval,'Lisa Edelstein','57383443');

insert into FamilyDoc
 values
('GP'||gpSequence.nextval,'Lisa Cuddy','98221124');

insert into FamilyDoc
 values
('GP'||gpSequence.nextval,'Charlie Eppes','85493234');

insert into FamilyDoc
 values
('GP'||gpSequence.nextval,'Robert Chase','93747362');

insert into FamilyDoc
 values
('GP'||gpSequence.nextval,'Jesse Spencer','98234532');

---------------------InsertPractioner Table-----------------------
insert into MedicalPractitioner
 values
('Pra'||praSequence.nextval,'Omar Epps','93953343','Immunology');

insert into MedicalPractitioner
 values
('Pra'||praSequence.nextval,'Eric Foreman','35495322','Pulmonology');

insert into MedicalPractitioner
 values
('Pra'||praSequence.nextval,'Jennifer Morrison','34354646','Immunology');

insert into MedicalPractitioner
 values
('Pra'||praSequence.nextval,'Jennifer Morrison','94837453','Dentistry');

insert into MedicalPractitioner
 values
('Pra'||praSequence.nextval,'Lawrence Kutner','293584521','Pulmonology');

insert into MedicalPractitioner
 values
('Pra'||praSequence.nextval,'Chris Taub','93545423','Obstetrics');

insert into MedicalPractitioner
 values
('Pra'||praSequence.nextval,'Remy Hadly','93434332','Obstetrics');

insert into MedicalPractitioner
 values
('Pra'||praSequence.nextval,'Remy Taub','93994332','Blood Analysis');

insert into MedicalPractitioner
 values
('Pra'||praSequence.nextval,'Jennifer Taub','9334332','Blood Analysis');

---------------------InsertNaturopath Table------------------------
insert into Naturopath
 values
('NP'||npSequence.nextval,'James Wilson','93853535',to_date('08:00','HH24:MI'),to_date('16:00','HH24:MI'),'James Wilson0@naturopath.com');

insert into Naturopath
 values
('NP'||npSequence.nextval,'Olivia Wilde','65365353',to_date('08:00','HH24:MI'),to_date('16:00','HH24:MI'),'Olivia Wilde1@naturopath.com');

insert into Naturopath
 values
('NP'||npSequence.nextval,'Peter Jacobson','84636341',to_date('08:00','HH24:MI'),to_date('16:00','HH24:MI'),'Peter Jacobson2@naturopath.com');

insert into Naturopath
 values
('NP'||npSequence.nextval,'Kal Penn','34353567',to_date('08:00','HH24:MI'),to_date('16:00','HH24:MI'),'Kal Penn3@naturopath.com');

insert into Naturopath
 values
('NP'||npSequence.nextval,'David Shore','93566333',to_date('08:00','HH24:MI'),to_date('16:00','HH24:MI'),'David Shore4@naturopath.com');

insert into Naturopath
 values
('NP'||npSequence.nextval,'Paul Attanasio','93555632',to_date('08:00','HH24:MI'),to_date('16:00','HH24:MI'),'Paul Attanasio5@naturopath.com');

insert into Naturopath
 values
('NP'||npSequence.nextval,'Katie Jacobs','93694323',to_date('16:00','HH24:MI'), to_date('22:00','HH24:MI'),'Katie Jacobs6@naturopath.com');

insert into Naturopath
 values
('NP'||npSequence.nextval,'Gail Berman','93857322',to_date('16:00','HH24:MI'), to_date('22:00','HH24:MI'),'Gail Berman7@naturopath.com');

---------------------Insert RelevantCondition Table----------------
insert into RelevantCondition
 values
('RC'||rcSequence.nextval,'Allergy');

insert into RelevantCondition
 values
('RC'||rcSequence.nextval,'artivicial implants');

insert into RelevantCondition
 values
('RC'||rcSequence.nextval,'Hospitalized');

insert into RelevantCondition
 values
('RC'||rcSequence.nextval,'Under medical care');

---------------------Insert MedicalCondition Table------------------
insert into MedicalCondition
 values
('MC'||mcSequence.nextval,'Asthma');

insert into MedicalCondition
 values
('MC'||mcSequence.nextval,'Arthritis');

insert into MedicalCondition
 values
('MC'||mcSequence.nextval,'Diabetes');

insert into MedicalCondition
 values
('MC'||mcSequence.nextval,'Epilepsy');

insert into MedicalCondition
 values
('MC'||mcSequence.nextval,'Excessive Bleeding');

insert into MedicalCondition
 values
('MC'||mcSequence.nextval,'Glandular Fever');

insert into MedicalCondition
 values
('MC'||mcSequence.nextval,'Heart Ailment');

insert into MedicalCondition
 values
('MC'||mcSequence.nextval,'High Blood Pressure');

insert into MedicalCondition
 values
('MC'||mcSequence.nextval,'Kidney Disease');

insert into MedicalCondition
 values
('MC'||mcSequence.nextval,'Jaundice/Liver Disease');

insert into MedicalCondition
 values
('MC'||mcSequence.nextval,'Rheumatic Fever');

insert into MedicalCondition
 values
('MC'||mcSequence.nextval,'Pregnancy');

---------------------Insert Habit Table------------------------------
insert into Habit
 values
('H'||habitSequence.nextval,'Smoking');

insert into Habit
 values
('H'||habitSequence.nextval,'Drinking');

insert into Habit
 values
('H'||habitSequence.nextval,'Physical exercise');

---------------------Insert Patient Table----------------------------
insert into Patient
 values
('P'||patientSequence.nextval,'Chandler Bing',to_date('21-12-1972','dd-mm-yyyy'),'F','corner Hutton Collingwood Streets Osborne','ACT','3066','98354544','98354244','y','Student',8,'month','African American',to_date('21-01-2012','dd-mm-yyyy'),'GP5','NP6');

insert into Patient
 values
('P'||patientSequence.nextval,'Monica Geller',to_date('03-11-1956','dd-mm-yyyy'),'F','Down St Collingwood','TAS','6017','43556667','47556667','n','Teacher',1,'year','Caucasian',to_date('11-02-2012','dd-mm-yyyy'),'GP5','NP5');

insert into Patient
 values
('P'||patientSequence.nextval,'Rachel Green',to_date('20-10-1982','dd-mm-yyyy'),'M','corner Hutton Collingwood Streets Osborne','TAS','6019','74363632','79363632','n','Policeman',2,'month','African American',to_date('05-03-2012','dd-mm-yyyy'),'GP2','NP3');

insert into Patient
 values
('P'||patientSequence.nextval,'Ross Geller',to_date('01-02-1967','dd-mm-yyyy'),'M','30 Barnes Way','ACT','3066','95735735','99735735','n','Teacher',18,'year','French',to_date('11-01-2012','dd-mm-yyyy'),'GP1','NP2');

insert into Patient
 values
('P'||patientSequence.nextval,'Phoebe Buffay',to_date('11-06-1979','dd-mm-yyyy'),'F','23 Ma labar','ACT','6018','34567773','94567773','y','Policeman',5,'month','Hispanic',to_date('11-02-2012','dd-mm-yyyy'),'GP6','NP2');

insert into Patient
 values
('P'||patientSequence.nextval,'Joey Tribbiani',to_date('29-06-1976','dd-mm-yyyy'),'M','corner Hutton Collingwood Streets Osborne','TAS','6017','93853533','73853533','y','Student',10,'year','French',to_date('06-01-2012','dd-mm-yyyy'),'GP2','NP8');

insert into Patient
 values
('P'||patientSequence.nextval,'Jennifer Aniston',to_date('03-04-1969','dd-mm-yyyy'),'M','23 Ma labar','WA','6017','24737353','94737353','y','Businessman',7,'year','French',to_date('11-03-2012','dd-mm-yyyy'),'GP2','NP5');

insert into Patient
 values
('P'||patientSequence.nextval,'Courteney Arquette',to_date('14-02-1988','dd-mm-yyyy'),'M','23 Ma labar','WA','6019','39343523','69343523','n','Teacher',11,'year','Caucasian',to_date('11-04-2012','dd-mm-yyyy'),'GP2','NP7');

insert into Patient
 values
('P'||patientSequence.nextval,'Lisa Kudrow',to_date('04-10-1983','dd-mm-yyyy'),'F','30 Barnes Way','TAS','6017','25857375','85857375','y','Policeman',4,'month','African American',to_date('11-05-2012','dd-mm-yyyy'),'GP5','NP2');

insert into Patient
 values
('P'||patientSequence.nextval,'Matt LeBlanc',to_date('23-07-1955','dd-mm-yyyy'),'M','30 Barnes Way','ACT','3066','95854757','65854757','y','Chief',9,'year','Italian',to_date('06-01-2013','dd-mm-yyyy'),'GP2','NP1');

insert into Patient
 values
('P'||patientSequence.nextval,'Matthew Perry',to_date('21-12-1972','dd-mm-yyyy'),'M','Down St Collingwood','NSW','6019','95485453','45485453','y','Policeman',1,'month','Hispanic',to_date('11-02-2012','dd-mm-yyyy'),'GP4','NP8');

insert into Patient
 values
('P'||patientSequence.nextval,'David Schwimmer',to_date('13-01-1985','dd-mm-yyyy'),'F','30 Barnes Way','VIC','6018','83537543','83537543','y','Cleaner',8,'month','French',to_date('21-02-2012','dd-mm-yyyy'),'GP1','NP3');

insert into Patient
 values
('P'||patientSequence.nextval,'Judy White',to_date('13-10-2009','dd-mm-yyyy'),'M','32 Barnes Way','VIC','6030','83539943','83337543','n',null,null,null,'French',to_date('11-03-2014','dd-mm-yyyy'),'GP1',null);

insert into Patient
 values
('P'||patientSequence.nextval,'Judy White',to_date('20-01-2010','dd-mm-yyyy'),'F','12 waterdale','VIC','6030','83119943','83117543','n',null,null,null,'French',to_date('11-04-2014','dd-mm-yyyy'),'GP2',null);

insert into Patient
 values
('P'||patientSequence.nextval,'Judy White',to_date('20-10-2008','dd-mm-yyyy'),'M','1 waterdale','VIC','6030','83115543','83115543','n',null,null,null,'French',to_date('11-03-2013','dd-mm-yyyy'),null,null);

insert into Patient
 values
('P'||patientSequence.nextval,'Judy White',to_date('15-11-2009','dd-mm-yyyy'),'M','1 waterdale','VIC','6030','83122243','83111113','n',null,null,null,'French',to_date('19-03-2014','dd-mm-yyyy'),null,null);

insert into Patient
 values
('P'||patientSequence.nextval,'Ming Li',to_date('15-07-1998','dd-mm-yyyy'),'M','12 Malabar Walk','VIC','6920','83127743','83177113','n',null,null,null,'Chinese',to_date('19-02-2014','dd-mm-yyyy'),null,null);

insert into Patient
 values
('P'||patientSequence.nextval,'Rebecca Zhang',to_date('15-07-1997','dd-mm-yyyy'),'F','11 Malabar Walk','VIC','6920','83127843','83178113','n',null,null,null,'Chinese',to_date('19-03-2010','dd-mm-yyyy'),null,null);

---------------------Insert Function Table---------------------------
insert into MetabolicFunction
 values
('F'||functionSequence.nextval,'Nausea or vomiting','Cat1');

insert into MetabolicFunction
values
('F'||functionSequence.nextval,'Diarrhea','Cat1');

insert into MetabolicFunction
values
('F'||functionSequence.nextval,'Constipation','Cat1');

insert into MetabolicFunction
values
('F'||functionSequence.nextval,'Bloated Feeling','Cat1');

insert into MetabolicFunction
values
('F'||functionSequence.nextval,'Belching, or passing gas','Cat1');

insert into MetabolicFunction
values
('F'||functionSequence.nextval,'Heartburn','Cat1');

insert into MetabolicFunction
values
('F'||functionSequence.nextval,'Intestinal/Stomach Pain','Cat1');

insert into MetabolicFunction
values
('F'||functionSequence.nextval,'Itchy Ears','Cat2');

insert into MetabolicFunction
values
('F'||functionSequence.nextval,'Earaches, ear infections','Cat2');

insert into MetabolicFunction
values
('F'||functionSequence.nextval,'Drainage from ear','Cat2');

insert into MetabolicFunction
values
('F'||functionSequence.nextval,'Ringing in ears, hearing loss','Cat2');

insert into MetabolicFunction
values
('F'||functionSequence.nextval,'Mood swings','Cat3');

insert into MetabolicFunction
values
('F'||functionSequence.nextval,'Anxiety, fear or nervousness','Cat3');

insert into MetabolicFunction
values
('F'||functionSequence.nextval,'Anger, irritability','Cat3');

insert into MetabolicFunction
values
('F'||functionSequence.nextval,'Depression','Cat3');

insert into MetabolicFunction
values
('F'||functionSequence.nextval,'Fatigue, sluggishness','Cat4');

insert into MetabolicFunction
values
('F'||functionSequence.nextval,'Apathy, lethargy','Cat4');

insert into MetabolicFunction
values
('F'||functionSequence.nextval,'Hyperactivity','Cat4');

insert into MetabolicFunction
values
('F'||functionSequence.nextval,'Restlessness','Cat4');

insert into MetabolicFunction
values
('F'||functionSequence.nextval,'Watery or itchy eyes','Cat5');

insert into MetabolicFunction
values
('F'||functionSequence.nextval,'Swollen, reddened or sticky eyelids','Cat5');

insert into MetabolicFunction
values
('F'||functionSequence.nextval,'Bags or dark circles under eyes','Cat5');

insert into MetabolicFunction
values
('F'||functionSequence.nextval,'Headaches','Cat6');

insert into MetabolicFunction
values
('F'||functionSequence.nextval,'Faintness','Cat6');

insert into MetabolicFunction
values
('F'||functionSequence.nextval,'Dizziness','Cat6');

insert into MetabolicFunction
values
('F'||functionSequence.nextval,'Insomnia','Cat6');

insert into MetabolicFunction
values
('F'||functionSequence.nextval,'Irregular or skipped heartbeat','Cat7');

insert into MetabolicFunction
values
('F'||functionSequence.nextval,'Rapid or pounding heartbeat','Cat7');

insert into MetabolicFunction
values
('F'||functionSequence.nextval,'Chest pain','Cat7');

insert into MetabolicFunction
values
('F'||functionSequence.nextval,'Pain or aches iin joints','Cat8');

insert into MetabolicFunction
values
('F'||functionSequence.nextval,'Arthritis','Cat8');

insert into MetabolicFunction
values
('F'||functionSequence.nextval,'Stiffness or limitation of movement','Cat8');

insert into MetabolicFunction
values
('F'||functionSequence.nextval,'Pain or aches in muscles','Cat8');

insert into MetabolicFunction
values
('F'||functionSequence.nextval,'Feeling of weakness or tiredness','Cat8');
-----------------------Insert patientMetabolic Table------------------------------------------------------------------------------------------------------------
insert into PatientMetabolic
values
('P1','F1',3);

insert into PatientMetabolic
values
('P1','F2',0);

insert into PatientMetabolic
values
('P1','F3',3);

insert into PatientMetabolic
values
('P1','F4',4);

insert into PatientMetabolic
values
('P1','F5',0);

insert into PatientMetabolic
values
('P1','F6',0);

insert into PatientMetabolic
values
('P1','F7',4);

insert into PatientMetabolic
values
('P1','F8',2);

insert into PatientMetabolic
values
('P1','F9',1);

insert into PatientMetabolic
values
('P1','F10',3);

insert into PatientMetabolic
values
('P1','F11',2);

insert into PatientMetabolic
values
('P1','F12',4);

insert into PatientMetabolic
values
('P1','F13',4);

insert into PatientMetabolic
values
('P1','F14',4);

insert into PatientMetabolic
values
('P1','F15',3);

insert into PatientMetabolic
values
('P1','F16',0);

insert into PatientMetabolic
values
('P1','F17',2);

insert into PatientMetabolic
values
('P1','F18',3);

insert into PatientMetabolic
values
('P1','F19',0);

insert into PatientMetabolic
values
('P1','F20',3);

insert into PatientMetabolic
values
('P1','F21',1);

insert into PatientMetabolic
values
('P1','F22',4);

insert into PatientMetabolic
values
('P1','F23',1);

insert into PatientMetabolic
values
('P1','F24',3);

insert into PatientMetabolic
values
('P1','F25',1);

insert into PatientMetabolic
values
('P1','F26',0);

insert into PatientMetabolic
values
('P1','F27',2);

insert into PatientMetabolic
values
('P1','F28',1);

insert into PatientMetabolic
values
('P1','F29',1);

insert into PatientMetabolic
values
('P1','F30',2);

insert into PatientMetabolic
values
('P1','F31',0);

insert into PatientMetabolic
values
('P1','F32',3);

insert into PatientMetabolic
values
('P1','F33',0);

insert into PatientMetabolic
values
('P1','F34',4);

insert into PatientMetabolic
values
('P2','F1',0);

insert into PatientMetabolic
values
('P2','F2',1);

insert into PatientMetabolic
values
('P2','F3',2);

insert into PatientMetabolic
values
('P2','F4',1);

insert into PatientMetabolic
values
('P2','F5',2);

insert into PatientMetabolic
values
('P2','F6',1);

insert into PatientMetabolic
values
('P2','F7',0);

insert into PatientMetabolic
values
('P2','F8',2);

insert into PatientMetabolic
values
('P2','F9',3);

insert into PatientMetabolic
values
('P2','F10',2);

insert into PatientMetabolic
values
('P2','F11',1);

insert into PatientMetabolic
values
('P2','F12',3);

insert into PatientMetabolic
values
('P2','F13',3);

insert into PatientMetabolic
values
('P2','F14',2);

insert into PatientMetabolic
values
('P2','F15',1);

insert into PatientMetabolic
values
('P2','F16',1);

insert into PatientMetabolic
values
('P2','F17',0);

insert into PatientMetabolic
values
('P2','F18',2);

insert into PatientMetabolic
values
('P2','F19',0);

insert into PatientMetabolic
values
('P2','F20',2);

insert into PatientMetabolic
values
('P2','F21',0);

insert into PatientMetabolic
values
('P2','F22',1);

insert into PatientMetabolic
values
('P2','F23',2);

insert into PatientMetabolic
values
('P2','F24',4);

insert into PatientMetabolic
values
('P2','F25',3);

insert into PatientMetabolic
values
('P2','F26',1);

insert into PatientMetabolic
values
('P2','F27',2);

insert into PatientMetabolic
values
('P2','F28',1);

insert into PatientMetabolic
values
('P2','F29',0);

insert into PatientMetabolic
values
('P2','F30',4);

insert into PatientMetabolic
values
('P2','F31',3);

insert into PatientMetabolic
values
('P2','F32',4);

insert into PatientMetabolic
values
('P2','F33',4);

insert into PatientMetabolic
values
('P2','F34',2);

insert into PatientMetabolic
values
('P3','F1',3);

insert into PatientMetabolic
values
('P3','F2',0);

insert into PatientMetabolic
values
('P3','F3',1);

insert into PatientMetabolic
values
('P3','F4',1);

insert into PatientMetabolic
values
('P3','F5',3);

insert into PatientMetabolic
values
('P3','F6',1);

insert into PatientMetabolic
values
('P3','F7',4);

insert into PatientMetabolic
values
('P3','F8',1);

insert into PatientMetabolic
values
('P3','F9',2);

insert into PatientMetabolic
values
('P3','F10',1);

insert into PatientMetabolic
values
('P3','F11',3);

insert into PatientMetabolic
values
('P3','F12',3);

insert into PatientMetabolic
values
('P3','F13',2);

insert into PatientMetabolic
values
('P3','F14',1);

insert into PatientMetabolic
values
('P3','F15',1);

insert into PatientMetabolic
values
('P3','F16',2);

insert into PatientMetabolic
values
('P3','F17',3);

insert into PatientMetabolic
values
('P3','F18',2);

insert into PatientMetabolic
values
('P3','F19',4);

insert into PatientMetabolic
values
('P3','F20',4);

insert into PatientMetabolic
values
('P3','F21',1);

insert into PatientMetabolic
values
('P3','F22',3);

insert into PatientMetabolic
values
('P3','F23',3);

insert into PatientMetabolic
values
('P3','F24',4);

insert into PatientMetabolic
values
('P3','F25',4);

insert into PatientMetabolic
values
('P3','F26',4);

insert into PatientMetabolic
values
('P3','F27',4);

insert into PatientMetabolic
values
('P3','F28',3);

insert into PatientMetabolic
values
('P3','F29',3);

insert into PatientMetabolic
values
('P3','F30',3);

insert into PatientMetabolic
values
('P3','F31',2);

insert into PatientMetabolic
values
('P3','F32',1);

insert into PatientMetabolic
values
('P3','F33',2);

insert into PatientMetabolic
values
('P3','F34',0);

insert into PatientMetabolic
values
('P4','F1',2);

insert into PatientMetabolic
values
('P4','F2',4);

insert into PatientMetabolic
values
('P4','F3',3);

insert into PatientMetabolic
values
('P4','F4',4);

insert into PatientMetabolic
values
('P4','F5',3);

insert into PatientMetabolic
values
('P4','F6',0);

insert into PatientMetabolic
values
('P4','F7',0);

insert into PatientMetabolic
values
('P4','F8',3);

insert into PatientMetabolic
values
('P4','F9',1);

insert into PatientMetabolic
values
('P4','F10',1);

insert into PatientMetabolic
values
('P4','F11',0);

insert into PatientMetabolic
values
('P4','F12',1);

insert into PatientMetabolic
values
('P4','F13',1);

insert into PatientMetabolic
values
('P4','F14',2);

insert into PatientMetabolic
values
('P4','F15',3);

insert into PatientMetabolic
values
('P4','F16',0);

insert into PatientMetabolic
values
('P4','F17',0);

insert into PatientMetabolic
values
('P4','F18',3);

insert into PatientMetabolic
values
('P4','F19',0);

insert into PatientMetabolic
values
('P4','F20',3);

insert into PatientMetabolic
values
('P4','F21',4);

insert into PatientMetabolic
values
('P4','F22',4);

insert into PatientMetabolic
values
('P4','F23',1);

insert into PatientMetabolic
values
('P4','F24',2);

insert into PatientMetabolic
values
('P4','F25',2);

insert into PatientMetabolic
values
('P4','F26',4);

insert into PatientMetabolic
values
('P4','F27',3);

insert into PatientMetabolic
values
('P4','F28',0);

insert into PatientMetabolic
values
('P4','F29',2);

insert into PatientMetabolic
values
('P4','F30',2);

insert into PatientMetabolic
values
('P4','F31',3);

insert into PatientMetabolic
values
('P4','F32',4);

insert into PatientMetabolic
values
('P4','F33',4);

insert into PatientMetabolic
values
('P4','F34',3);

insert into PatientMetabolic
values
('P5','F1',3);

insert into PatientMetabolic
values
('P5','F2',1);

insert into PatientMetabolic
values
('P5','F3',1);

insert into PatientMetabolic
values
('P5','F4',3);

insert into PatientMetabolic
values
('P5','F5',1);

insert into PatientMetabolic
values
('P5','F6',0);

insert into PatientMetabolic
values
('P5','F7',0);

insert into PatientMetabolic
values
('P5','F8',4);

insert into PatientMetabolic
values
('P5','F9',0);

insert into PatientMetabolic
values
('P5','F10',1);

insert into PatientMetabolic
values
('P5','F11',1);

insert into PatientMetabolic
values
('P5','F12',0);

insert into PatientMetabolic
values
('P5','F13',2);

insert into PatientMetabolic
values
('P5','F14',0);

insert into PatientMetabolic
values
('P5','F15',4);

insert into PatientMetabolic
values
('P5','F16',0);

insert into PatientMetabolic
values
('P5','F17',4);

insert into PatientMetabolic
values
('P5','F18',2);

insert into PatientMetabolic
values
('P5','F19',0);

insert into PatientMetabolic
values
('P5','F20',3);

insert into PatientMetabolic
values
('P5','F21',4);

insert into PatientMetabolic
values
('P5','F22',2);

insert into PatientMetabolic
values
('P5','F23',0);

insert into PatientMetabolic
values
('P5','F24',4);

insert into PatientMetabolic
values
('P5','F25',0);

insert into PatientMetabolic
values
('P5','F26',3);

insert into PatientMetabolic
values
('P5','F27',4);

insert into PatientMetabolic
values
('P5','F28',3);

insert into PatientMetabolic
values
('P5','F29',2);

insert into PatientMetabolic
values
('P5','F30',4);

insert into PatientMetabolic
values
('P5','F31',2);

insert into PatientMetabolic
values
('P5','F32',0);

insert into PatientMetabolic
values
('P5','F33',4);

insert into PatientMetabolic
values
('P5','F34',4);

insert into PatientMetabolic
values
('P6','F1',1);

insert into PatientMetabolic
values
('P6','F2',0);

insert into PatientMetabolic
values
('P6','F3',1);

insert into PatientMetabolic
values
('P6','F4',1);

insert into PatientMetabolic
values
('P6','F5',4);

insert into PatientMetabolic
values
('P6','F6',4);

insert into PatientMetabolic
values
('P6','F7',4);

insert into PatientMetabolic
values
('P6','F8',2);

insert into PatientMetabolic
values
('P6','F9',3);

insert into PatientMetabolic
values
('P6','F10',0);

insert into PatientMetabolic
values
('P6','F11',0);

insert into PatientMetabolic
values
('P6','F12',3);

insert into PatientMetabolic
values
('P6','F13',0);

insert into PatientMetabolic
values
('P6','F14',1);

insert into PatientMetabolic
values
('P6','F15',4);

insert into PatientMetabolic
values
('P6','F16',3);

insert into PatientMetabolic
values
('P6','F17',2);

insert into PatientMetabolic
values
('P6','F18',0);

insert into PatientMetabolic
values
('P6','F19',2);

insert into PatientMetabolic
values
('P6','F20',1);

insert into PatientMetabolic
values
('P6','F21',3);

insert into PatientMetabolic
values
('P6','F22',3);

insert into PatientMetabolic
values
('P6','F23',0);

insert into PatientMetabolic
values
('P6','F24',2);

insert into PatientMetabolic
values
('P6','F25',2);

insert into PatientMetabolic
values
('P6','F26',3);

insert into PatientMetabolic
values
('P6','F27',1);

insert into PatientMetabolic
values
('P6','F28',2);

insert into PatientMetabolic
values
('P6','F29',1);

insert into PatientMetabolic
values
('P6','F30',1);

insert into PatientMetabolic
values
('P6','F31',3);

insert into PatientMetabolic
values
('P6','F32',0);

insert into PatientMetabolic
values
('P6','F33',1);

insert into PatientMetabolic
values
('P6','F34',0);

insert into PatientMetabolic
values
('P7','F1',3);

insert into PatientMetabolic
values
('P7','F2',2);

insert into PatientMetabolic
values
('P7','F3',4);

insert into PatientMetabolic
values
('P7','F4',2);

insert into PatientMetabolic
values
('P7','F5',0);

insert into PatientMetabolic
values
('P7','F6',4);

insert into PatientMetabolic
values
('P7','F7',2);

insert into PatientMetabolic
values
('P7','F8',4);

insert into PatientMetabolic
values
('P7','F9',3);

insert into PatientMetabolic
values
('P7','F10',2);

insert into PatientMetabolic
values
('P7','F11',2);

insert into PatientMetabolic
values
('P7','F12',4);

insert into PatientMetabolic
values
('P7','F13',0);

insert into PatientMetabolic
values
('P7','F14',0);

insert into PatientMetabolic
values
('P7','F15',3);

insert into PatientMetabolic
values
('P7','F16',0);

insert into PatientMetabolic
values
('P7','F17',2);

insert into PatientMetabolic
values
('P7','F18',2);

insert into PatientMetabolic
values
('P7','F19',2);

insert into PatientMetabolic
values
('P7','F20',4);

insert into PatientMetabolic
values
('P7','F21',0);

insert into PatientMetabolic
values
('P7','F22',3);

insert into PatientMetabolic
values
('P7','F23',3);

insert into PatientMetabolic
values
('P7','F24',2);

insert into PatientMetabolic
values
('P7','F25',0);

insert into PatientMetabolic
values
('P7','F26',3);

insert into PatientMetabolic
values
('P7','F27',0);

insert into PatientMetabolic
values
('P7','F28',4);

insert into PatientMetabolic
values
('P7','F29',3);

insert into PatientMetabolic
values
('P7','F30',1);

insert into PatientMetabolic
values
('P7','F31',3);

insert into PatientMetabolic
values
('P7','F32',3);

insert into PatientMetabolic
values
('P7','F33',0);

insert into PatientMetabolic
values
('P7','F34',3);

insert into PatientMetabolic
values
('P8','F1',3);

insert into PatientMetabolic
values
('P8','F2',1);

insert into PatientMetabolic
values
('P8','F3',3);

insert into PatientMetabolic
values
('P8','F4',3);

insert into PatientMetabolic
values
('P8','F5',3);

insert into PatientMetabolic
values
('P8','F6',4);

insert into PatientMetabolic
values
('P8','F7',3);

insert into PatientMetabolic
values
('P8','F8',4);

insert into PatientMetabolic
values
('P8','F9',3);

insert into PatientMetabolic
values
('P8','F10',2);

insert into PatientMetabolic
values
('P8','F11',2);

insert into PatientMetabolic
values
('P8','F12',2);

insert into PatientMetabolic
values
('P8','F13',2);

insert into PatientMetabolic
values
('P8','F14',3);

insert into PatientMetabolic
values
('P8','F15',1);

insert into PatientMetabolic
values
('P8','F16',4);

insert into PatientMetabolic
values
('P8','F17',0);

insert into PatientMetabolic
values
('P8','F18',4);

insert into PatientMetabolic
values
('P8','F19',2);

insert into PatientMetabolic
values
('P8','F20',0);

insert into PatientMetabolic
values
('P8','F21',0);

insert into PatientMetabolic
values
('P8','F22',4);

insert into PatientMetabolic
values
('P8','F23',4);

insert into PatientMetabolic
values
('P8','F24',1);

insert into PatientMetabolic
values
('P8','F25',1);

insert into PatientMetabolic
values
('P8','F26',3);

insert into PatientMetabolic
values
('P8','F27',0);

insert into PatientMetabolic
values
('P8','F28',2);

insert into PatientMetabolic
values
('P8','F29',3);

insert into PatientMetabolic
values
('P8','F30',1);

insert into PatientMetabolic
values
('P8','F31',3);

insert into PatientMetabolic
values
('P8','F32',1);

insert into PatientMetabolic
values
('P8','F33',2);

insert into PatientMetabolic
values
('P8','F34',2);

insert into PatientMetabolic
values
('P9','F1',1);

insert into PatientMetabolic
values
('P9','F2',4);

insert into PatientMetabolic
values
('P9','F3',4);

insert into PatientMetabolic
values
('P9','F4',4);

insert into PatientMetabolic
values
('P9','F5',2);

insert into PatientMetabolic
values
('P9','F6',2);

insert into PatientMetabolic
values
('P9','F7',1);

insert into PatientMetabolic
values
('P9','F8',0);

insert into PatientMetabolic
values
('P9','F9',4);

insert into PatientMetabolic
values
('P9','F10',0);

insert into PatientMetabolic
values
('P9','F11',1);

insert into PatientMetabolic
values
('P9','F12',3);

insert into PatientMetabolic
values
('P9','F13',2);

insert into PatientMetabolic
values
('P9','F14',1);

insert into PatientMetabolic
values
('P9','F15',4);

insert into PatientMetabolic
values
('P9','F16',1);

insert into PatientMetabolic
values
('P9','F17',4);

insert into PatientMetabolic
values
('P9','F18',4);

insert into PatientMetabolic
values
('P9','F19',0);

insert into PatientMetabolic
values
('P9','F20',3);

insert into PatientMetabolic
values
('P9','F21',0);

insert into PatientMetabolic
values
('P9','F22',2);

insert into PatientMetabolic
values
('P9','F23',4);

insert into PatientMetabolic
values
('P9','F24',4);

insert into PatientMetabolic
values
('P9','F25',2);

insert into PatientMetabolic
values
('P9','F26',3);

insert into PatientMetabolic
values
('P9','F27',4);

insert into PatientMetabolic
values
('P9','F28',0);

insert into PatientMetabolic
values
('P9','F29',0);

insert into PatientMetabolic
values
('P9','F30',3);

insert into PatientMetabolic
values
('P9','F31',2);

insert into PatientMetabolic
values
('P9','F32',3);

insert into PatientMetabolic
values
('P9','F33',0);

insert into PatientMetabolic
values
('P9','F34',1);

insert into PatientMetabolic
values
('P10','F1',4);

insert into PatientMetabolic
values
('P10','F2',0);

insert into PatientMetabolic
values
('P10','F3',1);

insert into PatientMetabolic
values
('P10','F4',1);

insert into PatientMetabolic
values
('P10','F5',1);

insert into PatientMetabolic
values
('P10','F6',2);

insert into PatientMetabolic
values
('P10','F7',3);

insert into PatientMetabolic
values
('P10','F8',1);

insert into PatientMetabolic
values
('P10','F9',0);

insert into PatientMetabolic
values
('P10','F10',4);

insert into PatientMetabolic
values
('P10','F11',2);

insert into PatientMetabolic
values
('P10','F12',0);

insert into PatientMetabolic
values
('P10','F13',2);

insert into PatientMetabolic
values
('P10','F14',3);

insert into PatientMetabolic
values
('P10','F15',1);

insert into PatientMetabolic
values
('P10','F16',3);

insert into PatientMetabolic
values
('P10','F17',3);

insert into PatientMetabolic
values
('P10','F18',2);

insert into PatientMetabolic
values
('P10','F19',4);

insert into PatientMetabolic
values
('P10','F20',2);

insert into PatientMetabolic
values
('P10','F21',4);

insert into PatientMetabolic
values
('P10','F22',0);

insert into PatientMetabolic
values
('P10','F23',2);

insert into PatientMetabolic
values
('P10','F24',1);

insert into PatientMetabolic
values
('P10','F25',4);

insert into PatientMetabolic
values
('P10','F26',1);

insert into PatientMetabolic
values
('P10','F27',1);

insert into PatientMetabolic
values
('P10','F28',4);

insert into PatientMetabolic
values
('P10','F29',1);

insert into PatientMetabolic
values
('P10','F30',2);

insert into PatientMetabolic
values
('P10','F31',3);

insert into PatientMetabolic
values
('P10','F32',4);

insert into PatientMetabolic
values
('P10','F33',4);

insert into PatientMetabolic
values
('P10','F34',2);

insert into PatientMetabolic
values
('P11','F1',2);

insert into PatientMetabolic
values
('P11','F2',4);

insert into PatientMetabolic
values
('P11','F3',0);

insert into PatientMetabolic
values
('P11','F4',2);

insert into PatientMetabolic
values
('P11','F5',3);

insert into PatientMetabolic
values
('P11','F6',4);

insert into PatientMetabolic
values
('P11','F7',4);

insert into PatientMetabolic
values
('P11','F8',1);

insert into PatientMetabolic
values
('P11','F9',0);

insert into PatientMetabolic
values
('P11','F10',1);

insert into PatientMetabolic
values
('P11','F11',4);

insert into PatientMetabolic
values
('P11','F12',1);

insert into PatientMetabolic
values
('P11','F13',2);

insert into PatientMetabolic
values
('P11','F14',2);

insert into PatientMetabolic
values
('P11','F15',1);

insert into PatientMetabolic
values
('P11','F16',3);

insert into PatientMetabolic
values
('P11','F17',2);

insert into PatientMetabolic
values
('P11','F18',0);

insert into PatientMetabolic
values
('P11','F19',4);

insert into PatientMetabolic
values
('P11','F20',0);

insert into PatientMetabolic
values
('P11','F21',2);

insert into PatientMetabolic
values
('P11','F22',0);

insert into PatientMetabolic
values
('P11','F23',4);

insert into PatientMetabolic
values
('P11','F24',2);

insert into PatientMetabolic
values
('P11','F25',1);

insert into PatientMetabolic
values
('P11','F26',3);

insert into PatientMetabolic
values
('P11','F27',4);

insert into PatientMetabolic
values
('P11','F28',1);

insert into PatientMetabolic
values
('P11','F29',2);

insert into PatientMetabolic
values
('P11','F30',0);

insert into PatientMetabolic
values
('P11','F31',1);

insert into PatientMetabolic
values
('P11','F32',0);

insert into PatientMetabolic
values
('P11','F33',2);

insert into PatientMetabolic
values
('P11','F34',2);

insert into PatientMetabolic
values
('P12','F1',1);

insert into PatientMetabolic
values
('P12','F2',2);

insert into PatientMetabolic
values
('P12','F3',0);

insert into PatientMetabolic
values
('P12','F4',3);

insert into PatientMetabolic
values
('P12','F5',2);

insert into PatientMetabolic
values
('P12','F6',2);

insert into PatientMetabolic
values
('P12','F7',2);

insert into PatientMetabolic
values
('P12','F8',3);

insert into PatientMetabolic
values
('P12','F9',2);

insert into PatientMetabolic
values
('P12','F10',0);

insert into PatientMetabolic
values
('P12','F11',0);

insert into PatientMetabolic
values
('P12','F12',0);

insert into PatientMetabolic
values
('P12','F13',1);

insert into PatientMetabolic
values
('P12','F14',1);

insert into PatientMetabolic
values
('P12','F15',3);

insert into PatientMetabolic
values
('P12','F16',0);

insert into PatientMetabolic
values
('P12','F17',1);

insert into PatientMetabolic
values
('P12','F18',2);

insert into PatientMetabolic
values
('P12','F19',3);

insert into PatientMetabolic
values
('P12','F20',1);

insert into PatientMetabolic
values
('P12','F21',1);

insert into PatientMetabolic
values
('P12','F22',1);

insert into PatientMetabolic
values
('P12','F23',3);

insert into PatientMetabolic
values
('P12','F24',1);

insert into PatientMetabolic
values
('P12','F25',0);

insert into PatientMetabolic
values
('P12','F26',3);

insert into PatientMetabolic
values
('P12','F27',2);

insert into PatientMetabolic
values
('P12','F28',3);

insert into PatientMetabolic
values
('P12','F29',0);

insert into PatientMetabolic
values
('P12','F30',1);

insert into PatientMetabolic
values
('P12','F31',3);

insert into PatientMetabolic
values
('P12','F32',3);

insert into PatientMetabolic
values
('P12','F33',0);

insert into PatientMetabolic
values
('P12','F34',2);

insert into PatientMetabolic
values
('P13','F1',2);

insert into PatientMetabolic
values
('P13','F2',3);

insert into PatientMetabolic
values
('P13','F3',3);

insert into PatientMetabolic
values
('P13','F4',0);

insert into PatientMetabolic
values
('P13','F5',4);

insert into PatientMetabolic
values
('P13','F6',3);

insert into PatientMetabolic
values
('P13','F7',2);

insert into PatientMetabolic
values
('P13','F8',3);

insert into PatientMetabolic
values
('P13','F9',1);

insert into PatientMetabolic
values
('P13','F10',1);

insert into PatientMetabolic
values
('P13','F11',3);

insert into PatientMetabolic
values
('P13','F12',2);

insert into PatientMetabolic
values
('P13','F13',1);

insert into PatientMetabolic
values
('P13','F14',0);

insert into PatientMetabolic
values
('P13','F15',0);

insert into PatientMetabolic
values
('P13','F16',3);

insert into PatientMetabolic
values
('P13','F17',3);

insert into PatientMetabolic
values
('P13','F18',2);

insert into PatientMetabolic
values
('P13','F19',0);

insert into PatientMetabolic
values
('P13','F20',2);

insert into PatientMetabolic
values
('P13','F21',3);

insert into PatientMetabolic
values
('P13','F22',1);

insert into PatientMetabolic
values
('P13','F23',0);

insert into PatientMetabolic
values
('P13','F24',2);

insert into PatientMetabolic
values
('P13','F25',2);

insert into PatientMetabolic
values
('P13','F26',3);

insert into PatientMetabolic
values
('P13','F27',1);

insert into PatientMetabolic
values
('P13','F28',3);

insert into PatientMetabolic
values
('P13','F29',2);

insert into PatientMetabolic
values
('P13','F30',1);

insert into PatientMetabolic
values
('P13','F31',1);

insert into PatientMetabolic
values
('P13','F32',4);

insert into PatientMetabolic
values
('P13','F33',1);

insert into PatientMetabolic
values
('P13','F34',2);

insert into PatientMetabolic
values
('P14','F1',4);

insert into PatientMetabolic
values
('P14','F2',3);

insert into PatientMetabolic
values
('P14','F3',3);

insert into PatientMetabolic
values
('P14','F4',1);

insert into PatientMetabolic
values
('P14','F5',1);

insert into PatientMetabolic
values
('P14','F6',1);

insert into PatientMetabolic
values
('P14','F7',3);

insert into PatientMetabolic
values
('P14','F8',0);

insert into PatientMetabolic
values
('P14','F9',3);

insert into PatientMetabolic
values
('P14','F10',1);

insert into PatientMetabolic
values
('P14','F11',3);

insert into PatientMetabolic
values
('P14','F12',0);

insert into PatientMetabolic
values
('P14','F13',0);

insert into PatientMetabolic
values
('P14','F14',3);

insert into PatientMetabolic
values
('P14','F15',0);

insert into PatientMetabolic
values
('P14','F16',1);

insert into PatientMetabolic
values
('P14','F17',2);

insert into PatientMetabolic
values
('P14','F18',1);

insert into PatientMetabolic
values
('P14','F19',4);

insert into PatientMetabolic
values
('P14','F20',2);

insert into PatientMetabolic
values
('P14','F21',0);

insert into PatientMetabolic
values
('P14','F22',2);

insert into PatientMetabolic
values
('P14','F23',3);

insert into PatientMetabolic
values
('P14','F24',1);

insert into PatientMetabolic
values
('P14','F25',0);

insert into PatientMetabolic
values
('P14','F26',1);

insert into PatientMetabolic
values
('P14','F27',1);

insert into PatientMetabolic
values
('P14','F28',1);

insert into PatientMetabolic
values
('P14','F29',1);

insert into PatientMetabolic
values
('P14','F30',2);

insert into PatientMetabolic
values
('P14','F31',2);

insert into PatientMetabolic
values
('P14','F32',1);

insert into PatientMetabolic
values
('P14','F33',0);

insert into PatientMetabolic
values
('P14','F34',2);

insert into PatientMetabolic
values
('P15','F1',1);

insert into PatientMetabolic
values
('P15','F2',2);

insert into PatientMetabolic
values
('P15','F3',3);

insert into PatientMetabolic
values
('P15','F4',4);

insert into PatientMetabolic
values
('P15','F5',0);

insert into PatientMetabolic
values
('P15','F6',0);

insert into PatientMetabolic
values
('P15','F7',2);

insert into PatientMetabolic
values
('P15','F8',4);

insert into PatientMetabolic
values
('P15','F9',4);

insert into PatientMetabolic
values
('P15','F10',1);

insert into PatientMetabolic
values
('P15','F11',3);

insert into PatientMetabolic
values
('P15','F12',1);

insert into PatientMetabolic
values
('P15','F13',3);

insert into PatientMetabolic
values
('P15','F14',2);

insert into PatientMetabolic
values
('P15','F15',4);

insert into PatientMetabolic
values
('P15','F16',2);

insert into PatientMetabolic
values
('P15','F17',1);

insert into PatientMetabolic
values
('P15','F18',1);

insert into PatientMetabolic
values
('P15','F19',4);

insert into PatientMetabolic
values
('P15','F20',0);

insert into PatientMetabolic
values
('P15','F21',0);

insert into PatientMetabolic
values
('P15','F22',2);

insert into PatientMetabolic
values
('P15','F23',1);

insert into PatientMetabolic
values
('P15','F24',1);

insert into PatientMetabolic
values
('P15','F25',4);

insert into PatientMetabolic
values
('P15','F26',2);

insert into PatientMetabolic
values
('P15','F27',4);

insert into PatientMetabolic
values
('P15','F28',3);

insert into PatientMetabolic
values
('P15','F29',4);

insert into PatientMetabolic
values
('P15','F30',1);

insert into PatientMetabolic
values
('P15','F31',3);

insert into PatientMetabolic
values
('P15','F32',0);

insert into PatientMetabolic
values
('P15','F33',0);

insert into PatientMetabolic
values
('P15','F34',3);



---------------------Insert Visit Table------------------------------------------------------------------------------------------------------------------------------
insert into visit
values
('V'||visitSequence.nextval,To_date('15-05-2013','dd-mm-yyyy'),to_date('06:33','HH24:MI'),934.393774656415,'RNo2247690','Lifestyle Counseling and Modification0,Phytotherapy1,Naturopathic Manipulation2','Chinese herbs0','heart disease0','P4');

insert into visit
values
('V'||visitSequence.nextval,To_date('15-05-2013','dd-mm-yyyy'),to_date('06:33','HH24:MI'),90.393774656415,'RNo2117690','Lifestyle Counseling and Modification0,Phytotherapy1,Naturopathic Manipulation2','Chinese herbs0','heart disease0','P8');

insert into visit
values
('V'||visitSequence.nextval,To_date('07-06-2013','dd-mm-yyyy'),to_date('18:37','HH24:MI'),642.5751614048603,'RNo2454802','Acupuncture0,Lifestyle Counseling and Modification1','Chinese herbs0','headaches0','P3');

insert into visit
values
('V'||visitSequence.nextval,To_date('05-10-2013','dd-mm-yyyy'),to_date('23:23','HH24:MI'),127.51561361312386,'RNo5228504','Lifestyle Counseling and Modification0','Botanical medicine0','musceloskeletal pain0','P6');

insert into visit
values
('V'||visitSequence.nextval,To_date('16-12-2012','dd-mm-yyyy'),to_date('12:18','HH24:MI'),317.7624135993052,'RNo8887876','Naturopathic Manipulation0,Phytotherapy1,Clinical Nutrition2','Botanical medicine1','migraines0','P1');

insert into visit
values
('V'||visitSequence.nextval,To_date('20-08-2013','dd-mm-yyyy'),to_date('08:24','HH24:MI'),637.1571785191429,'RNo892993','Homeopathy0,Phytotherapy1,Acupuncture2','Botanical medicine0','sore throats0,arthritis1','P6');

insert into visit
values
('V'||visitSequence.nextval,To_date('01-03-2012','dd-mm-yyyy'),to_date('13:17','HH24:MI'),945.8636133731571,'RNo6801473','Clinical Nutrition0','Chinese herbs0','colds and flu0','P1');

insert into visit
values
('V'||visitSequence.nextval,To_date('01-03-2012','dd-mm-yyyy'),to_date('13:20','HH24:MI'),344.8636133731571,'RNo6804573','Clinical Nutrition1','Chinese herbs0','sore throats','P5');

insert into visit
values
('V'||visitSequence.nextval,To_date('01-03-2012','dd-mm-yyyy'),to_date('10:20','HH24:MI'),34.8636133731571,'RNo6808873','Clinical Nutrition1','Chinese herbs1','sore throats','P7');

insert into visit
values
('V'||visitSequence.nextval,To_date('21-10-2012','dd-mm-yyyy'),to_date('14:59','HH24:MI'),531.5759814354725,'RNo6386144','Clinical Nutrition0,Phytotherapy1','Botanical medicine0','headaches0','P6');

insert into visit
values
('V'||visitSequence.nextval,To_date('10-05-2013','dd-mm-yyyy'),to_date('13:17','HH24:MI'),625.7584854028213,'RNo4704956','Acupuncture0,Phytotherapy1','Botanical medicine1','intestinal upsets0','P8');

insert into visit
values
('V'||visitSequence.nextval,To_date('02-02-2014','dd-mm-yyyy'),to_date('00:54','HH24:MI'),88.18605088810529,'RNo8546207','Phytotherapy0','Botanical medicine1','intestinal upsets0,heart disease1','P11');

insert into visit
values
('V'||visitSequence.nextval,To_date('03-01-2013','dd-mm-yyyy'),to_date('21:31','HH24:MI'),686.5733129365537,'RNo4176945','Acupuncture0','Chinese herbs1,','colds and flu0','P4');

insert into visit
values
('V'||visitSequence.nextval,To_date('24-01-2014','dd-mm-yyyy'),to_date('14:51','HH24:MI'),126.32070177688306,'RNo4924256','Lifestyle Counseling and Modification0,Lifestyle Counseling and Modification1,Homeopathy2','Botanical medicine0','intestinal upsets0','P9');

insert into visit
values
('V'||visitSequence.nextval,To_date('07-10-2013','dd-mm-yyyy'),to_date('04:24','HH24:MI'),876.270154575226,'RNo6306960','Acupuncture0,Clinical Nutrition1','Chinese herbs0','headaches0,urinary disorder1','P1');

insert into visit
values
('V'||visitSequence.nextval,To_date('06-01-2012','dd-mm-yyyy'),to_date('09:54','HH24:MI'),707.5161902170756,'RNo2253883','Acupuncture0','Botanical medicine1','sore throats0','P6');

insert into visit
values
('V'||visitSequence.nextval,To_date('21-12-2013','dd-mm-yyyy'),to_date('07:57','HH24:MI'),427.4509679988853,'RNo535147','Lifestyle Counseling and Modification0,Clinical Nutrition1,Homeopathy2','Chinese herbs1','migraines0','P12');

insert into visit
values
('V'||visitSequence.nextval,To_date('03-11-2012','dd-mm-yyyy'),to_date('02:11','HH24:MI'),440.2321375035351,'RNo8018514','Lifestyle Counseling and Modification0,Naturopathic Manipulation1','Chinese herbs0','migraines0,headaches1','P9');

insert into visit
values
('V'||visitSequence.nextval,To_date('06-07-2013','dd-mm-yyyy'),to_date('13:30','HH24:MI'),845.4683564005087,'RNo8884516','Clinical Nutrition0,Clinical Nutrition1','Chinese herbs0','sore throats0','P2');

insert into visit
values
('V'||visitSequence.nextval,To_date('21-03-2012','dd-mm-yyyy'),to_date('22:57','HH24:MI'),137.54671910213787,'RNo8263081','Homeopathy0,Clinical Nutrition1','Chinese herbs0','urinary disorder0,sore throats1','P7');

insert into visit
values
('V'||visitSequence.nextval,To_date('21-03-2012','dd-mm-yyyy'),to_date('14:57','HH24:MI'),137.54671910213787,'RNo8263081','Homeopathy0,Clinical Nutrition1','Chinese herbs0','urinary disorder0,sore throats1','P5');

insert into visit
values
('V'||visitSequence.nextval,To_date('13-02-2012','dd-mm-yyyy'),to_date('08:52','HH24:MI'),281.7076287653065,'RNo9517409','Clinical Nutrition0,Homeopathy1,Phytotherapy2','Chinese herbs1','migraines0','P4');

insert into visit
values
('V'||visitSequence.nextval,To_date('09-03-2012','dd-mm-yyyy'),to_date('03:37','HH24:MI'),135.51776451563526,'RNo787607','Acupuncture0,Lifestyle Counseling and Modification1','Chinese herbs0','heart disease0,colds and flu1','P5');

insert into visit
values
('V'||visitSequence.nextval,To_date('02-10-2013','dd-mm-yyyy'),to_date('01:56','HH24:MI'),653.5724073465951,'RNo6532887','Naturopathic Manipulation0,Phytotherapy1','Chinese herbs0','adiction and substance abuse0,arthritis1','P6');

---------------------Insert  PatientPractiner Table---------------------------
insert into PatientPractioner
values
('P8','Pra2');

insert into PatientPractioner
values
('P6','Pra7');

insert into PatientPractioner
values
('P10','Pra2');

insert into PatientPractioner
values
('P2','Pra5');

insert into PatientPractioner
values
('P12','Pra3');

insert into PatientPractioner
values
('P2','Pra4');

insert into PatientPractioner
values
('P6','Pra3');

insert into PatientPractioner
values
('P8','Pra5');

insert into PatientPractioner
values
('P2','Pra1');

insert into PatientPractioner
values
('P4','Pra4');

insert into PatientPractioner
values
('P11','Pra7');

insert into PatientPractioner
values
('P4','Pra3');

insert into PatientPractioner
values
('P7','Pra2');

insert into PatientPractioner
values
('P12','Pra5');

insert into PatientPractioner
values
('P2','Pra6');

insert into PatientPractioner
values
('P4','Pra2');

---------------------Insert  PatientRelCon Table---------------------------
insert into PatientRelCon
values
('P1','RC1','Slightly');

insert into PatientRelCon
values
('P2','RC1','5 years ago');

insert into PatientRelCon
values
('P3','RC1','Slightly');

insert into PatientRelCon
values
('P4','RC1','Serous');

insert into PatientRelCon
values
('P4','RC2','Mild');

insert into PatientRelCon
values
('P5','RC2','10 years ago');

insert into PatientRelCon
values
('P7','RC4','5 years ago');

insert into PatientRelCon
values
('P7','RC3','Slightly');

insert into PatientRelCon
values
('P8','RC3','10 years ago');

insert into PatientRelCon
values
('P9','RC3','10 years ago');

insert into PatientRelCon
values
('P10','RC1','20 years ago');

insert into PatientRelCon
values
('P11','RC1','10 years ago');

insert into PatientRelCon
values
('P12','RC1','Very sensitive');

insert into PatientRelCon
values
('P13','RC1','Since born');

---------------------Insert  PatientHabit Table---------------------------
insert into PatientHabit
values
('P2','H3',3,4,'day','need to sleep early');

insert into PatientHabit
values
('P5','H1',7,4,'day','need to sleep early');

insert into PatientHabit
values
('P3','H3',5,1,'day','need to sleep early');

insert into PatientHabit
values
('P1','H1',7,3,'day','need to drink more water');

insert into PatientHabit
values
('P2','H2',8,3,'day','need to eat more vegetables');

insert into PatientHabit
values
('P1','H3',8,2,'day','need to sleep early');

insert into PatientHabit
values
('P12','H2',9,3,'day','need to sleep early');

insert into PatientHabit
values
('P12','H1',2,3,'day','need to sleep early');

insert into PatientHabit
values
('P9','H1',8,2,'day','need to sleep early');

insert into PatientHabit
values
('P6','H3',10,4,'day','need to drink more water');

insert into PatientHabit
values
('P2','H1',5,1,'day','need to sleep early');

insert into PatientHabit
values
('P10','H2',8,1,'day','need to drink more water');

insert into PatientHabit
values
('P9','H2',7,4,'day','need to keep warm');

insert into PatientHabit
values
('P5','H3',7,3,'day','need to sleep early');

insert into PatientHabit
values
('P8','H1',5,5,'day','need to drink more water');

insert into PatientHabit
values
('P11','H3',2,4,'day','need to drink more water');

---------------------Insert  PatientMed Table---------------------------
insert into PatientMedCon
values
('P12','MC8','Feel sick');

insert into PatientMedCon
values
('P3','MC4','Feel dizzy');

insert into PatientMedCon
values
('P3','MC8','Feel dizzy');

insert into PatientMedCon
values
('P3','MC3','Feel dizzy');

insert into PatientMedCon
values
('P2','MC1','Feel cold');

insert into PatientMedCon
values
('P9','MC8','Feel depressed');

insert into PatientMedCon
values
('P3','MC5','Feel sick');

insert into PatientMedCon
values
('P9','MC1','Feel cold');

insert into PatientMedCon
values
('P1','MC6','Feel cold');

insert into PatientMedCon
values
('P1','MC11','Feel cold');

insert into PatientMedCon
values
('P8','MC7','Feel cold');

insert into PatientMedCon
values
('P3','MC9','Feel dizzy');

insert into PatientMedCon
values
('P4','MC8','Feel sick');

insert into PatientMedCon
values
('P10','MC7','Feel sick');

insert into PatientMedCon
values
('P9','MC11','Feel dizzy');

insert into PatientMedCon
values
('P6','MC1','Feel dizzy');

insert into PatientMedCon
values
('P7','MC5','Feel sick');

insert into PatientMedCon
values
('P3','MC1','Feel sick');

insert into PatientMedCon
values
('P5','MC8','Feel sick');

insert into PatientMedCon
values
('P5','MC3','Feel sick');

insert into PatientMedCon
values
('P3','MC11','Feel dizzy');

insert into PatientMedCon
values
('P10','MC4','Feel depressed');

insert into PatientMedCon
values
('P3','MC6','Feel depressed');

insert into PatientMedCon
values
('P4','MC12','Feel dizzy');

insert into PatientMedCon
values
('P1','MC1','Feel depressed');

insert into PatientMedCon
values
('P9','MC3','Feel sick');

insert into PatientMedCon
values
('P6','MC11','Feel depressed');

insert into PatientMedCon
values
('P12','MC5','Feel depressed');

insert into PatientMedCon
values
('P5','MC10','Feel depressed');

insert into PatientMedCon
values
('P5','MC2','Feel dizzy');

insert into PatientMedCon
values
('P1','MC3','Feel sick');

insert into PatientMedCon
values
('P7','MC1','Feel dizzy');

insert into PatientMedCon
values
('P4','MC9','Feel cold');

insert into PatientMedCon
values
('P5','MC1','Feel depressed');

insert into PatientMedCon
values
('P15','MC1','Feel dizzy');

insert into PatientMedCon
values
('P7','MC12','Feel sick');

insert into PatientMedCon
values
('P11','MC10','Feel dizzy');

insert into PatientMedCon
values
('P2','MC2','Feel depressed');

insert into PatientMedCon
values
('P14','MC1','Feel depressed');

insert into PatientMedCon
values
('P4','MC5','Feel depressed');

insert into PatientMedCon
values
('P12','MC12','Feel depressed');

insert into PatientMedCon
values
('P1','MC4','Feel dizzy');

insert into PatientMedCon
values
('P13','MC1','Very serious');

insert into PatientMedCon
values
('P6','MC7','Feel dizzy');

insert into PatientMedCon
values
('P6','MC6','Feel sick');

insert into PatientMedCon
values
('P11','MC8','Feel dizzy');


---------------------Insert  RelConDetail Table---------------------------
insert into RelConDetail
values
('P1','RC1','Seafood');

insert into RelConDetail
values
('P2','RC1','Flower');

insert into RelConDetail
values
('P2','RC1','Chinese herb3');

insert into RelConDetail
values
('P3','RC1','Egg');

insert into RelConDetail
values
('P3','RC1','Flower');

insert into RelConDetail
values
('P4','RC1','Flower');

insert into RelConDetail
values
('P4','RC2','Liver');

insert into RelConDetail
values
('P4','RC2','Lung');

insert into RelConDetail
values
('P5','RC2','Heart');

insert into RelConDetail
values
('P7','RC4','Synthroid');

insert into RelConDetail
values
('P7','RC4','Furosemide');

insert into RelConDetail
values
('P7','RC3','Surgery');

insert into RelConDetail
values
('P8','RC3','Heart Attack');

insert into RelConDetail
values
('P9','RC3','Heart Attack');

insert into RelConDetail
values
('P10','RC1','Chinese herbs3');

insert into RelConDetail
values
('P11','RC1','Botanical medicine3');

insert into RelConDetail
values
('P12','RC1','Botanical medicine3');

insert into RelConDetail
values
('P13','RC1','Botanical medicine4');

insert into RelConDetail
values
('P1','RC1','Botanical medicine4');

insert into RelConDetail
values
('P10','RC1','Seafood');

insert into RelConDetail
values
('P11','RC1','Honey');

insert into RelConDetail
values
('P11','RC1','Flower');

insert into RelConDetail
values
('P12','RC1','Peanut');

insert into RelConDetail
values
('P13','RC1','Egg');
