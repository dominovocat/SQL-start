

--@block
SELECT * FROM users
WHERE id IN(1,2,3,4,5);


--@block
SELECT * FROM orders
WHERE id >(37);

--@block
SELECT id, user_id,
row_number() over (PARTITION by id order by user_id)
FROM orders;


--@block
SELECT brand,o.id,price,
avg(price) over (PARTITION by brand) as avg_price
FROM phones as o
JOIN orders as u ON o.id=u.id
WHERE brand='Xiaomi';


--@block
SELECT email,u.id, 
count(o.id) over(PARTITION by email) as user_orders 
FROM users as u
JOIN orders as o ON o.user_id=u.id
LIMIT all;


