create database learn55
use learn55;
create table stu
(
RNO int,
NAME char(5),
AGE int
);

insert into stu (RNO,NAME,AGE)
values(1,'joy',12);

insert into stu
values(1,'joy',12);

insert into stu (RNO,NAME)
values(1,'joy');


select name from stu;
select * from stu;

create database Demo;
use Demo;
create table Employee
(
name varchar(50),
eid char(5),
addr varchar(100),
city varchar(50),
dob  datetime,
phone_no char(10),
email varchar(50)
);

drop table Employee;

insert into Employee (name,eid,addr,city,dob,phone_no,email)
values('sanjoy','E0001','67 main road raipur','raipur','18-mar-1999','6234589065','sanjoy.rai@gmail.com');

insert into Employee (name,eid,addr,city,dob,phone_no,email)
values
('Rahul','E0002','Gorakhpur chowk 56 lane','patna','17-apr-1999','9834589065','rahul.rai@gmail.com'),
('ajith kumar','E0003','indiranagar near bachhan dhaba','bangalore','15-feb-1993','6834589665','ajith.kumar34@gmail.com'),
('shiv pandey','E0004','tala park 34 lane','ameli','18-mar-1999','853457825','shiv.cool.pandey@gmail.com'),
('anmol mehta','E0005','6/4 shantigar pk road','rajori','19-dec-2000','6233599065','anmol67@gmail.com'),
('gunjan singh','E0006','8B bustand near shirtix','mumbai','01-jun-1998','6234520965','gunjansingh78@gmail.com'),
('priya singh','E0007','lal chawk ring road','pune','10-may-1996','9839889065','priyasingh007@gmail.com'),
('abhishek yadav','E0008','100/16 pankaj pura 3rd lane','pune','10-sep-1998','6237659065','abhi.yadav@gmail.com'),
('sameer gautam','E0009','shyam nagar 56 bustand','jharkhand','18-jul-1999','9034589065','sameergautam09@gmail.com'),
('kunal dey ','E0010','8g picnic garden 3rd lane','kolkata','18-mar-1999','8534589065','kunal.dey89@gmail.com');

select * from employee;
