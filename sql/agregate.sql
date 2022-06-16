
--@block
SELECT count(*)
FROM users
WHERE country='Ontario';

--@block
SELECT count(*)
FROM users
WHERE full_name = 'Roberto Reyes'

--@block
SELECT count(*)
FROM users
-- WHERE date_part('year',age("dob"))>72
-- WHERE date_part ('year',"dob")<1950
-- WHERE date_part('year',"dob")BETWEEN 1982 AND 1992
WHERE date_part ('year',age("dob")) BETWEEN 30 AND 40

--@block
SELECT avg(tall)
FROM users;

--@block
SELECT country,avg(date_part('year',age("dob"))),count(*),id 
FROM users
-- WHERE country = 'Ontario' AND country = 'Zeelan' OR country = 'Breman'
GROUP BY country,id
HAVING country = 'Ontario' AND country = 'Istanbul' OR country = 'Virginia'
;



--@block
SELECT brand,sum(price)
FROM "this_products"
GROUP BY brand;


--@block
SELECT brand,min(price),max(price)
FROM "this_products"
WHERE price >100
GROUP BY brand;

--@block
DROP TABLE orders,phones;

--@block
CREATE TABLE orders (
  id serial PRIMARY KEY,
  "created_at" TIMESTAMP NOT NULL DEFAULT current_date,
  "adress" VARCHAR(32),
  "user_id" int REFERENCES users(id) ON DELETE CASCADE
);

--@block
CREATE TABLE phones(
  id serial PRIMARY KEY,
  model VARCHAR(32) NOT NULL check(char_length(model)>=3),
  brand VARCHAR(32) NOT NULL check(char_length(brand)>=3),
  price DECIMAL(9,2) NOT NULL CHECK(price>0.00),
  amount int NOT NULL  CHECK(amount>=0),

  "create_at" TIMESTAMP NOT NULL DEFAULT current_date,
  UNIQUE(model,brand)
);


--@block
CREATE TABLE phones_to_orders(
  order_id int REFERENCES orders(id),
  phone_id int REFERENCES phones(id),
  amount int NOT NULL CHECK(amount>0) DEFAULT 1,
  PRIMARY KEY(order_id,phone_id)
);


--@block
INSERT INTO phones(model,brand,price,amount)
VALUES
('3310','NOKIA',500,10),
('3300','NOKIA',600,20),
('Redmi 3','Xiaomi',1000,15),
('Redmi 5','Xiaomi',1500,20),
('Note 5','Xiaomi',2000,10),
('Honor 1','Huawei',1500,10),
('F12','Huawei',3000,40),
('Galaxy','Samsung',1500,10),
('A 51','Samsung',4000,15),
('G20','OPPO',1500,20);
