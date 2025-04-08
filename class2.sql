use demo;

select *  from employee;

--- where clause

select  * from employee
where name='sanjoy';

--use like clause fetch name start with s % represent any number of character

select name from employee
where name like 's%';

-- name start with anything but follow should be pandey

select * from employee
where name like '%pandey';

--it should start with anything and ends with anything but it should contain pandey

select * from employee
where name like '%pandey%';

---fetch the name whose name is five character _ represent the each character

select *  from employee
where name like '_____';

--whose 3rd character is n
select * from employee
where name like '__n%';

---use top clause fetch top 5 employee or 3 employee

select top 5 * from employee;

select top 5 name from Employee;


---update command
use learn55;

select * from stu;

update stu set age=34
where rno=1;

--delete

delete stu
where rno=1;

--delete the content from the table
delete from stu;
--- delete will not delete the table
delete stu

insert into stu (RNO,NAME,AGE)
values(1,'ajay',23),
(2,'laxm',14),
(3,'ajoy',10),
(4,'deepu',25),
(5,'kunal',23),
(6,'sidhu',21);

---data definition language Alter column
alter table stu
add class char(10);

select * from stu;

update  stu set class='7th';

--alter column

alter table stu
drop column class;

alter table stu
alter column name varchar(20);

-- drop command the current database which are in use can't be deleted
drop table stu;
----truncate command truncate doesnot  work with where clause but delete work wth where clause
truncate table stu;

--commit(save) and rollback

----
CREATE TABLE stu (
    RNO INT PRIMARY KEY,
    NAME VARCHAR(50),
    AGE INT
);


---opertors comparison operator

select * from stu
where age != 23;


select * from stu
where age <> 23;


select * from stu
where age >20;

select * from stu
where age >= 21;

select * from stu
where age <= 21;

select * from stu
where age < 21;

select * from stu
where age !> 21;

select * from stu
where age !< 21;

----logical operator

select * from stu
where age >= 21 and name = 'kunal';

select * from stu
where age >= 15 or name = 'kunal';

----both are same
select * from stu
where not age =23;

select * from stu
where age !=23;




---other operator between

select * from stu
where age >=10 and age<=21;

select * from stu
where age between 10 and 21;

-----IN list
select * from stu
where age=10 or name='sidhu' or rno =3;

select * from stu
where age in(10,15,21);

-----is null value

select * from stu
where age is null;

---distinct keyword

select distinct age from stu;





