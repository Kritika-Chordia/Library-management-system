create database Library_Management_System;
use Library_Management_System;

create table Book_details(
book_title varchar(100),
language varchar (50) ,
book_code char (50),
book_price int,
publisher varchar(20),
primary key (book_code)
);

insert  into Book_details values ("marketing management",'english','15cs2','3000','Boxoff');
insert into Book_details values ('digital marketing','english','14bc3','4500','shivmaa');
insert  into Book_details values ('artificial intelligence','german','12df6','1300','maradona');
insert  into Book_details values ('basic electrical engineering','hindi','14hv8','2000','vijay sharma');
insert into Book_details values ('software engineering','english','13sa9','1700','Ajay shrivastav');
insert into Book_details values ('Management studies','german','45hu0','1500','Ragini arora');
insert into Book_details values ('Discreate mathematics','hindi','67ji9','2000','Saroj fernandice');


select* from Book_details;
select book_title from Book_details where book_title like '%ig%';
select book_title from Book_details where book_title like '%ma%';
select book_title from Book_details order by book_title;
select language, sum(book_price) from Book_details group by language;
select language, avg (book_price) from Book_details group by language having avg(book_price)>=1500;

create table Student(
student_id char(10),
student_name varchar (40),
student_mobileno char(10) ,
fee int ,
primary key (student_id)
);

insert into Student values('19cse052','khushi','882432',500);
insert into Student values('19cse053','kritika','935231',300);
insert into Student values('19cse054','lanisha','759711',100);
insert into Student values('19cse055','lubhani','786657',400);
insert into Student values('19cse056','madhu','456890',200);
insert into Student values('19cse057','mahika','678932',450);
insert into Student values('19cse058','manali','890123',300);
insert into Student values('19cse059','manisha','678453',500);


select * from Student ;
select student_name from Student where fee >100 and fee<500;
alter table Student add section char;
alter table Student drop student_mobileno;
select * from Student;
update Student set fee = fee+10 where fee<350;
select * from Student;


create table issue_detail(
issue_id int,
issue_name varchar (20),
issue_mobilebo char (10),
issue_bookname varchar(50),
issue_cost int,
primary key (issue_id)
);


insert into issue_detail values(1551,'khushi','882432','artificial intelligence',500);
insert into issue_detail values(1552,'kritika','935231','digital marketing ',300);
insert into issue_detail values(1553,'lanisha','759711','marketing management',100);
insert into issue_detail values(1554,'lubhani','786657','software engineering',400);
insert into issue_detail values(1555,'madhu','456890','discreate mathematics',200);
insert into issue_detail values(1556,'mahika','647221','basic electrical engineering',450);
insert into issue_detail values(1557,'manali','772311','digital marketing',300);

select * from issue_detail;
select issue_name, issue_bookname from issue_detail where issue_bookname = 'digital marketing'; 
select sum(issue_cost) from issue_detail ;
select min(issue_cost) from issue_detail ;
(select issue_name from issue_detail where issue_cost>350) union (select issue_name from issue_detail where issue_cost <500);

create table return_detail(
return_id int,
return_name varchar (30),
bookname char (50),
primary key (return_id),
foreign key(return_id) references issue_detail(issue_id)
);

insert into return_detail values(1551,'khushi','artificial intelligence');
insert into return_detail values(1553,'lanisha','marketing management');
insert into return_detail values(1555,'madhu','discreate mathematics');
insert into return_detail values(1556,'mahika','basic electrical engineering');


select * from return_detail;
select issue_cost , return_name from issue_detail , return_detail where (issue_cost, return_name)=(500,'khushi');
select * from employee ,issue_detail;

create table employee(
employee_name varchar (20),
employee_id int ,
salary int,
post varchar (20),
primary key (employee_id)
);

insert into employee values ('Ramesh ojha',1221,15000,'cashier');
insert into employee values ('Nikhil jain',1222,10000,'issuer');
insert into employee values ('suman chaturvedi',1223,13000,'bcollector');
insert into employee values ('priya rana',1224,9000,'maintainer');
insert into employee values ('sakhshi laxmipat',1225,14000,'cashier');
insert into employee values ('aradhya sen',1226,16000,'publisher');
insert into employee values ('anaya thakur',1227,13000,'bcollector');
insert into employee values ('yogendra sahu',1228,11000,'stock keeper');
insert into employee values ('hitesh ramanya',1229,4000,'cleaner');


select * from employee;
select avg (salary) from employee where post='cashier';
select count(distinct employee_name) from employee where salary >= 12000;
select max(salary) from employee;
select distinct post from employee;
select all post from employee;
select post as post_name from employee;


