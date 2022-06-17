--@block
SELECT count(*)
FROM users
WHERE country = 'Ontario';
--@block
SELECT count(*)
FROM users
WHERE full_name = 'Roberto Reyes' --@block
SELECT count(*)
FROM users - -
WHERE date_part('year', age("dob")) > 72 -- WHERE date_part ('year',"dob")<1950
  -- WHERE date_part('year',"dob")BETWEEN 1982 AND 1992
WHERE date_part ('year', age("dob")) BETWEEN 30 AND 40 --@block
SELECT avg(tall)
FROM users;
--@block
SELECT country,
  avg(date_part('year', age("dob"))),
  count(*),
  id
FROM users -- WHERE country = 'Ontario' AND country = 'Zeelan' OR country = 'Breman'
GROUP BY country,
  id
HAVING country = 'Ontario'
  AND country = 'Istanbul'
  OR country = 'Virginia';
--@block
SELECT brand,
  sum(price)
FROM "this_products"
GROUP BY brand;
--@block
SELECT brand,
  min(price),
  max(price)
FROM "this_products"
WHERE price > 100
GROUP BY brand;
--@block
DROP TABLE orders,
phones;
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
  model VARCHAR(32) NOT NULL check(char_length(model) >= 3),
  brand VARCHAR(32) NOT NULL check(char_length(brand) >= 3),
  price DECIMAL(9, 2) NOT NULL CHECK(price > 0.00),
  amount int NOT NULL CHECK(amount >= 0),
  "create_at" TIMESTAMP NOT NULL DEFAULT current_date,
  UNIQUE(model, brand)
);
--@block
CREATE TABLE phones_to_orders(
  order_id int REFERENCES orders(id),
  phone_id int REFERENCES phones(id),
  amount int NOT NULL CHECK(amount > 0) DEFAULT 1,
  PRIMARY KEY(order_id, phone_id)
);
--@block
DELETE FROM prones_to_orders --@block
INSERT INTO phones(model, brand, price, amount)
VALUES ('3310', 'NOKIA', 500, 10),
  ('3300', 'NOKIA', 600, 20),
  ('Redmi 3', 'Xiaomi', 1000, 15),
  ('Redmi 5', 'Xiaomi', 1500, 20),
  ('Note 5', 'Xiaomi', 2000, 10),
  ('Honor 1', 'Huawei', 1500, 10),
  ('F12', 'Huawei', 3000, 40),
  ('Galaxy', 'Samsung', 1500, 10),
  ('A 51', 'Samsung', 4000, 15),
  ('G20', 'OPPO', 1500, 20);
--@block
SELECT avg(price)
FROM phones;
--@block
SELECT avg(price)
FROM phones
WHERE brand = 'Huawei';
--@block
SELECT avg(amount)
FROM phones_to_orders;
--@block
SELECT sum(brand * price)
FROM phones --@block
SELECT user_id,
  count(*)
FROM orders
GROUP BY user_id;

--@block
SELECT sum(price * amount),
  brand
FROM phones
GROUP BY brand;
--@block
SELECT sum(price * amount)
FROM phones
WHERE price BETWEEN 2000 AND 5000;


--@block
SELECT max(amount)
FROM phones_to_orders --@block
SELECT order_id,
  amount,
  phone_id
FROM phones_to_orders
ORDER BY amount DESC;

--@block
CREATE TABLE A(name VARCHAR(16) PRIMARY KEY);
CREATE TABLE B(name VARCHAR(16) PRIMARY KEY);

--@block
INSERT INTO A
VALUES ('XYZ'),
  ('XXX'),
  ('ZZZ'),
  ('YYY');


--@block
INSERT INTO B
VALUES('AAA'),
('BBB'),
('CCC'),
('ZZZ');

--@block
SELECT * FROM A UNION SELECT * FROM B;


--@block
INSERT INTO A 
VALUES ('CCC');

--@block
SELECT *
FROM A INTERSECT 
SELECT * FROM B;


--@block
SELECT phone_id 
FROM phones_to_orders
INTERSECT
SELECT id FROM phones;


--@block
SELECT id
FROM phones
EXCEPT
SELECT phone_id 
FROM phones_to_orders;
DELETE FROM phones_to_orders WHERE phone_id=10;
