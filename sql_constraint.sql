use demo;
select * from employee;

use learn55;
select * from stu;


----sql clause distinct unique values

select distinct city from employee;

--create the employee sal table

create table emp_sal(

EID varchar(5),
DEPT varchar(20),
DESI varchar(20),
DOJ datetime,
SALARY int



);
 drop table emp_sal;
INSERT INTO emp_sal (EID, DEPT, DESI, DOJ, SALARY) VALUES
('E0001', 'HR', 'Manager', '2020-01-15', 75000),
('E0002', 'Finance', 'Accountant', '2019-03-22', 55000),
('E0003', 'IT', 'Developer', '2021-07-01', 65000),
('E0004', 'Sales', 'Executive', '2018-06-19', 45000),
('E0005', 'Marketing', 'Coordinator', '2022-02-10', 50000),
('E0006', 'IT', 'Administrator', '2020-09-25', 70000),
('E0007', 'HR', 'Assistant', '2021-11-05', 40000);

select * from emp_sal;

---increase the salary by 10% who is manager

update emp_sal
set SALARY=SALARY+(SALARY*0.10)
where DESI='Manager';

-----------creating the employee column on lea55 database
drop table emp;

---creating a table
create table EMP(

EID varchar(5) primary key,
NAME varchar(40),
ADDR varchar(30),
CITY varchar(30) Default 'kolkata',
PHONE char(15) unique,
DOB   date check (DOB<'01-JAN-2000'),
EMAIL varchar(50)
);


---inserting values

insert into EMP (EID,NAME,ADDR,CITY,PHONE,DOB,EMAIL)
values('E0001','satyajit prakash','pune 45 number house','pune','9831433923','18-JAN-1997','satyajit.work@hotmail.com');

insert into EMP (EID,NAME,ADDR,CITY,PHONE,DOB,EMAIL)
values('E0002','Rahul sharma','c2 janak pura delhi','delhi','6290590991','15-FEB-1997','Rahul.sharma76@gmail.com');

-----default city value  kolkata
insert into EMP (EID,NAME,ADDR,PHONE,DOB,EMAIL)
values('E0003','Pronay das','VIP road ruby park','7002590991','10-DEC-1997','Pronay.das.ece@gmail.com');

-----DOB greater 2000 to test check constraint
insert into EMP (EID,NAME,ADDR,CITY,PHONE,DOB,EMAIL)
values('E0004','Mohan prakash','gandhi nagar 56 gully','uttar pradesh','8831433890','18-JAN-2004','Mohan.UP@gmail.com');

---DOB less than 2000 to test check constraint
insert into EMP (EID,NAME,ADDR,CITY,PHONE,DOB,EMAIL)
values('E0004','Mohan prakash','gandhi nagar 56 gully','uttar pradesh','8831433890','18-JAN-1999','Mohan.UP@gmail.com');

insert into EMP (EID,NAME,ADDR,CITY,PHONE,DOB,EMAIL)
values('E0005','Rohan sarkar','puran block no 87','chandigarh','9876433890','18-oct-1996','Rohan.sarkar89@gmail.com');



--querying the table
select * from EMP;

----lets add not null constraint to our column name that column shouldn't have the null value
 alter table EMP
 alter column name varchar(40) NOT NULL;

 ---adding default constraint to the city column value default kolkata

 alter table EMP
add CONSTRAINT R1 default 'kolkata' for city; 

----adding unique constrain to the phone
alter table emp
add constraint R2 unique(PHONE);

----check constraint it is used to implement condition on a field

alter table emp
add constraint R3 check (DOB<'01-JAN-2000');


alter table emp
alter column EID char(5) not null;
-----primary key cannot be duplicated and cannot leave blank before that we have to make column as not null
alter table emp
add constraint pk primary key (EID);

--drop constraint
alter table emp
drop constraint r1;

-- foreign key constraint

----requirement is if any employee is present in the salary table that employee should present in employee table first

------creating salary table

create table emp_sal(
EID varchar(5) references emp (eid),
DEPT varchar(20),
DESI varchar(20),
SALARY int
);


insert into emp_sal(EID,DEPT,DESI,SALARY)
values('E0006','IT','senior associate',78000);

insert into emp_sal(EID,DEPT,DESI,SALARY)
values('E0002','HR','senior HR',60000);

-----querying both table
select * from EMP;
select * from emp_sal;


---update 
update emp_sal set EID='E0001';

---add constraint to the emp_sal foreing key constraint
ALTER TABLE emp_sal
ADD CONSTRAINT fkid FOREIGN KEY (EID) REFERENCES EMP (EID);

---------------------------------------------------------------------------------
----create assignment database

create database assignments;
use assignments;


-----create employee table

create table EMP_D(
EMPID char(5) primary key,
Name varchar(30) not null,
ADDR varchar(40) check (not ADDR like '%uttam%nagar%'),
CITY varchar(40) check (CITY in ('delhi','gurgaon','faridabad','noida')),
PHONE_NO varchar(15) unique,
EMAIL varchar(40) check (EMAIL like '%gmail.com'),
DOB   date  check (DOB<'1-jan-2000')

);

-------create the salary table
create table EMP_SAL(
EMPID char(5) references EMP_D (EMPID),
DEPT varchar(20) default 'temp', check (DEPT in ('HR','OPS','MIS','IT','ADMIN','TEMP')),
DESI varchar(30) check (DESI in ('ASSO','MGR','VP','DIR')),
BASIC int check (BASIC >= 20000),
DOJ date
);


----------query tables---
select * from EMP_D;
select * from EMP_SAL;


-----------------------insert values into the employee details table------

INSERT INTO EMP_D (EMPID, Name, ADDR, CITY, PHONE_NO, EMAIL, DOB)
VALUES ('E003', 'Amit Verma', '111 Orchard Street', 'delhi', '9345678901', 'amit.verma@gmail.com', '1995-02-28'),
('E004', 'Sita Rani', '202 Maple Avenue', 'noida', '9123456788', 'sita.rani@gmail.com', '1996-07-15'),
('E005', 'Rajeev Kumar', '303 Sunset Blvd', 'gurgaon', '9988776655', 'rajeev.kumar@gmail.com', '1998-09-30'),
('E007', 'Sukhveer singh', '39 bus stand Lane', 'noida', '915637465', 'sukhveer@gmail.com', '1997-12-12'),
('E008', 'Priya Sharma', 'rajori garden 34 number ', 'delhi', '8292837465', 'priya.sharma@gmail.com', '1997-04-12'),
('E009', 'Priya Sharma', 'sikkim homet own lane', 'faridabad', '6292837465', 'priya.sharma2@gmail.com', '1997-08-20'),
('E010', 'Nitu singh', 'cp cannut place 34 new lane', 'faridabad', '7892837465', 'nitu.singh@gmail.com', '1999-08-15'),
('E011', 'aman parihar', '404 Riverside Lane', 'gurgaon', '7845837465', 'aman.parihar@gmail.com', '1996-11-12'),
('E012', 'dev khuranna', '404 Riverside Lane', 'noida', '9178837465', 'dev.khuraanna@gmail.com', '1992-11-01');

INSERT INTO EMP_D (EMPID, Name, ADDR, CITY, PHONE_NO, EMAIL, DOB)
VALUES ('E006', 'paul das', 'reshmi cinema 45 gully', 'delhi', '6290690991', 'paul.das2@gmail.com', '1995-05-15');

INSERT INTO EMP_D (EMPID, Name, ADDR, CITY, PHONE_NO, EMAIL, DOB)
VALUES ('E013', 'Rima das', 'picnic cinema 45 gully', 'delhi', '6290690881', 'rima.das2@gmail.com', '1995-06-15');


-- Valid Insert
INSERT INTO EMP_D (EMPID, Name, ADDR, CITY, PHONE_NO, EMAIL, DOB)
VALUES ('E001', 'John Doe', '123 Main Street', 'delhi', '9876543210', 'johndoe@gmail.com', '1995-05-15');

-- Another valid Insert
INSERT INTO EMP_D (EMPID, Name, ADDR, CITY, PHONE_NO, EMAIL, DOB)
VALUES ('E002', 'Jane Smith', '456 Park Avenue', 'noida', '9123456789', 'janesmith@gmail.com', '1998-11-22');

-- Invalid Insert: Will fail because ADDR contains "uttam nagar"
INSERT INTO EMP_D (EMPID, Name, ADDR, CITY, PHONE_NO, EMAIL, DOB)
VALUES ('E003', 'Ravi Kumar', '789 Uttam Nagar Road', 'gurgaon', '9112345678', 'ravi.kumar@gmail.com', '1997-03-10');

-- Invalid Insert: Will fail because CITY is not in the allowed list
INSERT INTO EMP_D (EMPID, Name, ADDR, CITY, PHONE_NO, EMAIL, DOB)
VALUES ('E004', 'Neha Sharma', '101 Greenway Blvd', 'mumbai', '9801234567', 'neha.sharma@gmail.com', '1996-08-20');

-- Invalid Insert: Will fail because EMAIL does not end with 'gmail.com'
INSERT INTO EMP_D (EMPID, Name, ADDR, CITY, PHONE_NO, EMAIL, DOB)
VALUES ('E005', 'Ajay Patel', '202 Lakeview', 'faridabad', '9976543210', 'ajay.patel@yahoo.com', '1999-12-25');

-- Invalid Insert: Will fail because DOB is after 1st January 2000
INSERT INTO EMP_D (EMPID, Name, ADDR, CITY, PHONE_NO, EMAIL, DOB)
VALUES ('E006', 'Maya Singh', '303 Beach Road', 'noida', '9987654321', 'maya.singh@gmail.com', '2001-04-30');



-------------------insert values for salary table

INSERT INTO EMP_SAL (EMPID, DEPT, DESI, BASIC, DOJ)
VALUES 
('E001', 'ADMIN', 'MGR', 30000, '2015-06-01'),
('E002', 'HR', 'MGR', 45000, '2015-06-02'),
('E003', 'HR', 'ASSO', 25000, '2015-06-01'),
('E004', 'OPS', 'MGR', 30000, '2016-07-15'),
('E005', 'MIS', 'VP', 45000, '2017-08-20'),
('E007', 'IT', 'DIR', 60000, '2018-12-05'),
('E008', 'ADMIN', 'ASSO', 35000, '2019-01-15'),
('E009', 'TEMP', 'MGR', 25000, '2020-03-12'),
('E010', 'HR', 'ASSO', 22000, '2021-02-25'),
('E011', 'IT', 'VP', 50000, '2022-07-01'),
('E012', 'OPS', 'MGR', 28000, '2023-05-30');


INSERT INTO EMP_SAL (EMPID, DEPT, DESI, BASIC, DOJ)
VALUES 
('E006', 'IT', 'MGR', 55000, '2016-02-18');



---------------------------------


----clauses---
-----Between clause
select * from EMP_SAL
where basic between 20000 and 30000;

-----in clause check in list
select * from EMP_SAL
where dept in ('HR','IT');

---checking the pattern like name start with p 3rd character i rest any thing %

select * from emp_D
where name like 'p_i%';


----count the number of records
select count(*) as total_record 
from emp_D;

select count(EMPID) as total_employee
from emp_D;

----distinct
select distinct desi from emp_sal;

-----order by clause
select * 
from emp_sal
order by basic asc;

select * 
from emp_sal
order by basic desc;

select * 
from emp_sal
order by basic,dept desc;

select * 
from emp_sal
order by basic ,DOJ ASC,dept desc;

-------groupby clause finding aggregation sum avg in each group

select dept,sum(basic) as total_basic_in_each_dept
from EMP_sal
group by dept;

----we only use columns in query the column which is in group by and column which are aggregating on (here: dept and basic will be valid no other column we can right)
select desi,dept,sum(basic) as total_basic_in_each_dept
from EMP_sal
group by dept; 


select desi,dept,sum(basic) as total_basic_in_each_dept
from EMP_sal
group by dept,desi; 

select desi,dept,count(empID)as number_of_employees,sum(basic) as total_basic_in_each_dept
from EMP_sal
group by dept,desi; 

----we have to get the each dept where total salary in each dept  which is greater than 30k
select dept
from EMP_SAL
group by dept
having sum(basic) >65000;

select dept,sum(basic) as TS
from EMP_SAL
group by dept
having sum(basic) >65000;


--------------------------------------assignments------------


--Q city wise count of employees arranged in desc order
select* from emp_d;
select* from emp_sal;

select city,count(empID) as total_emp_per_city
from EMP_D
group by city
order by total_emp_per_city desc;

--Q name of the employees who dont have account on yahoo
select ed.name as employee_names,es.DEPT,es.DESI,es.DOJ
from emp_sal es
join  emp_d ed
on es.EMPID=ed.EMPID
where not ed.email like '%@yahoo.com';

--designation wise total cost and number of members araanged in decsending order of the total cost
select desi,sum(basic) as total_cost
from EMP_SAL
group by desi
order by total_cost desc;

------order of clauses
--where
--group by
--having
--order by

select * from EMP_SAL;

select desi,sum(basic) as ts
from EMP_SAL
where DOJ>'2015-06-01'
group by desi
having sum(basic) > 50000
order by ts desc;

--total number of employee and their total salary

select count(empid) as total_emp,
        sum(basic)  as total_sal
from emp_Sal


--total number of manager and their total salary

select count(empid) as total_manager,
       sum(basic) as total_sal
from EMP_SAL
where desi='MGR';

--now find in each dept how many manager are there and their total salary

select dept,count(empid) as no_mgr,sum(basic) as tot_sal
from EMP_SAL
where desi='MGR'
group by dept;



--now find in each dept how many manager are there and their total salary > 30000 and arranged data in desc order of total salry
select dept,count(empid) as no_mgr,sum(basic) as tot_sal
from EMP_SAL
where desi='MGR'
group by dept
having sum(basic) > 30000
order by tot_sal desc;


----------------------------------------joins-----------------------------------------
---joins are required when we need the data more than 1 table----------------------
select * from EMP_D;
select * from EMP_SAL;

-----inner join gives only matching record from both the table

select emp_d.name,emp_d.addr,EMP_D.city,EMP_SAL.dept,EMP_SAL.desi,EMP_SAL.basic
from EMP_D
inner join EMP_SAL
on EMP_D.EMPID=EMP_SAL.EMPID;

--------- right join records from right table and only matching from the left table
select emp_d.name,emp_d.addr,EMP_D.city,EMP_SAL.dept,EMP_SAL.desi,EMP_SAL.basic
from EMP_D
right join EMP_SAL
on EMP_D.EMPID=EMP_SAL.EMPID;

-----left join gives rec from the left table and only matching from right
select emp_d.name,emp_d.addr,EMP_D.city,EMP_SAL.dept,EMP_SAL.desi,EMP_SAL.basic
from EMP_D
left join EMP_SAL
on EMP_D.EMPID=EMP_SAL.EMPID;

-------full join

select emp_d.name,emp_d.addr,EMP_D.city,EMP_SAL.dept,EMP_SAL.desi,EMP_SAL.basic
from EMP_D
full join EMP_SAL
on EMP_D.EMPID=EMP_SAL.EMPID;

----cartesian join/cross join cross join doesn't accept on

select emp_d.name,emp_d.addr,EMP_D.city,EMP_SAL.dept,EMP_SAL.desi,EMP_SAL.basic
from EMP_D
cross join EMP_SAL;

-----cross join + where = inner join

select emp_d.name,emp_d.addr,EMP_D.city,EMP_SAL.dept,EMP_SAL.desi,EMP_SAL.basic
from EMP_D
cross join EMP_SAL
where EMP_D.EMPID=EMP_SAL.EMPID;

------self join there is nothing known as self join doen't make sense
--checking aggregation function
select sum(basic)
from emp_sal;

----------------- concept of self join
select * from EMP_D;

select c1.name,c1.addr,c2.city
from EMP_D c1
left join EMP_D c2
on c1.EMPID=c2.EMPID;

-------union clause common record appearded once no duplicate
----union used to combine the output combining left and right join

select emp_d.name,emp_d.addr,EMP_D.city,EMP_SAL.dept,EMP_SAL.desi,EMP_SAL.basic
from EMP_D
right join EMP_SAL
on EMP_D.EMPID=EMP_SAL.EMPID
union
select emp_d.name,emp_d.addr,EMP_D.city,EMP_SAL.dept,EMP_SAL.desi,EMP_SAL.basic
from EMP_D
left join EMP_SAL
on EMP_D.EMPID=EMP_SAL.EMPID;

---union it will just append one query with another query

select emp_d.name,emp_d.addr,EMP_D.city,EMP_SAL.dept,EMP_SAL.desi,EMP_SAL.basic
from EMP_D
right join EMP_SAL
on EMP_D.EMPID=EMP_SAL.EMPID
union all
select emp_d.name,emp_d.addr,EMP_D.city,EMP_SAL.dept,EMP_SAL.desi,EMP_SAL.basic
from EMP_D
left join EMP_SAL
on EMP_D.EMPID=EMP_SAL.EMPID;

----while union and aunion all structure of the query should be same its not like that we have to use join it will just union two separate query but structure shuld be same 
--means number of coulumn selected should be same 
 

select name,addr from EMP_D where city='delhi'
union 
select name,addr from EMP_D where city='noida';


-----display salary of the delhi employees
select emp_d.name,emp_d.addr,EMP_D.city,EMP_SAL.dept,EMP_SAL.desi,EMP_SAL.basic
from EMP_D
left join EMP_SAL
on EMP_D.EMPID=EMP_SAL.EMPID
where EMP_D.city='delhi';


----display all employees whose salary is not available/(is null, is not null)

select emp_d.name,emp_d.addr,EMP_D.city,EMP_SAL.dept,EMP_SAL.desi,EMP_SAL.basic
from EMP_D
left join EMP_SAL
on EMP_D.EMPID=EMP_SAL.EMPID
where EMP_SAL.EMPID is null;

----
use assignments;
------creating the inventory structure

create table supplier(
SID varchar(5) primary key,
sname varchar(30) not null,
sadd varchar(30) not null,
scity varchar(30) default 'delhi',
sphone varchar(30) unique,
semail varchar(30)
);

create table product_tb(
PID varchar(5) primary key,
PDESC varchar(30) not null,
Price int check (price > 0),
category varchar(30) check (category in ('IT','HA','SC')),
SID varchar(5) references supplier (SID)
);

create table stock(
PID varchar(5) references product_tb (PID),
SQTY int check (SQTY >=0),
ROL  int  check (ROL >0),
MOQ  int  check (MOQ >=5)
);

create table customer(

cid varchar(5) primary key,
cname varchar(40) not null,
caddress varchar(40) not null,
ccity varchar(40) not null,
cphone varchar(40) not null,
cemail varchar(40) not null,
CDOB date check (CDOB < '1-JAN-2000')

);

create table orders(
OID varchar(40) primary key,
ODATE Date,
PID varchar(5) references product_tb (PID),
CID varchar(5) references customer(CID),
OQTY int check (OQTY >= 1)
);

use assignments;



------index------------------
create index my_city_index on emp_d(city);
create clustered index my_index on emp_d(city);

select * from emp_d
where city = 'delhi';

----------- views/we can see the newly inserted data from view / we can insert record in view but it will reflect on table same for delete update
create view MY_VIEW
AS
  select * from emp_d
  where city = 'delhi';

select * from MY_VIEW;

----check before insertion of any data thru the view
CREATE VIEW new_view
AS
  SELECT * 
  FROM emp_d
  WHERE city = 'delhi'
WITH CHECK OPTION;

CREATE VIEW new_view_1
AS
  SELECT * 
  FROM emp_d
  WHERE city = 'delhi'
  WITH CHECK OPTION;


select * from new_view_1;


create view new_view2
AS
   select emp_d.name,emp_d.addr,EMP_D.city,EMP_SAL.dept,EMP_SAL.desi,EMP_SAL.basic as 'salary',EMP_SAL.basic * 0.15 'HRA'
   from EMP_D
   inner join EMP_SAL
   on EMP_D.EMPID=EMP_SAL.EMPID
   


select * from new_view2;

CREATE TABLE students (
    roll_number INT PRIMARY KEY,
    name VARCHAR(100),
    marks INT
);

INSERT INTO students (roll_number, name, marks)
VALUES
    (1, 'John Doe', 85),
    (2, 'Jane Smith', 90),
    (3, 'Alice Brown', 75),
    (4, 'Bob Johnson', 88),
    (5, 'Charlie Davis', 95),
    (6, 'David Clark', 82),
    (7, 'Eva Lewis', 91),
    (8, 'Frank Walker', 78),
    (9, 'Grace Scott', 85),
    (10, 'Hank White', 80),
    (11, 'Ivy Adams', 92),
    (12, 'Jack Green', 76),
    (13, 'Kelly Harris', 89),
    (14, 'Leo Martinez', 84),
    (15, 'Mona Garcia', 77);
INSERT INTO students (roll_number, name, marks)
VALUES
	(16, 'Jack paul', 76),
    (17, 'beelly moriis', 89),
    (18, 'theo Martinez', 84),
    (19, 'conten daz', 77);


------------------updating the view-----

---view can be updated under some certain condions

----creating the view of employee salary details along with the net slary hra gross salary etc

select * from EMP_SAL;
select * from EMP_D;

create view employee_details_1
as
	select sal_tb.EMPID, det_tb.Name, sal_tb.DOJ, sal_tb.DEPT, sal_tb.DESI, sal_tb.BASIC, sal_tb.BASIC*0.15 as 'HRA' , sal_tb.BASIC*0.9 as 'PF',
	((sal_tb.BASIC)+(sal_tb.BASIC*0.15)+(sal_tb.BASIC*0.9)) as 'NET'
	from EMP_SAL sal_tb
	inner join EMP_D det_tb
	on sal_tb.EMPID=det_tb.EMPID;

select * from employee_details_1;


------create a view of employee mangers  join in 2019---

create view manager_join_2020
as
	select s_tb.EMPID, d_tb.Name, s_tb.DESI, s_tb.DEPT, s_tb.DOJ
	from EMP_SAL s_tb
	inner join EMP_D d_tb
	on s_tb.EMPID=d_tb.EMPID
	where s_tb.DESI='MGR' and s_tb.DOJ like '2020%';


select * from manager_join_2020;

----------create the view to display the how many team member in each dept and in each city along with total and average salary

create view no_of_emp_per_city_dept
as
	select count(es.EMPID) as 'count of members',es.dept,ed.city,sum(es.basic) as 'total salary', AVG(es.basic) as 'avg salary'
	from EMP_SAL es
	inner join EMP_D ed
	on es.EMPID=ed.EMPID
	group by es.DEPT,ed.CITY;


select * from no_of_emp_per_city_dept;

----------------------------------------------------------

-----sql functions----
use assignments;
select * from EMP_D;
select * from EMP_SAL;

select count(empID) as 'no of employee',
       max(BASIC) as 'max salary',
	   min(basic) as 'min salary',
	   avg(basic) as 'avg salary',
	   sum(basic) as 'sum salary'
from EMP_SAL;

select SQRT(basic) as 'sqrt of basics'
from EMP_SAL;

select rand();

select CONCAT('sanjoy',' ','sarkar') as 'full name';

select * from students;

select roll_number,name,marks,
RANK() OVER (order by marks desc) as 'position',
DEnse_RANK() OVER (order by marks desc) as 'position2',
row_number() OVER (order by marks desc) as 'position3'
from students;


select ASCII('A') as 'col1', char(65);

select CHARINDEX('L','welcome')
select left('welcome',3)
select right('welcome',3)
select len('welcome')
select SUBSTRING('welcome',4,2)
select lower('WELCOME')
select replace('WELCOME','o','n')
select REVERSE('welcome')
select Stuff('welcome',2,3,'xvy')

select EMPID,Name,upper(CONCAT(addr,'      ',city))as 'complete address'
from EMP_D

select EMPID,Name,CONCAT_ws(addr,' ',city) as 'complete address'
from EMP_D

select EMPID,
left(name,charindex(' ',Name)) as 'first name',
RIGHT(name,len(name)-charindex(' ',Name)) as 'last name',
charindex(' ',Name) as 'position of space',
len(name) as 'length of name',
CONCAT_ws(addr,' ',city) as 'complete address'
from EMP_D;


select getdate()


select dateadd(d,90,getdate()),DATEADD(m,9,getdate()),dateadd(yy,2,getdate())

select EMPID,doj,DATEDIFF(d,doj,getdate()) as 'tenure'
from EMP_SAL;

select day(getdate()) as 'date',month(getdate()) as 'month', year(getdate()) as 'year'

select format(getdate(),'D'),format(getdate(),'M')

select empID,dept,doj
from EMP_SAL
where year(doj)=2020;

select empID,dept,doj,DATEADD(YY,1,doj) as 'confirmation date'
from EMP_SAL

---display the employees whose tenure is more than 5 years

select EMPID,doj,DATEDIFF(YY,doj,getdate()) as 'tenure'
from EMP_SAL
where DATEDIFF(YY,doj,getdate())>5;

---------give details of the managers whose birthday in october or november or december

select * from EMP_SAL;
select * from EMP_D;

select * 
from EMP_SAL es
inner join EMP_D ed
on es.EMPID=ed.EMPID
where MONTH(ed.DOB) in (10,11,12) and es.DESI='MGR';

select * from emp_d;

-----longest name

select * 
from EMP_D
where len(name)=(select max(len(name))
from EMP_D);


-----maximum salary of employee
select max(basic) as '3rd most salary'
from EMP_SAL
where BASIC not in(select top 2 basic
from EMP_SAL
order by BASIC desc);


-----designation who has highest total salary
SELECT top 1 desi, salary
FROM (
    SELECT DESI, SUM(basic) AS salary
    FROM EMP_SAL
    GROUP BY DESI
) AS Subquery
ORDER BY salary DESC;

--max salary

select top 1 eid,desi,salary
from EMP_SAL
order by salary desc;


SELECT eid, desi, salary
FROM EMP_SAL
WHERE salary = (SELECT MAX(salary) FROM EMP_SAL);

--------user define functions


use assignments;

select * from EMP_D
select * from EMP_SAL



----user define function

use test;
select * from EMP
select * from EMP_SAL

select * 
from EMP_SAL
where salary is null;

UPDATE EMP_SAL
SET salary = 50000  -- Replace with the correct value
WHERE eid = 1039;

DELETE FROM EMP
WHERE addr1 IS NULL;

select name , city, email
from emp
where len(name)=(select max(len(name)) from emp);

---user define function
CREATE FUNCTION myfunc(@A INT, @B INT)
RETURNS INT
AS
BEGIN
    DECLARE @C INT;
    SET @C = @A + @B;
    RETURN @C;
END;

--since myfunc is not build in function it is simply dbo object thats why we have to mention dbo.
SELECT dbo.myfunc(5, 10) AS Result;  -- This will return 15

CREATE FUNCTION CALCULATE(@X INT, @Y INT, @O char(1))
RETURNS INT
AS
BEGIN
    DECLARE @R INT;
    if @O='+'
	   set @R=@X+@Y
	else if @O='-'
	   set @R=@X-@Y
	else if @O='/'
	   set @R=@X/@Y
	else if @O='*'
	   set @R=@X*@Y	
	else
	    set @R=0
	return @R
END;

select dbo.CALCULATE(2,3,'z');


----creating email domain with function

CREATE FUNCTION company_email_generate(@id char(4), @name varchar(50), @D char(50))
RETURNS varchar(100)
AS
BEGIN
      declare @email varchar(100)
	  declare @Lenth_name int
	  declare @space_pos int
	  declare @firstname varchar(50)
	  declare @lastname varchar(50)
	 

	  set @Lenth_name=len(@name)
	  set @space_pos=CHARINDEX(' ',@name)
	  set @firstname=left(@name,1)
	  set @lastname=RIGHT(@name,@Lenth_name-@space_pos)

	  set @email=CONCAT(@firstname,@lastname,@id,'@',@D,'.com')
	  
	  return @email
end;

    

select EID, name, dbo.company_email_generate(EID,name,'learnbay') as company_email
from EMP;

------tabular functions return the rows and columns

select * from EMP;
select * from EMP_sal;

--- creating the tabular function for hr employees
create function dept_data(@dept varchar(50))
returns table
as
   return(select name,city,email 
		from emp
		inner join emp_sal
		on emp.eid=emp_sal.eid
		where emp_sal.DEPT=@dept);


select * from dept_data('HR');


-----sub query like we have to get the name eid and city and doj of the manager how we can use from two different table by using the subquery
select * from emp;
select * from emp_sal;


select eid,name,city doj -- outer query
from emp
where eid  in (select eid --inner/nested query
from emp_sal
where desi='manager'
);

---lets display the employees designation and salary and dept who is from dehradun

 select dept,desi,salary
 from emp_sal
 where eid in (select eid from emp where city ='DEHRADUN');

 ----
 --we want to display the eid,name,dept,deisgnation here we have to fetch the record from both the table name from emp and others are empsal so subquery will not work
 select ed.eid,ed.name,es.dept,es.desi
 from emp_sal as es
 inner join emp as ed
 on es.eid=ed.eid
 where es.dept='mis';

 --delete data usin the subquery

 delete from training
 where eid in (select eid from emp_sal where desi='manager');

 ---lets increase the salary of those employee who are from pune by 101 

 update emp_sal set salary=salary+101
 where eid in(select eid from emp where city='pune');

 select eid,city from emp where city='pune'

 ---return the employee name address whose salary is between 50000 and 60000
 
 select name,addr1,city,doj
 from emp
 where eid in (select eid from emp_sal where salary between 50000 and 60000);


 ---total number of employee along with the avegrage salary

 select count(*),avg(salary)
 from emp_sal;


 ---total number of emloyees from delhi and their average salary
 select count(*) as no_of_emp_del , 
		AVG(salary) as avg_del_salary
from emp_sal
where eid in (select eid from emp where city ='delhi');

-----lets say we want to display the sa number of employee from delhi and their avgrage salary those wmployee should have salary more than 40000
 select count(*) as no_of_emp_del , 
		AVG(salary) as avg_del_salary
from emp_sal
where eid in (select eid 
			  from emp 
			  where city ='delhi' and eid in(select eid from emp_sal where salary > 55000)); 


--------exist operator just check the exist of the data
----we want to display the of all the hr team member and out of them more but only if any hr team member having more than 60000
---exist will just checking of the data

select * from emp_sal
where dept='hr' and exists(select * from emp_sal
where dept='hr' and salary > 40000)


select max(salary) as '3rd most salary'
from EMP_SAL
where salary not in(select top 2 salary
from EMP_SAL
order by salary desc);

---if we want to find the name of the employee then

----display the eid name city doj dept and desi,salary of team members of david and ramesh gupta

select * from emp
select * from emp_sal

select * from emp where name in('david','ramesh gupta')

select ed.name,ed.city,ed.doj, es.dept, es.desi,es.salary
from emp_sal es
inner join emp ed
on es.eid=ed.eid
where es.eid in(select eid from emp_sal
where dept in(select dept from emp_sal
where eid in (select eid from emp where name in('david','ramesh gupta')))
)
order by es.salary desc;

---- cte it is a temporary view once sql statement executed then it will be gone
-----cte is not taking space but view is storing sin disk and taking space

use test;
select * from emp
select * from emp_sal

select ed.name,ed.city,es.dept,es.desi,es.salary
from emp_sal es
inner join emp ed on es.eid=ed.eid;

-- creating cte for above sql statements

with cte_emp_details(name,city,dept,desi,salary)
	as
	(select ed.name,ed.city,es.dept,es.desi,es.salary
	from emp_sal es
	inner join emp ed on es.eid=ed.eid)

	select * from cte_emp_details;

---store procedure it is a name to a prewritten sql code 
-- if we need to write the query again and again then we need to create the store procedure

create procedure employee_from_delhi
as
begin
    select * from emp
	where city='delhi'
end;

execute employee_from_delhi;
exec employee_from_delhi;
employee_from_delhi

--- creating parameterize procedure
create procedure employess_from_cities @City varchar(20)
as 
begin 
    select * from emp
	where city=@City
end;

employess_from_cities 'pune'   -- calling procedure

-----creating procedure to fetch the data from the different table dynamically when we needed
DROP PROCEDURE IF EXISTS fetch_data_from;

create procedure fetch_data_from @T varchar(50)
as
begin 
	exec('select * from '+@T)
end;

fetch_data_from 'emp';

-----now create the store procedure for the inserting record into the table

DROP PROCEDURE IF EXISTS insert_values_emp;
create procedure insert_values_emp @ID int,@name varchar(50),@addr1 varchar(50), @addr2 varchar(50), @city varchar(50), @phone varchar(15), @email varchar(30),@dob date, @doj date
as 
begin 
	insert into emp
	values(@ID,@name,@addr1,@addr2,@city,@phone,@email,@dob,@doj)
end;

insert_values_emp 1166, 'John Doe', '123 Main St', 'Apt 4B', 'New York', '123-456-7890', 'john.doe@example.com', '13-oct-1997', '13-oct-2023'


EXEC insert_values_emp 
    @ID = 1166, 
    @name = 'John Doe', 
    @addr1 = '123 Main St', 
    @addr2 = 'Apt 4B', 
    @city = 'New York', 
    @phone = '123-456-7890', 
    @email = 'john.doe@example.com', 
    @dob = '1985-05-15', 
    @doj = '2021-01-01';


	--------------------------------------------
DROP PROCEDURE IF EXISTS insert_values_emp;

delete from emp where eid = 1166;

select * from EMP;

CREATE PROCEDURE insert_values_emp 
    @ID INT,
    @name VARCHAR(50),
    @addr1 VARCHAR(50),
    @addr2 VARCHAR(50),
    @city VARCHAR(50),
    @phone VARCHAR(15),
    @email VARCHAR(30),
    @dob DATE,
    @doj DATE
AS 
BEGIN 
    INSERT INTO emp (Eid, name, addr1, addr2, city, phone, email, dob, doj)
    VALUES (@ID, @name, @addr1, @addr2, @city, @phone, @email, @dob, @doj);
	select * from emp
	where eid = @ID
END;


EXEC insert_values_emp 
    @ID = 1166, 
    @name = 'RAGHUVEER SINGH', 
    @addr1 = 'SECTOR 7', 
    @addr2 = 'Rohini', 
    @city = 'DELHI', 
    @phone = '9999002728', 
    @email = 'jRK@YAHOO.CO.IN', 
    @dob = '1997-10-13', 
    @doj = '2023-10-13';




----------lets create the procedure where we can add record for the multiple table
select * from emp;
select * from EMP_SAL;

DROP PROCEDURE IF EXISTS insert_values_multi_table;


CREATE PROCEDURE insert_values_multi_table 
    @ID INT,
    @name VARCHAR(50),
    @addr1 VARCHAR(50),
    @addr2 VARCHAR(50),
    @city VARCHAR(50),
    @phone VARCHAR(15),
    @email VARCHAR(30),
    @dob DATE,
    @doj DATE,
	@dpt varchar(40),
	@desi varchar(40),
	@sal int


AS 
BEGIN 
    INSERT INTO emp (Eid, name, addr1, addr2, city, phone, email, dob, doj)
    VALUES (@ID, @name, @addr1, @addr2, @city, @phone, @email, @dob, @doj);

	INSERT INTO emp_sal(Eid, DEPT, DESI, SALARY)
    VALUES (@ID, @dpt, @desi, @sal);

	select * from emp
	where eid = @ID

	select * from emp_sal
	where eid = @ID


END;


EXEC insert_values_multi_table 
    @ID = 1166, 
    @name = 'RAGHUVEER SINGH', 
    @addr1 = 'SECTOR 7', 
    @addr2 = 'Rohini', 
    @city = 'DELHI', 
    @phone = '9999002728', 
    @email = 'jRK@YAHOO.CO.IN', 
    @dob = '1997-10-13', 
    @doj = '2023-10-13',
	@dpt= 'IT',
	@desi= 'manager',
	@sal=79000


create table temp(
id int,
name varchar(5)
);

insert into temp
values(1,'A'),
	(2,'B'),
	(3,'C'),
	(4,'D'),
	(5,'E'),
	(6,'F'),
	(7,'G'),
	(8,'H'),
	(9,'I');

select * from temp;

----lets delete record without begin transaction
delete from temp where id =9;

----now starting the transaction and will delete some recod and roll back to get back those record
begin transaction;
	delete from temp where id =8;
	delete from temp where id =7;
rollback;
		
-----lets rollback particular group of transaction
select * from temp;

begin transaction;
delete from temp where id=8;

save transaction T1;
delete from temp where id=7;
delete from temp where id=6;

save transaction T2;
delete from temp where id=5;
delete from temp where id=4;

rollback transaction T1;

---commit to save transaction we cant rollback after commit

begin transaction;
delete from temp where id =8;
delete from temp where id =7;
commit;
rollback;

------------auto increment

use test;


create table emp2(
eid int identity (1,1),
name varchar(50),
age int
);

insert into emp2(name,age)
values('rajesh',29);

insert into emp2
values('Rahul',25);

select * from emp2;


drop procedure inesrt_record_emp2;

create procedure inesrt_record_emp2 @name varchar(20), @age int
as 
begin
insert into emp2
values(@name,@age)

select * from emp2
end;

inesrt_record_emp2 'joy',28
inesrt_record_emp2 'ivan',29
inesrt_record_emp2 'naman',24

-----alpha numeric id cant be generate automatically but we can auto generate the numeric id
-----sequences

create sequence myseq
as int
start with 1
increment by 1
maxvalue 10;

select next value for myseq;

drop sequence myseq;


create sequence myseq_cycle
as int
start with 1
increment by 1
maxvalue 10
cycle;

select next value for myseq_cycle;



create sequence myseq_cycle_1
as int
start with 1
increment by 1
maxvalue 10
minvalue 1
cycle;

select next value for myseq_cycle_1;


create sequence myseq_cycle_2
as int
start with 1
increment by 1
maxvalue 10
minvalue 1
cycle
cache 5;

select next value for myseq_cycle_2;
----------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
drop sequence sequence_gen
create sequence sequence_gen
as int
start with 1
increment by 1;


drop table emp3
create table emp3
(
eid varchar(5),
name varchar(50),
age int
);

insert into emp3
values(next value for sequence_gen,'ajay gupta',34)

insert into emp3
values(next value for sequence_gen,'pammi das',28)

drop procedure insert_emp3
create procedure insert_emp3 @name varchar(50),@age int
as
begin
     declare @I int
	 declare @ID varchar(5)
	 set @I=(next value for sequence_gen)
	 if @I<10
	    set @ID=concat('E000',@I)
	 else if @I<100
	    set @ID=concat('E00',@I)
	 else if @I<1000
	    set @ID=concat('E0',@I)
	 else if @I<10000
	    set @Id=concat('E',@I)
	 else 
	     set @ID='na'
	insert into emp3
	values (@ID,@name,@age)
	select * from emp3
end;


insert_emp3 'rahul soni',26

create function cid(@C varchar(1),@I int)
returns varchar(5)
as 
begin
     declare @ID varchar(5)
	 if @I<10
	    set @ID=concat(@C,'000',@I)
	 else if @I<100
	    set @ID=concat(@C,'00',@I)
	 else if @I<1000
	    set @ID=concat(@C,'0',@I)
	 else if @I<10000
	    set @Id=concat(@C,@I)
	 else 
	     set @ID='na'
	return @ID;
end;

create procedure insert_emp3_1 @name varchar(50),@age int
as
begin
     declare @I int
	 declare @ID varchar(5)
	 set @I=(next value for sequence_gen)
	 set @ID=dBO.cid('E',@I)
	insert into emp3
	values (@ID,@name,@age)
	select * from emp3
end;


insert_emp3_1 'rahul das',29


-----------triggers
use test;
drop table product;
drop table stock;
drop table orders;

CREATE TABLE product (
    PID char(5),         -- Assuming PID is an integer and is the primary key
    PDESC VARCHAR(255),          -- Assuming PDESC is a description, stored as a string with max length of 255
    price int        -- Assuming price is a decimal with two digits after the decimal point
);


CREATE TABLE stock (
    pid char(5),              
    sqty INT
);

CREATE TABLE orders (
    oid char(5),       
    cid char(5),                   
    pid char(5),                  
    qty INT,                    
);



INSERT INTO product (PID, PDESC, price) VALUES
('P0001', 'Smartphone with 64GB storage', 699),
('P0002', 'Wireless Headphones', 199),
('P0003', 'Bluetooth Speaker', 99),
('P0004', 'Laptop with 16GB RAM', 1299),
('P0005', 'Smartwatch', 249);


INSERT INTO stock (pid, sqty) VALUES
('P0001', 150),
('P0002', 300),
('P0003', 250),
('P0004', 80),
('P0005', 500);

---whenever the order is placed the stock should be update this called for a trigger

select * from product
select * from stock;
select * from orders;





INSERT INTO orders (oid, cid, pid, qty) VALUES
--('O0001', 'C0001', 'P0001', 20);  -- Customer C0001 ordered 2 units of product P0001
--('O0002', 'C0001', 'P0001', 30);  -- Customer C0002 ordered 1 unit of product P0003
('O0004', 'C0003', 'P0004', 100);  -- Customer C0003 ordered 3 units of product P0002
--('O0004', 'C0001', 'P0004', 1),  -- Customer C0001 ordered 1 unit of product P0004
--('O0005', 'C0004', 'P0005', 5); 



-----create trigger
CREATE TRIGGER insert_record
ON orders
FOR INSERT
AS 
BEGIN
    -- Update the stock quantity based on the inserted order
    UPDATE stock 
    SET sqty = sqty - (SELECT qty FROM inserted WHERE inserted.pid = stock.pid)
    WHERE pid IN (SELECT pid FROM inserted);
END;

----deleteing the  product from the product table it should be delete from stock table

drop trigger del_trigger

create trigger del_trigger
on product
for delete 
as
begin
	 delete from stock
	 where pid = (select pid from deleted)
end;

delete from product where pid = 'p0005';


----create trigger for update

create trigger update_trigger
on orders
for update
as 
begin
    declare @oq int
	declare @nq int
	set @oq=(select qty from deleted)
	set @nq=(select qty from inserted)
	update stock set sqty=sqty+@oq-@nq
	where pid = (select pid from inserted)

end;












