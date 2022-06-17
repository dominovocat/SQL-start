


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
