
---TASK 1 DATABASE DESIGN

create database TechShop
use TechShop

--create table customer
create table Customers(
 customerid int primary key,
 firstname varchar(50),
 lastname varchar(50),
 email varchar(50) unique,
 phone varchar(50),
 Address varchar(50))

-- create product table
create table products(
productid int primary key,
productname varchar(50),
description varchar (50),
price decimal (10,2 ))

--create orders table 
create table orders(
orderid int primary key,
orderdate date,
totalamount decimal(10,2),
customerid int ,
foreign key (customerid) references  customers (customerid))

--create orderdetails table
create  table orderdetails(
orderdetailid int primary key,
quantity int,
orderid int ,
productid int,
foreign key (orderid) references orders(orderid),
foreign key (productid) references products (productid))

--create table inventory
create table inventory(
inventoryid int primary key,
quantityinstock int ,
laststockupdate datetime,
productid int ,
foreign key (productid) references products(productid))

---insertinf values for all the tables

insert INTO Customers (customerid, firstname, lastname, email, phone, Address) VALUES
(1, 'Arun', 'Kumar', 'arun.kumar@example.com', '9876543210', 'Chennai'),
(2, 'Priya', 'Sharma', 'priya.sharma@example.com', '9876543211', 'Bangalore'),
(3, 'Rahul', 'Verma', 'rahul.verma@example.com', '9876543212', 'Hyderabad'),
(4, 'Sneha', 'Rao', 'sneha.rao@example.com', '9876543213', 'Mumbai'),
(5, 'Karthik', 'S', 'karthik.s@example.com', '9876543214', 'Coimbatore'),
(6, 'Divya', 'Patel', 'divya.patel@example.com', '9876543215', 'Pune'),
(7, 'Vikram', 'Joshi', 'vikram.joshi@example.com', '9876543216', 'Delhi'),
(8, 'Meena', 'Nair', 'meena.nair@example.com', '9876543217', 'Kochi'),
(9, 'Ravi', 'Singh', 'ravi.singh@example.com', '9876543218', 'Jaipur'),
(10, 'Aishwarya', 'Iyer', 'aish.i@example.com', '9876543219', 'Madurai');

INSERT INTO Products (productid, productname, description, price) VALUES
(1, 'Laptop', '15-inch i5', 55000.00),
(2, 'Mouse', 'Wireless Mouse', 750.00),
(3, 'Keyboard', 'Mechanical Keyboard', 2200.00),
(4, 'Monitor', '24-inch LED', 9500.00),
(5, 'Headphones', 'Noise Cancelling', 3000.00),
(6, 'Webcam', 'HD Camera', 1200.00),
(7, 'Pen Drive', '64GB USB 3.0', 800.00),
(8, 'Router', 'Dual Band Wi-Fi', 2800.00),
(9, 'Tablet', '10-inch Android', 15000.00),
(10, 'Smartwatch', 'Fitness Tracker', 5000.00);

INSERT INTO Orders (orderid, orderdate, totalamount, customerid) VALUES
(1, '2024-06-01', 5800.00, 1),
(2, '2024-06-02', 65000.00, 2),
(3, '2024-06-05', 3000.00, 3),
(4, '2024-06-07', 800.00, 4),
(5, '2024-06-10', 9500.00, 5),
(6, '2024-06-12', 2200.00, 6),
(7, '2024-06-13', 2800.00, 7),
(8, '2024-06-14', 55000.00, 8),
(9, '2024-06-15', 1200.00, 9),
(10, '2024-06-16', 8000.00, 10);
INSERT INTO Orders (orderid, orderdate, totalamount, customerid) 
VALUES (12, '2024-06-18', 6000.00, 10);


INSERT INTO OrderDetails (orderdetailid, quantity, orderid, productid) VALUES
(1, 1, 1, 2),   
(2, 1, 2, 1),   
(3, 2, 3, 5),  
(4, 1, 4, 7),  
(5, 1, 5, 4),  
(6, 1, 6, 3),  
(7, 1, 7, 8),  
(8, 1, 8, 1),   
(9, 1, 9, 6),   
(10, 2, 10, 10);
INSERT INTO OrderDetails (orderdetailid, quantity, orderid, productid) VALUES(11, 2, 10, 10);



INSERT INTO Inventory (inventoryid, quantityinstock, laststockupdate, productid) VALUES
(1, 20, '2024-06-01 10:00:00', 1),
(2, 50, '2024-06-02 11:00:00', 2),
(3, 30, '2024-06-03 12:00:00', 3),
(4, 15, '2024-06-04 13:00:00', 4),
(5, 25, '2024-06-05 14:00:00', 5),
(6, 40, '2024-06-06 15:00:00', 6),
(7, 60, '2024-06-07 16:00:00', 7),
(8, 35, '2024-06-08 17:00:00', 8),
(9, 18, '2024-06-09 18:00:00', 9),
(10, 22, '2024-06-10 19:00:00', 10);

--- TASK 1 ENDED 

-- TASK 2 SELECT ,WHERE,BETWEEN,AND,LIKE


-- 1. the names and emails of all customer
select email as email, concat (firstname,'',lastname) as Fullname  from Customers

-- 2.display all orders with name and date 
select orderid,orderdate,firstname as customername from orders join Customers cust on orders .customerid = cust .customerid


-- 3.insert name , email,address in customer
insert into customers(customerid,firstname, lastname,email,Address)values (11,'yogi','raj','yogi@123','salem')
select * from Customers where customerid=11

-- 4.update price by 10% in products 
select price from products
update products set price = price *1.10


-- 5.to delete a specific order
delete  from orderdetails where orderid =5
delete from orders where orderid = 5

select * from orderdetails
select * from orders
select *from Customers


-- 6.insert into order table 
insert into orders (orderid, orderdate, totalamount, customerid) values
(11,'2025-06-11',2000.00,11)

-- 7.update the contact information
update  Customers set email='change@123',phone = 12345678,address =' madurai' where customerid =11

-- 8.recalculation 
SELECT OrderDetails.orderid, SUM(OrderDetails.quantity * Products.price) AS total
FROM OrderDetails
JOIN Products ON OrderDetails.productid = Products.productid
GROUP BY OrderDetails.orderid;
UPDATE Orders SET totalamount = 825.00  WHERE orderid = 1;
UPDATE Orders SET totalamount = 60500.00 WHERE orderid = 2;
UPDATE Orders SET totalamount = 6600.00 WHERE orderid = 3;
select * from orders

-- 9.delete all orders from orders,orderdetail
 delete orderdetails
 from orderdetails join  orders on orderdetails.orderid= orders.orderid
 where customerid = 8
 delete  from orders where customerid =8

 -- 10.insert into products
 INSERT INTO Products (productid, productname, description, price) VALUES
(13,'mouse','blutooth',250.00)
select*from products



--11.update status in orders table 
ALTER TABLE orders ADD  status VARCHAR(20);
UPDATE orders set status  ='pending'
SELECT * FROM ORDERS
update orders set status = 'shipped' where orderid between 1 and 6



--12 calculate the total customers 

select*from Customers

SELECT customerid, COUNT(*) AS totalorders
FROM orders
GROUP BY customerid;
alter table Customers add  alloders int
update Customers set alloders =1
----task 2---

--Task 3. Aggregate functions, Having, Order By, GroupBy and Joins

--1.list of all orders

select*from Customers
select*from orders
select orders.orderid,orders.orderdate,orders.totalamount,Customers.firstname,Customers.lastname,Customers.email,Customers.alloders
from orders join Customers on  orders.customerid = Customers.customerid

--2.find the total revenue generated 
select products.productname,sum(orderdetails.quantity * products.price) as totalrevenue
from orderdetails join products on orderdetails.productid = products.productid
group by  products.productname

--3.atleast one purchase
update customers set alloders =5 where customerid = 6
update customers set alloders =0 where customerid = 5
update customers set alloders =9 where customerid = 4
update customers set alloders =0 where customerid = 8


    SELECT 
     Customers.customerid,
    Customers.firstname,
    Customers.email,
    Customers.phone,
    COUNT(Orders.orderid) AS total_orders
FROM 
    Customers
LEFT JOIN 
    Orders ON Customers.customerid = Orders.customerid
GROUP BY 
    Customers.customerid,
    Customers.firstname,
    Customers.email,
    Customers.phone
    
HAVING 
    COUNT(Orders.orderid) <= 1;


--4.highest total quantity
SELECT top 1
    products.productname,
    SUM(orderdetails.quantity) AS total_quantity
FROM 
    orderdetails
JOIN 
    products ON orderdetails.productid = products.productid
GROUP BY 
    products.productname
ORDER BY 
    total_quantity DESC;

select*from orderdetails

--5.list of products and its category

select products.productname,products.description from products

--6.avg  order value
select Customers.firstname,avg(orders.totalamount) as avgvalue
from orders join Customers on orders.customerid = Customers.customerid
group by Customers.firstname,Customers.customerid

--7.high total revenue
select  top 1 Customers.firstname,Customers.email,orders.orderid,orders.totalamount as totalrevenue
from orders join Customers on orders.customerid = Customers.customerid
order by orders.totalamount desc

--8.products and no of time they had been ordered

select products.productname ,count(orderdetails.orderid) as timesordered
from products join orderdetails on  products.productid =  orderdetails.productid
group by products.productname

--9. specific electronic gadget

select Customers.customerid,Customers.firstname,Customers.email
from Customers join orders on Customers.customerid= orders.customerid
join orderdetails on orders.orderid= orderdetails.orderid
join products on orderdetails.productid = products.productid
where products.productname = 'laptop'

--10. orders bet the time 

select sum(totalamount) as totalreven
from orders where orderdate between '2024-06-01' and '2024-06-10'
-- task 3 over


---task 4 subquerys

--1. not placed any orders

select * from Customers where customerid not in (select customerid from orders)

---2. prds available for sale 

select* from products
select count (*) as prodforsale from products

--3.total revenue generated by techshop

select * from orders
select sum (orderdetails.quantity * products.price) as totalrevenue from orderdetails join products on orderdetails.productid = products.productid

--4.avg quantity orderd for produs specific 

select avg (quantity)  as avgquantity from  orderdetails where  productid in (select  productid from products 
where productname= 'laptop')

--5.total revenue generated by a customer 

select sum (orderdetails.quantity * products.price) as totalcustomerrevernue from orders
join orderdetails on orders.orderid = orderdetails.orderid
join products on orderdetails.productid = products.productid
where customerid = 4

--6 customers placed most of orders
SELECT c.firstname, c.lastname, COUNT(o.orderid) AS total_orders
FROM Customers c
JOIN Orders o ON c.customerid = o.customerid
GROUP BY c.customerid, c.firstname, c.lastname
HAVING COUNT(o.orderid) = (SELECT MAX(order_count)FROM (SELECT customerid, COUNT(orderid) AS order_count
FROM Orders
GROUP BY customerid
) as sub
)

select * from orders
select * from orderdetails
---7 most popular product category
SELECT top 1 p.productname, SUM(od.quantity) AS total_ordered
FROM OrderDetails od
JOIN Products p ON od.productid = p.productid
GROUP BY p.productname
ORDER BY total_ordered DESC

--8.highest total revenue
SELECT top 1 c.firstname, SUM(od.quantity * p.price) AS total_spent
FROM Customers c
JOIN Orders o ON c.customerid = o.customerid
JOIN OrderDetails od ON o.orderid = od.orderid
JOIN Products p ON od.productid = p.productid
GROUP BY c.customerid, c.firstname
ORDER BY total_spent DESC

--9.avg order value 

SELECT SUM(od.quantity * p.price) / COUNT(DISTINCT o.orderid) AS avg_order_value
FROM Orders o
JOIN OrderDetails od ON o.orderid = od.orderid
JOIN Products p ON od.productid = p.productid;

-- task 4 ended---

