drop database if exists Testing_System_Assignment_1;
create database if not exists Testing_System_Assignment_1;
use Testing_System_Assignment_1;
drop table if exists Department;
create table if not exists Department(
DepartmentID tinyint primary key auto_increment,
DepartmentName varchar(50) not null unique
);
drop table if exists `Position`;
create table if not exists `Position`(
PositionID tinyint primary key auto_increment,
PositionName varchar(50) not null unique
);
drop table if exists `Account`;
create table if not exists `Account`(
AccountID int primary key auto_increment,
Email varchar(50) not null unique,
Username varchar(50) not null unique,
FullName varchar(50),
DepartmentID tinyint,
PositionID tinyint,
constraint DepartmentID foreign key(DepartmentID) references Department(DepartmentID),
constraint PositionID foreign key(PositionID) references `Position`(PositionID),
CreateDate date
);
drop table if exists `Group`;
create table if not exists `Group`(
GroupID int primary key auto_increment,
GroupName varchar(50) not null,
CreatorID int,
CreateDate date
);
drop table if exists GroupAccount;
create table if not exists GroupAccount(
GroupID int primary key auto_increment,
AccountID int,
constraint GroupID foreign key(GroupID) references `Group`(GroupID),
constraint AccountID foreign key(AccountID) references `Account`(AccountID),
JoinDate date
);