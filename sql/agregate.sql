
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

