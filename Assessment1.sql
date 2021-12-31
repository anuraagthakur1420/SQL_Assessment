create database trainer;
use trainer;

create table trainer_info(Trainer_Id varchar(20) UNIQUE NOT NULL PRIMARY KEY, Salutaion varchar(7), Trainer_Name varchar(30), Trainer_Location varchar(30), Trainer_Track varchar(15), Trainer_Qualification varchar(100), Trainer_experience int(11), Trainer_Email varchar(100), Trainer_Password varchar(20));
create table Batch_Info(Batch_Id varchar(20) UNIQUE NOT NULL PRIMARY KEY, Batch_Owner varchar(30), Batch_BU_Name varchar(30));
create table Module_Info(Module_Id varchar(20) UNIQUE NOT NULL PRIMARY KEY, Module_Name varchar(40), Module_Duration int(11));
create table Associate_Info(Associate_Id varchar(20) UNIQUE NOT NULL PRIMARY KEY, Salutation varchar(7), Associate_Name varchar(30), Associate_Location varchar(30), Associate_Track varchar(15), Associate_Qualification varchar(200), Associate_Email varchar(100), Associate_Password varchar(20));
create table Questions(Question_Id varchar(20) UNIQUE NOT NULL PRIMARY KEY, Module_Id varchar(20), Questions_Text varchar(900), FOREIGN KEY(Module_Id) REFERENCES Module_Info(Module_Id));
create table Associate_Status(Associate_Id varchar(20), Module_Id varchar(20), Start_Date varchar(20), End_Date varchar(20), AFeedbackGiven varchar(20), TFeedbackGiven varchar(20),FOREIGN KEY(Module_Id) REFERENCES Module_Info(Module_Id), FOREIGN KEY(Associate_Id) REFERENCES Associate_Info(Associate_Id) );
create table Trainer_Feedback(Trainer_Id varchar(20), Question_Id varchar(20), Batch_Id varchar(20), Module_Id varchar(20), Trainer_Rating int(11), FOREIGN KEY(Module_Id) REFERENCES Module_Info(Module_Id), FOREIGN KEY(Batch_Id) REFERENCES Batch_Info(Batch_Id), FOREIGN KEY(Trainer_Id) REFERENCES Trainer_Info(Trainer_Id), FOREIGN KEY(Question_Id) REFERENCES Questions(Question_Id) );
create table Associate_Feedback(Associate_Id varchar(20), Question_Id varchar(20), Module_Id varchar(20), Associate_Rating int(11), FOREIGN KEY(Module_Id) REFERENCES Module_Info(Module_Id), FOREIGN KEY(Associate_Id) REFERENCES Associate_Info(Associate_Id), FOREIGN KEY(Question_Id) REFERENCES Questions(Question_Id) );
create table Login_Tables(User_Id varchar(20), User_Password varchar(20));

# Q1.Modify the table Associate_Status to include batch_id and trainer_id & Modifying data type of column
alter table Associate_Status ADD Batch_Id varchar(20);
alter table Associate_Status ADD Trainer_Id varchar(20);
alter table Associate_Status ADD FOREIGN KEY(Batch_Id) REFERENCES Batch_Info(Batch_Id);
alter table Associate_Status ADD FOREIGN KEY(Trainer_Id) REFERENCES trainer_info(Trainer_id);
alter table Associate_Status MODIFY COLUMN Start_Date DATE;
alter table Associate_Status MODIFY COLUMN End_Date DATE;

# Q2.INSERT VALUES INTO TABLE - TRAINER INFO
INSERT INTO trainer_info VALUES ('F001','Mr.','PANKAJ GHOSH','Pune','Java','Bachelor of Technology',12,'Pankaj.Ghosh@alliance.com','fac1@123');
INSERT INTO trainer_info VALUES ('F002','Mr.','SANJAY RADHAKRISHNAN','Bangalore','DotNet','Bachelor of Technology',12,'Sanjay.Radhakrishnan@alliance.com','fac2@123');
INSERT INTO trainer_info VALUES ('F003','Mr.','VIJAY MATHUR','Chennai','Mainframe','Bachelor of Technology',10,'Vijay.Mathur@alliance.com','fac3@123');
INSERT INTO trainer_info VALUES ('F004','Mrs.','NANDINI NAIR','Kolkata','Java','Master of Computer Applications',9,'Nandini.Nair@alliance.com','fac4@123');
INSERT INTO trainer_info VALUES ('F005','Miss.','ANITHA PAREKH','Hyderabad','Testing','Master of Computer Applications',6,'Anitha.Parekh@alliance.com','fac5@123');
INSERT INTO trainer_info VALUES ('F006','Mr.',',MANOJ AGRAWAL','Mumbai','Mainframe','Bachelor of Technology',9,'Manoj.Agrawal@alliance.com','fac6@123');
INSERT INTO trainer_info VALUES ('F007','Ms.','MEENA KULKARNI','Coimbatore','Testing','Bachelor of Technology',15,'Meena.Kulkarni@alliance.com','fac7@123');
INSERT INTO trainer_info VALUES ('F008','Mr.','SAGAR MENON','Mumbai','Java','Bachelor of Technology',12,'Sagar.Menon@alliance.com','fac8@123');

# Q2.INSERT VALUES INTO TABLE - TRAINER INFO
INSERT INTO Batch_Info VALUES( 'B001', 'MRS.SWATI ROY', 'MSP');
INSERT INTO Batch_Info VALUES( 'B002', 'MRS.ARURNA K', 'HEALTHCARE');
INSERT INTO Batch_Info VALUES( 'B003', 'MR.RAJESH KRISHNAN', 'LIFE SCIENCES');
INSERT INTO Batch_Info VALUES( 'B004', 'MR.SACHIN SHETTY', 'BFS');
INSERT INTO Batch_Info VALUES( 'B005', 'MR.RAMESH PATEL', 'COMMUNICATIONS');
INSERT INTO Batch_Info VALUES( 'B006', 'MRS.SUSAN CHERIAN', 'RETAIL & HOSPITALITY');
INSERT INTO Batch_Info VALUES( 'B007', 'MRS.SAMPADA JAIN', 'MSP');
INSERT INTO Batch_Info VALUES( 'B008', 'MRS.KAVITA REGE', 'BPO');
INSERT INTO Batch_Info VALUES( 'B009', 'MR.RAVI SEJPAL', 'MSP');

#Q3.INSERT VLAUES INTO TABLE - MODULE INFO
INSERT INTO module_info VALUES('O10SQL', 'Oracle 10g SQL ',16);
INSERT INTO module_info VALUES('O10PLSQL', 'Oracle 10g PL/ SQL ',16);
INSERT INTO module_info VALUES('J2SE', 'Core Java SE 1.6',288);
INSERT INTO module_info VALUES('J2EE', 'Advanced Java EE 1.6',80);
INSERT INTO module_info VALUES('JAVAFX', 'JavaFX 2.1',80);
INSERT INTO module_info VALUES('DOTNT4', '.Net Framework 4.0 ',50);
INSERT INTO module_info VALUES('SQL2008', 'MS SQl Server 2008',120);
INSERT INTO module_info VALUES('MSBI08', 'MS BI Studio 2008',158);
INSERT INTO module_info VALUES('SHRPNT', 'MS Share Point ',80);
INSERT INTO module_info VALUES('ANDRD4', 'Android 4.0',200);
INSERT INTO module_info VALUES('EM001', 'Instructor',0);
INSERT INTO module_info VALUES('EM002', 'Course Material',0);
INSERT INTO module_info VALUES('EM003', 'Learning Effectiveness',0);
INSERT INTO module_info VALUES('EM004', 'Environment',0);
INSERT INTO module_info VALUES('EM005', 'Job Impact',0);
INSERT INTO module_info VALUES('TM001', 'Attendees',0);
INSERT INTO module_info VALUES('TM002', 'Course Material',0);
INSERT INTO module_info VALUES('TM003', 'Environment',0);

#Q4. INSERT VALUES INTO TABLE - ASSOCIATE INFO
INSERT INTO ASSOCIATE_INFO VALUES('A001', 'Miss.','GAYATHRI NARAYANAN','Gurgaon', 'Java','Bachelor of Technology','Gayathri.Narayanan@hp.com', 'tne1@123');
INSERT INTO ASSOCIATE_INFO VALUES('A002', 'Mrs.','RADHIKA MOHAN','Kerala', 'Java','Bachelor of Engineering In Information Technology','Radhika.Mohan@cognizant.com', 'tne2@123');
INSERT INTO ASSOCIATE_INFO VALUES('A003', 'Mr.','KISHORE SRINIVAS','Chennai', 'Java','Bachelor of Engineering In Computers','Kishore.Srinivas@ibm.com', 'tne3@123');
INSERT INTO ASSOCIATE_INFO VALUES('A004', 'Mr.','ANAND RANGANATHAN','Mumbai', 'DotNet','Master of Computer Applications','Anand.Ranganathan@finolex.com', 'tne4@123');
INSERT INTO ASSOCIATE_INFO VALUES('A005', 'Miss.','LEELA MENON','Kerala', 'Mainframe','Bachelor of Engineering In Information Technology','Leela.Menon@microsoft.com', 'tne5@123');
INSERT INTO ASSOCIATE_INFO VALUES('A006', 'Mrs.','ARTI KRISHNAN','Pune', 'Testing','Master of Computer Applications','Arti.Krishnan@cognizant.com', 'tne6@123');
INSERT INTO ASSOCIATE_INFO VALUES('A007', 'Mr.','PRABHAKAR SHUNMUGHAM','Mumbai', 'Java','Bachelor of Technology','Prabhakar.Shunmugham@honda.com', 'tne7@123');

#Q5. INSERT VALUES INTO TABLE - QUESTION
INSERT INTO questions VALUES('Q001', 'EM001','Instructor knowledgeable and able to handle all your queries');
INSERT INTO questions VALUES('Q002', 'EM001','All the topics in a particular course handled by the trainer without any gaps or slippages');
INSERT INTO questions VALUES('Q003', 'EM002','The course materials presentation , handson etc. refered during the training are relevant and useful.');
INSERT INTO questions VALUES('Q004', 'EM002','The Hands on session adequate enough to grasp the understanding of the topic.');
INSERT INTO questions VALUES('Q005', 'EM002','The reference materials suggested for each module are adequate.');
INSERT INTO questions VALUES('Q006', 'EM003','Knowledge and skills presented in this training are applicatible at your work');
INSERT INTO questions VALUES('Q007', 'EM003','This training increases my proficiency level');
INSERT INTO questions VALUES('Q008', 'EM004','The physical environment e.g. classroom space , air-conditioning was conducive to learning.');
INSERT INTO questions VALUES('Q009', 'EM004','The software/hardware environment provided was sufficient for the purpose of the training.');
INSERT INTO questions VALUES('Q010', 'EM005','This training will improve your job performance.');
INSERT INTO questions VALUES('Q011', 'EM005','This training align with the business priorities and goals.');
INSERT INTO questions VALUES('Q012', 'TM001','Participants were receptive and had attitude towards learning.');
INSERT INTO questions VALUES('Q013', 'TM001','All participats gained the knowledge and the practical skills after this training.');
INSERT INTO questions VALUES('Q014', 'TM002','The course materials presentation, handson- etc. available for the session covers the entire objectives of the course.');
INSERT INTO questions VALUES('Q015', 'TM002','Complexity of the course is adequate for the particpate level.');
INSERT INTO questions VALUES('Q016', 'TM002','Case study and practical demos helpful in understanding of the topic');
INSERT INTO questions VALUES('Q017', 'TM003','The physical environment e.g. classroom space, air,conditioning was conducive to learning.');
INSERT INTO questions VALUES('Q018', 'TM003','The software/hardware environment provided was adequate for the purpose of the training.');

select *
from INFORMATION_SCHEMA.COLUMNS
where TABLE_NAME='Associate_Status';

#Q5. INSERT VALUES INTO TABLE - ASSOCIATE_STATUS - INCOMPLETE DATA 
INSERT INTO Associate_Status VALUES('A001', 'O10SQL','B001','F001', '2000-12-15','2000-12-25');
INSERT INTO Associate_Status VALUES('A002', 'O10SQL','B001','F001', '2000-12-15','2000-12-25');
INSERT INTO Associate_Status VALUES('A003', 'O10SQL','B001','F001', '2000-12-15','2000-12-25');
INSERT INTO Associate_Status VALUES('A001', 'O10PLSQL','B002','F002', '2001-2-1','2001-2-12');
INSERT INTO Associate_Status VALUES('A002', 'O10PLSQL','B002','F002', '2001-2-1','2001-2-12');
INSERT INTO Associate_Status VALUES('A003', 'O10PLSQL','B002','F002', '2001-2-1','2001-2-12');
INSERT INTO Associate_Status VALUES('A001', 'J2SE','B003','F003', '2002-8-20','2002-10-25');
INSERT INTO Associate_Status VALUES('A002', 'J2SE','B003','F003', '2002-8-20','2002-10-25');
INSERT INTO Associate_Status VALUES('A001', 'J2EE','B004','F004', '2005-12-1','2005-12-25');
INSERT INTO Associate_Status VALUES('A002', 'J2EE','B004','F004', '2005-12-1','2005-12-25');
INSERT INTO Associate_Status VALUES('A003', 'J2EE','B004','F004', '2005-12-1','2005-12-25');
INSERT INTO Associate_Status VALUES('A004', 'J2EE','B004','F004', '2005-12-1','2005-12-25');
INSERT INTO Associate_Status VALUES('A005', 'JAVAFX','B005','F006', '2005-12-4','2005-12-20');
INSERT INTO Associate_Status VALUES('A006', 'JAVAFX','B005','F006', '2005-12-4','2005-12-20');
INSERT INTO Associate_Status VALUES('A006', 'SQL2008','B006','F007', '2007-6-21','2007-6-28');
INSERT INTO Associate_Status VALUES('A007', 'SQL2008','B006','F007', '2007-6-21','2007-6-28');
INSERT INTO Associate_Status VALUES('A002', 'MSBI08','B007','F006', '2009-6-26','2009-6-29');
INSERT INTO Associate_Status VALUES('A003', 'MSBI08','B007','F006', '2009-6-26','2009-6-29');
INSERT INTO Associate_Status VALUES('A004', 'MSBI08','B007','F006', '2009-6-26','2009-6-29');
INSERT INTO Associate_Status VALUES('A002', 'ANDRD4','B008','F005', '2010-6-5','2010-6-28');
INSERT INTO Associate_Status VALUES('A005', 'ANDRD4','B008','F005', '2010-6-5','2010-6-28');
INSERT INTO Associate_Status VALUES('A003', 'ANDRD4','B009','F005', '2011-8-1','2011-8-20');
INSERT INTO Associate_Status VALUES('A006', 'ANDRD4','B009','F005', '2011-8-1','2011-8-20');

#----------------------------------------------------------------------------------------------------------------------------------------------------------------
#Excercise 2

#Q1
UPDATE trainer_info SET trainer_password = 'nn4@123' WHERE trainer_id = 'F004';

#Q2




