create database inventory;
use inventory;
use demo;

-------creating inventory tables-----
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
category varchar(30) check (category in ('IT','HA','HC')),
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




------insertion of records-------

INSERT INTO supplier (SID, sname, sadd, scity, sphone, semail)
VALUES 
('S001', 'ABC Supplies', '123 Main St', 'Delhi', '9876543210', 'contact@abc.com'),
('S002', 'XYZ Traders', '456 Elm St', 'Mumbai', '9876543211', 'info@xyztraders.com'),
('S003', 'Global Imports', '789 Oak St', 'Bangalore', '9876543212', 'support@globalimports.com'),
('S004', 'Tech Distributors', '101 Pine St', 'Kolkata', '9876543213', 'sales@techdist.com'),
('S005', 'Fresh Foods', '202 Maple St', 'Chennai', '9876543214', 'orders@freshfoods.com'),
('S006', 'Home Supplies', '303 Birch St', 'Hyderabad', '9876543215', 'service@homesupplies.com'),
('S007', 'Electro Goods', '404 Cedar St', 'Pune', '9876543216', 'contact@electrogoods.com'),
('S008', 'Green Grocers', '505 Redwood St', 'Ahmedabad', '9876543217', 'info@greengrocers.com'),
('S009', 'Fashion World', '606 Willow St', 'Jaipur', '9876543218', 'sales@fashionworld.com'),
('S010', 'Auto Parts Co.', '707 Ash St', 'Lucknow', '9876543219', 'support@autopartsco.com');

---------------------------------------
INSERT INTO product_tb (PID, PDESC, Price, category, SID)
VALUES 
('P001', 'Smartphone', 15000, 'IT', 'S001'),
('P002', 'Washing Machine', 25000, 'HA', 'S001'),
('P003', 'Health Supplement', 1000, 'HC', 'S001'),
('P004', 'LED TV', 30000, 'HA', 'S002'),
('P005', 'Laptop', 50000, 'IT', 'S002'),
('P006', 'Refrigerator', 35000, 'HA', 'S003'),
('P007', 'Protein Powder', 2500, 'HC', 'S003'),
('P008', 'Air Conditioner', 40000, 'HA', 'S004'),
('P009', 'Smartwatch', 8000, 'IT', 'S004'),
('P010', 'Yoga Mat', 1200, 'HC', 'S005');
-------------------------------------------------------------
INSERT INTO stock (PID, SQTY, ROL, MOQ)
VALUES 
('P001', 100, 10, 5),
('P002', 50, 5, 5),
('P003', 200, 20, 5),
('P004', 80, 8, 5),
('P005', 60, 6, 5),
('P006', 150, 15, 5),
('P007', 120, 12, 5),
('P008', 40, 4, 5),
('P009', 90, 9, 5),
('P010', 110, 11, 5);
-----------------------------------------------------------------------------
INSERT INTO customer (CID, cname, caddress, ccity, cphone, cemail, CDOB)
VALUES 
('C001', 'John Doe', '456 Oak Ave', 'Delhi', '9876543211', 'john@example.com', '1985-08-15'),
('C002', 'Jane Smith', '123 Pine St', 'Mumbai', '9876543212', 'jane@example.com', '1990-03-20'),
('C003', 'Mark Johnson', '789 Birch Rd', 'Bangalore', '9876543213', 'mark@example.com', '1982-06-25'),
('C004', 'Emily White', '321 Maple Dr', 'Kolkata', '9876543214', 'emily@example.com', '1995-12-10'),
('C005', 'Michael Brown', '654 Cedar Ln', 'Chennai', '9876543215', 'michael@example.com', '1990-11-05'),
('C006', 'Sarah Lee', '987 Elm St', 'Hyderabad', '9876543216', 'sarah@example.com', '1988-07-22'),
('C007', 'David Green', '135 Willow Ct', 'Pune', '9876543217', 'david@example.com', '1983-09-30'),
('C008', 'Laura Adams', '246 Redwood Blvd', 'Ahmedabad', '9876543218', 'laura@example.com', '1992-04-17'),
('C009', 'James Wilson', '369 Oakwood Ave', 'Jaipur', '9876543219', 'james@example.com', '1987-01-11'),
('C010', 'Olivia Martinez', '753 Birchwood Rd', 'Lucknow', '9876543220', 'olivia@example.com', '1994-10-09');
----------------------------------------------------------------------------------------------------------------------
INSERT INTO orders (OID, ODATE, PID, CID, OQTY)
VALUES 
('O001', '2025-03-31', 'P001', 'C001', 2),
('O002', '2025-03-31', 'P002', 'C001', 1),
('O003', '2025-03-31', 'P003', 'C001', 5),
('O004', '2025-03-31', 'P004', 'C002', 3),
('O005', '2025-03-31', 'P005', 'C002', 2),
('O006', '2025-03-31', 'P006', 'C003', 4),
('O007', '2025-03-31', 'P007', 'C003', 6),
('O008', '2025-03-31', 'P008', 'C004', 1),
('O009', '2025-03-31', 'P009', 'C004', 3),
('O010', '2025-03-31', 'P010', 'C005', 2);
-----------------------query statement

select * from supplier;
select * from product_tb;
select * from customer;
select * from orders;
select * from stock;

-------------------------------------------------------------------------
---display product category,description,id and supplier name and city

select pt.category,pt.PDESC,pt.PID,sp.sname,sp.scity
from product_tb pt
inner join supplier sp
on pt.SID=sp.SID;

-----------------------------------------------------------------------------
------create a view as bill OID,ODATE,cname,address,phone,pdesc,price,oderquantity, amount

create view BILL
as
	select od.OID, od.ODATE, cs.cname, cs.caddress, cs.cphone, pd.PDESC, pd.Price, od.OQTY, (pd.Price*od.OQTY) as 'amount'
	from orders as od
	inner join customer cs on od.CID=cs.cid
	inner join product_tb pd on od.PID=pd.PID

select * from BILL;



