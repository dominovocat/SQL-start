


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

--@block
SELECT *
FROM A,B
WHERE A.name = B.name;


--@block
SELECT brand,id
FROM phones
JOIN phones_to_orders ON phone_id=id
WHERE order_id = 19;


--@block
SELECT count(*),u.email AS "order count" 
FROM orders AS o
JOIN users AS u ON o.user_id=u.id
WHERE user_id = 4
GROUP BY email;


--@block
SELECT count(o.id),u.* 
FROM users as u
JOIN orders as o ON u.id=o.user_id
GROUP BY u.id;


--@block
SELECT o.*
FROM orders as o
JOIN phones_to_orders as pto ON pto.order_id=o.id
WHERE pto.phone_id=1;


--@block
SELECT sum(amount)
FROM phones_to_orders
WHERE order_id=3;


--@block
SELECT * 
FROM users as u
JOIN orders as o ON o.user_id=u.id
