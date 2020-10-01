create database demo;
use demo;

/*
Entities
-Account
-Administration
-Student
-Professor
-Department
-Courses
-Time_Slots
-Study_Material

Relationships
-Admin_Account_Relation
-Student_Account_Relation
-Professor_Account_Relation
-Courses_Student_Relation
-Courses_Professor_Relation
-Courses_Time_Slots_Relation
*/

create table Administration(
Admin_ID varchar(30),
primary key(Admin_ID)
);
/*drop table Administration*/

create table Account(
User_ID_ varchar(30),
Password_ varchar(30) not null,
Type_ varchar(15) not null, 
check( Type_='student' or Type_='professor' or Type_='admin' ),
primary key(User_ID_)
);
/*drop table Account*/

create table Admin_Account_Relation(
Admin_ID varchar(30),
User_ID_ varchar(30),
primary key(User_ID_),
foreign key(Admin_ID) references Administration(Admin_ID),
foreign key(User_ID_) references Account(User_ID_)
);
/*drop table Admin_Account_Relation*/

create table Department(
Dept_ID int,
D_Name varchar(40) not null,
primary key(Dept_ID)
);
/*drop table Department;*/

create table Student(
Roll_No int,
S_Name varchar(40),
Program_Enrolled varchar(5),
Year_Of_Study int,
Department_ID int,
check ( Program_Enrolled='B.Tech' or Program_Enrolled='M.Tech' or Program_Enrolled='PhD' or Program_Enrolled='MS' or Program_Enrolled='M.Sc'),
primary key(Roll_No),
foreign key(Department_ID) references Department(Dept_ID)
);
/*drop table Student*/

create table Professor(
Employee_ID int,
P_Name varchar(40) not null,
Post varchar(30),
Department_ID int,
primary key(Employee_ID),
foreign key(Department_ID) references Department(Dept_ID)
);
/*drop table Professor*/

create table Student_Account_Relation(
Roll_No int,
User_ID_ varchar(30),
primary key(User_ID_),
foreign key(Roll_No) references Student(Roll_No),
foreign key(User_ID_) references Account(User_ID_)
);
/*drop table Student_Account_Relation*/

create table Professor_Account_Relation(
Employee_ID int,
User_ID_ varchar(30),
primary key(User_ID_),
foreign key(Employee_ID) references Professor(Employee_ID),
foreign key(User_ID_) references Account(User_ID_)
);
/*drop table Professor_Account_Relation*/

create table Courses(
Course_Code varchar(7),
Course_Name varchar(50) not null,
Class_Link varchar(200),
Credits varchar(5) not null,
primary key(Course_Code)
);
/*drop table Courses*/

create table Courses_Student_Relation(
Course_Code varchar(7),
Roll_No int,
Attendance int,
check(Attendance<=100 and Attendance>=0),
primary key(Course_Code,Roll_No),
foreign key(Roll_no) references Student(Roll_No),
foreign key(Course_Code) references Courses(Course_Code)
);
/*drop table Courses_Student_Relation*/

create table Courses_Professor_Relation(
Course_Code varchar(7),
Employee_ID int,
primary key(Course_Code,Employee_ID),
foreign key(Employee_ID) references Professor(Employee_ID),
foreign key(Course_Code) references Courses(Course_Code)
);
/*drop table Courses_Professor_Relation*/

create table Time_Slots(
Day_Time varchar(20),
primary key(Day_Time)
);
/*drop table Time_Slots*/

create table Courses_Time_Slots_Relation(
Course_Code varchar(7),
Day_Time varchar(20),
primary key(Day_Time,Course_Code),
foreign key(Day_Time) references Time_Slots(Day_Time),
foreign key(Course_Code) references Courses(Course_Code)
);
/*drop table Courses_Time_Slots_Relation*/

create table Study_Material(
Material_No int,
Link varchar(200),
Course_Code varchar(7),
primary key(Material_No),
foreign key(Course_Code) references Courses(Course_Code)
);
/*drop table Study_Material*/
