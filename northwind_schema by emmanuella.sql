

-- create a report that shows the categoryname and desription from the categories table sorted by categoryname
Select categoryname, Description from categories
order by categoryname;

-- create a report that shows the contactname,companyname,contacttilte,and phone number from the customers table sorted by phone
select contactname,companyname,contacttitle,phone from customers order by phone;

-- create a report that shows the capitalized fristname and lastname  remnamed as firstname adn lastname respectively and hiredate from the emloyees tbale sorted from the newest to the oldest employees
select firstname, lastname , HireDate from employees order by hiredate desc;

-- create a report that shows the top 10 orderid,orderdate,shipped date,customerid,freight from the orders table sorted by freight in descending order
select orderid,orderdate,shippeddate,customerid,freight from orders order by Freight desc limit 10;

-- create a report that shows all the customer id in lowercase amd renamed as id from the customers tabke
select lower(customerid) as ID from customers;

-- create a report that shows the company name ,fax , phone,country,homepage from the suppliers table sorted by the country in descending rorder then by company name in ascending order
select companyname,fax,phone,country,homepage from suppliers order by country desc,companyname asc;

-- create a report that shows companyname, contactname, of all customers from 'buenos aires' only XX
select companyname, contactname from customers having companyname = 'buenos aires';

-- create a reposrt showing productname, unitprice,quantityperunit of products that are out of stock
select productname,unitprice,quantityperunit,unitsinstock from products
where UnitsInStock <1;

-- create a report showing all the contactname ,address,city of all customers not from gernamy,mexico,spain
select contactname,address,city from customers where country NOT IN ('germany','mexico','spain');

-- create a report showing ordredate ,shippeddate,customerid,freight of all orders placed on 21 may 1996 
select orderdate,shippeddate,customerid,freight from orders where orderdate ='1996-05-21';
select orderdate from orders;

-- create a report showing fristname,lastname, country from the employees not from united states
select firstname,lastname,country from employees where country <> "united states"; 

-- create a report that shows the employeeid,orderid, customerid,requireddate,shippeddate from all orders shipped later than required
select employeeid,orderid,customerid,requireddate,shippeddate from orders where shippeddate>requireddate;

-- create a report that shows the city, companyname, contactname of customers from cities starting with a or b
select city,companyname,contactname from customers where city like 'A%' or city like '%B';

-- create a report  showing all the even numbers of orderid from the orders table
select orderid from orders  where orderid %2=0;

-- create a report  showing all the odd numbers of orderid from the orders table
select orderid from orders  where mod(orderid,2)<>0;

-- cretae  a report that shows all the orders where the freight cost more than 500 dollars
select * from orders where freight >500;

-- create a report  that shows the productname, unitin stock, unitin order, reorder level of all products that are up for reorder
select productname, unitsinstock, unitsonorder, reorderlevel from products where reorderlevel >0;

-- create a report that shows companyname, contactname of all customers that do no have fax number
select companyname,contactname,fax from customers where fax is null;

-- create a report that sohiws the firstname, lastname of all employees that do not report to anybody
select firstname,lastname from employees where reportsto is null;

-- create a report showing all the odd numbers of orderid  from the orders table 
select * from orders where mod(OrderID,2)<>0;

-- create a report thst shows companyname, contactname,fax of all customers that do not  have fax number and sorted by contacttname
select companyname,contactname,fax from customers where fax is null
order by contactname desc;

-- create a report that shows the city, companynaem, contactname of customer from city that have the letter L in the name , sorted by contactname
select city,companyname,contactname from customers where city like '%L%' order by contactname desc;

-- create a erport that shows the firstnam, lastname, brithdate of employees born in 1950
select firstname,lastname,birthdate from employees where birthdate between '1950-01-01' and '1959-12-31';

-- create a report that shows the firstname, lastname, the year of birthdate as birthyear from employees table
select firstname,lastname,year(birthdate) as birthyear from employees;

-- creae a report showing orderid, total nunber of orderid as numberoforders from the orderdetail table grouped by orderid and sorted by numberof ordrers in desc
select orderid, count(orderid) as numberoforders from orderdetails group by orderid order by numberoforders desc;

-- create a report that shiws the suppkierid,productname,companyname,from all product supplied by exotic liquids, specialtty biscuits.ltd,escargots nouveaux sorted by the supplier id
select p.supplierid,p.productname,s.companyname from products as p
 inner join suppliers as s on s.supplierid=p.SupplierID
 where s.companyname IN ('exotic liquids','escargots nouveaux','specialty biscuits, ltd.') order by s.SupplierID;
 
-- create a report that shows the shippostalcode ,orderid,orderdate,requiredate, shippeddate of all orders with shippostalcode beginning with '98124'
select shippostalcode,orderid,orderdate,requireddate,shippeddate from orders where ShipPostalCode like '%98124';

-- create a report that shows the contactname,contacttitle,companyname of customers that the has no 'sales' in  thier contacttitle
select contactname, contacttitle,companyname from customers where ContactTitle not like '%sales%';  


-- create a report that shows the lastname, firstname city of all employees in cities other than 'seattle'
select lastname,firstname,city from employees where city <> 'seattle';

-- create a report that shows the companyname, conatctitle, city, country of all customers in any city in mexico or other cities in spain other than madrid
select companyname,contacttitle,city , country from customers where city not like 'madrid';

-- NUMBER 30

-- create a report that shows the conatctname of all customerthat do not have lette A as the second alphabet in their contact name
select contactname from customers where contactname not like '%_a%';

-- create a report that shows the average unitprice rounded to the next whoelnumber,total price of unitstock and maximum number of ordes from product table. all saved as average price,total stock, and max order respectively
select round(avg(unitprice)) as averageprice, sum(unitsinstock) as totalstock, max(unitsonorder) as maxorder from products;

-- create  a report that shows the supplierid,companyname.categoryname,productname and unitprice from the product,suppliers and categories table
select s.supplierid,s.companyname,c.categoryname,p.productname,p.unitprice from products as p
 inner join suppliers  as s on s.SupplierID=p.supplierid
inner join categories as c on c.categoryid=p.categoryid;

-- create a report that shows the customerid,sumof freight from the orders table with sum of freight grester than 200$, grouped by customer id
select customerid, sum(freight) as sum from orders group by CustomerID having sum(Freight) > '200'; 

-- create a report that shows the orderid,contactname,unitprice,quantity,discount from the order details,orders and customer table with discount givrn on every purchase
select o.orderid,c.contactname,od.unitprice,od.quantity,od.discount from orderdetails as od 
inner join orders as o on o.orderid=od.OrderID
inner join customers as c on c.CustomerID=o.customerid where discount >0;

-- XX create a report that shows employeeid,lastname, fristname as employees and the lastname and firstname of who they report to as manager from the employees table sorted by employee
select e.EmployeeID, concat(e.firstname,' ',e.lastname ) as employee ,concat(m.firstname,' ',m.lastname ) as manager 
from employees as e left join employees m on m.employeeid=e.ReportsTo;

-- create a report that shows the average ,minimum and maximum unitprice of all products as averageprice,minimumprice and maximumprice respectively
select avg(unitprice) as averageprice,
min(unitprice) as minimumprice,
max(unitprice) as maximumprice from products;

-- create a view named customerinfo that shows the customerid, companyname,contactname,contacttitle , address, cittcountry, phone,orderdate,requireddate,shippeddate, from the customers and orders table
create view customerinfo as  
select c.customerid,c.companyname, c.contactname,c.contacttitle,c.address,c.city,c.country,c.phone,o.orderdate,o.requireddate,o.shippeddate
from customers as c inner join orders as o on c.CustomerID=o.CustomerID;

-- change the name of the view from customerinfo to customerdetails
rename table customerinfo to customerdetails;

-- create a view named productdetails that shows the productid,companyname,productname,categoryname,description,quantityperunit,unitprice,unitinstock,unitsonorder,reorderlevel
-- dicontiued from the supplier,products and categries table
create view productdetails as
select p.productid,s.companyname,p.productname,c.categoryname,c.description,p.quantityperunit,p.unitprice,p.unitsinstock,p.unitsonorder,p.reorderlevel,p.discontinued
from products as p inner join suppliers as s on s.supplierid=p.SupplierID
 inner join categories as c on c.CategoryID=p.CategoryID;
 
 -- drop the customers details view
 
 -- create a report that fetch  the first 5 character of categoryname from the category tables and renamed as shortinfo
 select substring(categoryname,1,5) as shortinfo from categories; 
 
 -- create a copy of the shipper table as shippers_duplicate. then insert a copy of shippers data into the new table
 create table shippers_duplicate select shipperid,companyname,phone from shippers;
 
 -- create a select statement that outputs the following from the shippers duplicate table
 select shipperid,companyname,phone from shippers_duplicate;
 
 -- create a report that shows the companyname and productname from all products in the seafood category
 select  s.companyname, p.productname ,c.categoryname from products as p inner join suppliers as s on p.SupplierID=s.SupplierID 
 inner join categories as c on p.CategoryID=c.CategoryID where CategoryName like 'seafood';
 
 -- create a report that shows the categoryid,companyname, and productname from all the product in the catgoryids
 select c.categoryid, s.companyname,p.productname from products as p inner join suppliers as s on s.SupplierID=p.SupplierID 
 inner join categories as c on c.CategoryID=p.CategoryID;
 
 -- delete the shippers_duplicate
 drop table shippers_duplicate;
 
 -- create a select statement that outputs the following from the employees table
 select lastname,firstname,year(curdate())-year(birthdate) as age from employees;
 
 -- create a report that the company and total number of orders by customer renamed as  number of orders since december 31,1994. show number greater than 10
 select c.companyname, count(c.customerid) as numberoforders from customers as c
 inner join orders as o on o.customerid=c.CustomerID
 where o.orderdate >= 1994-12-31
 group by c.CustomerID,c.CompanyName
 order by count(o.CustomerID) limit 10;