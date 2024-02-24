----------------------------------------------/*Que-1.*/-------------------------------------------------
	
		create database if not exists e_commerce;
		show databases;
		use e_commerce;
		-------------------------------------
		create table supplier (SUPP_ID int primary key, SUPP_NAME varchar(50) NOT NULL, SUPP_CITY varchar(50)  NOT NULL, 
		SUPP_PHONE varchar(50) NOT NULL);
		desc supplier;
		-------------------------------------
		create table customer (CUS_ID int primary key, CUS_NAME varchar(20) NOT NULL, CUS_PHONE varchar(10)  NOT NULL, 
		CUS_CITY varchar(30) NOT NULL, CUS_GENDER CHAR);
		desc customer;
		-------------------------------------
		create table category (CAT_ID int primary key, CAT_NAME varchar(20) NOT NULL);
		desc category;
		-------------------------------------
		create table product (PRO_ID int primary key, PRO_NAME varchar(20) NOT NULL DEFAULT "Dummy", PRO_DESC varchar(60),
		CAT_ID int, foreign key(CAT_ID) references category(CAT_ID));
		desc product;
		-------------------------------------
		create table supplier_pricing (PRICING_ID int primary key, PRO_ID int, SUPP_ID int,
		SUPP_PRICE int default 0, foreign key(PRO_ID) references product(PRO_ID),foreign key(SUPP_ID) references supplier(SUPP_ID));
		desc supplier_pricing;
		-------------------------------------
		create table orders (ORD_ID int primary key, ORD_AMOUNT int not null, ORD_DATE date not null,
		CUS_ID int , PRICING_ID int, foreign key(CUS_ID) references customer(CUS_ID),foreign key(PRICING_ID) references supplier_pricing(PRICING_ID));
		desc orders;
		-------------------------------------
		create table rating (RAT_ID int primary key, ORD_ID int, RAT_RATSTARS int not null,
		foreign key(ORD_ID) references orders(ORD_ID));
		desc rating;
		-------------------------------------
	
----------------------------------------------/*Que-2.*/-------------------------------------------------

		SELECT SUPP_ID, SUPP_NAME, SUPP_CITY, SUPP_PHONE
		FROM supplier;
		-------------------------------------
		SELECT CUS_ID, CUS_NAME, CUS_PHONE, CUS_CITY, CUS_GENDER
		FROM customer;
		-------------------------------------
		SELECT CAT_ID, CAT_NAME
		FROM category;
		-------------------------------------
		SELECT PRO_ID, PRO_NAME, PRO_DESC, CAT_ID
		FROM product;
		-------------------------------------
		SELECT PRICING_ID, PRO_ID, SUPP_ID, SUPP_PRICE
		FROM supplier_pricing;
		-------------------------------------
		SELECT ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PRICING_ID
		FROM orders;
		-------------------------------------
		SELECT RAT_ID, ORD_ID, RAT_RATSTARS
		FROM rating;
		-------------------------------------

----------------------------------------------/*Que-3.*/-------------------------------------------------

		insert into supplier (SUPP_ID, SUPP_NAME, SUPP_CITY, SUPP_PHONE) 
		values (1, 'Rajesh Retails', 'Delhi', 1234567890);
		insert into supplier (SUPP_ID, SUPP_NAME, SUPP_CITY, SUPP_PHONE) 
		values (2, 'Appario Ltd.', 'Mumbai', 2589631470);
		insert into supplier (SUPP_ID, SUPP_NAME, SUPP_CITY, SUPP_PHONE) 
		values (3, 'Knome products', 'Banglore', 9785462315);
		insert into supplier (SUPP_ID, SUPP_NAME, SUPP_CITY, SUPP_PHONE) 
		values (4, 'Bansal Retails', 'Kochi', 8975463285);
		insert into supplier (SUPP_ID, SUPP_NAME, SUPP_CITY, SUPP_PHONE) 
		values (5, 'Mittal Ltd.', 'Lucknow', 7898456532);

		select * from supplier;
		-------------------------------------
		INSERT INTO customer (CUS_ID, CUS_NAME, CUS_PHONE, CUS_CITY, CUS_GENDER)
		VALUES
		(1, 'AAKASH', '9999999999', 'DELHI', 'M'),
		(2, 'AMAN', '9785463215', 'NOIDA', 'M'),
		(3, 'NEHA', '9999999999', 'MUMBAI', 'F'),
		(4, 'MEGHA', '9994562399', 'KOLKATA', 'F'),
		(5, 'PULKIT', '7895999999', 'LUCKNOW', 'M');
    
		select * from customer;
		-------------------------------------
		INSERT INTO category (CAT_ID, CAT_NAME)
		VALUES
		(1, 'BOOKS'),
		(2, 'GAMES'),
		(3, 'GROCERIES'),
		(4, 'ELECTRONICS'),
		(5, 'CLOTHES');
		
		select * from category;
		-------------------------------------
		INSERT INTO product (PRO_ID, PRO_NAME, PRO_DESC, CAT_ID)
		VALUES
		(1, 'GTA V', 'Windows 7 and above with i5 processor and 8GB RAM', 2),
		(2, 'TSHIRT', 'SIZE-L with Black, Blue and White variations', 5),
		(3, 'ROG LAPTOP', 'Windows 10 with 15-inch screen, i7 processor, 1TB SSD', 4),
		(4, 'OATS', 'Highly Nutritious from Nestle', 3),
		(5, 'HARRY POTTER', 'Best Collection of all time by J.K Rowling', 1),
		(6, 'MILK', '1L Toned Milk', 3),
		(7, 'Boat Earphones', '1.5 Meter long Dolby Atmos', 4),
		(8, 'Jeans', 'Stretchable Denim Jeans with various sizes and colors', 5),
		(9, 'Project IGI', 'compatible with Windows 7 and above', 2),
		(10, 'Hoodie', 'Black GUCCI for 13 yrs and above', 5),
		(11, 'Rich Dad Poor Dad', 'Written by Robert Kiyosaki', 1),
		(12, 'Train Your Brain', 'By Shireen Stephen', 1);
		
		select * from product;
		-------------------------------------
		INSERT INTO supplier_pricing (PRICING_ID, PRO_ID, SUPP_ID, SUPP_PRICE)
		VALUES
			(1, 1, 2, 1500),
			(2, 3, 5, 30000),
			(3, 5, 1, 3000),
			(4, 2, 3, 2500),
			(5, 4, 1, 1000),
			(6, 12, 2, 780),
			(7, 12, 4, 789),
			(8, 3, 1, 31000),
			(9, 1, 5, 1450),
			(10, 4, 2, 999),
			(11, 7, 3, 549),
			(12, 7, 4, 529),
			(13, 6, 2, 105),
			(14, 6, 1, 99),
			(15, 2, 5, 2999),
			(16, 5, 2, 2999);
			
		select * from supplier_pricing;
		-------------------------------------
		INSERT INTO orders (ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PRICING_ID)
		VALUES
			(101, 1500, '2021-10-06', 2, 1),
			(102, 1000, '2021-10-12', 3, 5),
			(103, 30000, '2021-09-16', 5, 2),
			(104, 1500, '2021-10-05', 1, 1),
			(105, 3000, '2021-08-16', 4, 3),
			(106, 1450, '2021-08-18', 1, 9),
			(107, 789, '2021-09-01', 3, 7),
			(108, 780, '2021-09-07', 5, 6),
			(109, 3000, '2021-09-10', 5, 3),
			(110, 2500, '2021-09-10', 2, 4),
			(111, 1000, '2021-09-15', 4, 5),
			(112, 789, '2021-09-16', 4, 7),
			(113, 31000, '2021-09-16', 1, 8),
			(114, 1000, '2021-09-16', 3, 5),
			(115, 3000, '2021-09-16', 5, 3),
			(116, 99, '2021-09-17', 2, 14);

	   select * from orders;
	   -------------------------------------
		INSERT INTO rating (RAT_ID, ORD_ID, RAT_RATSTARS)
		VALUES
		(1, 101, 4),
		(2, 102, 3),
		(3, 103, 1),
		(4, 104, 2),
		(5, 105, 4),
		(6, 106, 3),
		(7, 107, 4),
		(8, 108, 4),
		(9, 109, 3),
		(10, 110, 5),
		(11, 111, 3),
		(12, 112, 4),
		(13, 113, 2),
		(14, 114, 1),
		(15, 115, 1),
		(16, 116, 0);
 
		select * from rating;
		-------------------------------------

----------------------------------------------/*Que-4.*/-------------------------------------------------
		SELECT CUS_GENDER, COUNT(DISTINCT ORD_ID) AS Total_Customers
		FROM customer c
		JOIN `orders` o ON c.CUS_ID = o.CUS_ID
		WHERE ORD_AMOUNT >= 3000
		GROUP BY CUS_GENDER;
----------------------------------------------/*Que-5.*/-------------------------------------------------
		SELECT o.ORD_ID, p.PRO_NAME, o.ORD_AMOUNT, o.ORD_DATE, o.CUS_ID, o.PRICING_ID
		FROM orders o
		JOIN supplier_pricing sp ON o.PRICING_ID = sp.PRICING_ID
		JOIN product p ON sp.PRO_ID = p.PRO_ID
		WHERE o.CUS_ID = 2;
		-------------------------------------		
		select o.ORD_ID, p.PRO_NAME, o.ORD_AMOUNT, o.ORD_DATE, o.CUS_ID, o.PRICING_ID
		from orders o, supplier_pricing sp, product p
		where o.PRICING_ID = sp.PRICING_ID
		and sp.PRO_ID = p.PRO_ID
		and o.CUS_ID = 2;
		-------------------------------------

----------------------------------------------/*Que-6.*/-------------------------------------------------
		SELECT s.SUPP_ID, s.SUPP_NAME, COUNT(sp.PRO_ID) AS Total_Products
		FROM supplier s
		JOIN supplier_pricing sp ON s.SUPP_ID = sp.SUPP_ID
		GROUP BY s.SUPP_ID, s.SUPP_NAME
		HAVING COUNT(sp.PRO_ID) > 1;
----------------------------------------------/*Que-7.*/-------------------------------------------------
		SELECT c.CAT_ID, c.CAT_NAME, p.PRO_NAME, sp.SUPP_PRICE
		FROM category c
		JOIN product p ON c.CAT_ID = p.CAT_ID
		JOIN supplier_pricing sp ON p.PRO_ID = sp.PRO_ID
		JOIN (
			SELECT p.CAT_ID, MIN(sp.SUPP_PRICE) AS min_price
			FROM product p
			JOIN supplier_pricing sp ON p.PRO_ID = sp.PRO_ID
			GROUP BY p.CAT_ID
		) AS min_prices ON p.CAT_ID = min_prices.CAT_ID AND sp.SUPP_PRICE = min_prices.min_price;
----------------------------------------------/*Que-8.*/-------------------------------------------------
		SELECT p.PRO_ID, p.PRO_NAME
		FROM product p
		JOIN supplier_pricing sp ON p.PRO_ID = sp.PRO_ID
		JOIN orders o ON sp.PRICING_ID = o.PRICING_ID
		WHERE o.ORD_DATE > '2021-10-05';
----------------------------------------------/*Que-9.*/-------------------------------------------------

		SELECT CUS_NAME, CUS_GENDER
		FROM customer
		WHERE CUS_NAME LIKE 'A%' OR CUS_NAME LIKE '%A';
----------------------------------------------/*Que-10.*/-------------------------------------------------

       DELIMITER //
		CREATE PROCEDURE FetchSupplierRatings()
		BEGIN
			SELECT s.SUPP_ID, s.SUPP_NAME, AVG(r.RAT_RATSTARS) AS Average_Rating,
				CASE
					WHEN AVG(r.RAT_RATSTARS) = 5 THEN 'Excellent Service'
					WHEN AVG(r.RAT_RATSTARS) > 4 THEN 'Good Service'
					WHEN AVG(r.RAT_RATSTARS) > 2 THEN 'Average Service'
					ELSE 'Poor Service'
				END AS Type_of_Service
			FROM supplier s
			JOIN supplier_pricing sp ON s.SUPP_ID = sp.SUPP_ID
			JOIN orders o ON sp.PRICING_ID = o.PRICING_ID
			JOIN rating r ON o.ORD_ID = r.ORD_ID
			GROUP BY s.SUPP_ID, s.SUPP_NAME;
		END //
		DELIMITER ;

		CALL FetchSupplierRatings();
----------------------------------------------------------------------------------------------------------