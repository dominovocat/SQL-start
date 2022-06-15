

--@block
CREATE TABLE "this_products"(
  id serial PRIMARY KEY,
  name VARCHAR(32) NOT NULL CHECK(char_length(name)>=3),
  price DECIMAL (7,2) NOT NULL CHECK(price > 0.00),
  brand VARCHAR(32) NOT NULL CHECK(char_length(brand)>=2),
  UNIQUE(name,brand)
);

--@block
INSERT INTO "this_products"(name,price,brand)
VALUES
('Sitro',20.00,'Krinica'),
('Sadochok',23.50,'Durka'),
('Golova',1488.00,'Chepuha'),
('Smile',60.90,'Regular'),
('Yabloko',26.11,'Grusa'),
('Apple',23.50,'Mda'),
('Cherenok',1488.00,'Uho'),
('Magazin',60.90,'Kek'),
('Mirnov',20.00,'Burchik'),
('Jivchik',23.50,'0Fantasy'),
('(=_=)',1488.00,'limon'),
('Ulibka',60.90,'Neulibka'),
('Nesitro',20.00,'Nekrinica'),
('Tworog',23.50,'Networog'),
('Chees',1488.00,'Ferma'),
('Egg',60.90,'WorldEgg');


SELECT price 
FROM "this_products"
WHERE price > 100;

SELECT *
FROM "this_products"
ORDER BY price;

SELECT brand,count(*)
FROM "this_products"
GROUP BY brand;

SELECT brand,price
FROM "this_products"
WHERE brand = 'Tworog'
AND price >20.00;

SELECT brand,count(id)
FROM "this_products"
GROUP BY brand
;


CREATE EXTENSION IF NOT EXISTS "uuid-ossp"
CREATE TABLE cars(
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  model VARCHAR(32) NOT NULL,
  brand VARCHAR(32) NOT NULL,
  UNIQUE(brand,model)
);

INSERT INTO cars (model,brand) VALUES ('Model Y','Tesla');


--@block
CREATE TABLE airplane(
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  model VARCHAR(32) NOT NULL,
  brand VARCHAR(32) NOT NULL,
  UNIQUE(brand,model)
);

--@block
INSERT INTO airplane(model,brand)
VALUES('X-Wing','Rebels'),
('T-Wing','Rebels'),
('StarDestroyer','Empire'),
('DarkWing','Empire')
;

--@block
CREATE TABLE users(
  id serial PRIMARY KEY,
  full_name varchar NOT NULL,
  email varchar(32) NOT NULL UNIQUE,
  dob date NOT NULL,
  country VARCHAR(32) NOT NULL
);