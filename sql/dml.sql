

--@block
UPDATE users 
SET tall = 1.9
WHERE date_part ('year', ("dob")) BETWEEN 1000 AND 1980;


--@block
UPDATE phones
SET amount = 15
WHERE amount <=10
RETURNING *;


--@block
UPDATE phones
set price = price *1.05
WHERE brand = 'Samsung'
RETURNING *;


--@block
DELETE FROM phones_to_orders
WHERE amount <5
RETURNING*;


--@block
CREATE TABLE brands(
  id serial PRIMARY KEY,
  name VARCHAR(32) UNIQUE NOT NULL check(char_length(name)>3)
);


--@block
ALTER TABLE phones
ADD FOREIGN KEY (brand) REFERENCES brands(name)
ON DELETE CASCADE;