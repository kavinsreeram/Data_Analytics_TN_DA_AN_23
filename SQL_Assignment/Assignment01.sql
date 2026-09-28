-- Active: 1790577845869@@localhost@3306@employee
CREATE DATABASE 
    DEFAULT CHARACTER SET = 'utf8mb4';

CREATE DATABASE employee;
use employee;
CREATE table departments(
    epartment_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);
CREATE TABLE location (
location_id INT PRIMARY KEY,
location VARCHAR(30)
);

CREATE TABLE employees (
 employee_id INT PRIMARY KEY,
 employee_name VARCHAR(50),
 gender ENUM('M', 'F'),
 age INT,
 hire_date DATE,
 designation VARCHAR(100),
 department_id INT,
 location_id INT,
 salary decimal(10,2));

 alter table employees add column email varchar(100);
alter table employees modify column designation text;  
alter table employees drop column age;
alter table employees change column hire_date date_of_joining date;
rename table departments to Departments_Info;
Rename table location to Locations;
truncate table employees;
drop table employees;
drop database employee;
drop database if exists employee;
create database employee;
use employee;
create table departments (
    department_id int primary key,
    department_name varchar(100) not null unique
);
create table location (
    location_id int auto_increment primary key,
    location varchar(30) not null unique
);

create table employees (
    employee_id int primary key,
    employee_name varchar(50) not null,
    gender enum('M', 'F'),
    age int check (age >= 18),
    hire_date date default (current_date),
    designation varchar(100),
    department_id int,
    location_id int,
    salary decimal(10,2),

    foreign key (department_id)
        references departments(department_id),

    foreign key (location_id)
        references location(location_id)
);
DESCRIBE employees;
DESCRIBE departments;
DESCRIBE location;
