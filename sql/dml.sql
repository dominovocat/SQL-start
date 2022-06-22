

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