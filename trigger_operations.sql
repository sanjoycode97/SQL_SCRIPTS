create database trigger_db;
use trigger_db;
CREATE TABLE products (
    PID char(5),         
    PDESC VARCHAR(255),          
    price int        
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


----------

INSERT INTO products (PID, PDESC, price) VALUES
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

select * from products
select * from stock
select * from orders


---- implementing trigger for inserton order table if order insert it will deduct from stock
drop trigger insert_trigger;

create trigger insert_trigger
on orders
for insert
as
begin
	update stock
	set sqty = sqty - (select qty from inserted)
	where pid = (select pid from inserted)
end;


----enter the order in order table


insert into orders values('O0002','C0002','P0001',1);



-------------------create trigger for update

create trigger trigger_update_record_on_order_according_to_change_stock
on orders
for update
as
begin
	declare @oq int
	declare @nq int
	set @oq = (select qty from deleted)
	set @nq = (select qty from inserted)
	update stock set sqty = sqty+@oq-@nq
	where pid = (select pid from inserted)
end;

---- now update the order
 
 update orders set qty =9
 where pid = 'P0001' and cid = 'C0002';


 -----create trigger for delete
create trigger del_trigger
on products
for delete 
as
begin
	 delete from stock
	 where pid = (select pid from deleted)
end;


--delete from product table

delete from products
where pid = 'P0005'


------implement insert trigger only order a product when it is having sufficient quantity
drop trigger trigger_order_for_product_if_sufficient_quantity;

create trigger trigger_order_for_product_if_sufficient_quantity
on orders
for insert
as 
begin	
	declare @QR int
	declare @QS int
	set @QR=(select qty from inserted)
	set @QS=(select sqty from stock where pid =(select pid from inserted))

	if @QS >= @QR
		begin
			update stock set sqty = sqty - @QR
			where pid = (select pid from inserted)

			commit;
			print('order accepted')
		end;
	else
		begin
		
			rollback;
			print('in sufficient balance')
		end;
end;

------ordering product

insert into orders values('O0003','C0003','P0004',90); -- insufficient balance
