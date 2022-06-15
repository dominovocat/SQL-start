--@block
CREATE TABLE IF NOT EXISTS "manufacturers"(
  id serial PRIMARY KEY,
  brand VARCHAR(20) NOT NULL CHECK(char_length(brand) >= 3),
  adress VARCHAR(30) NOT NULL CHECK(char_length(adress) >= 3)
);
--@block
CREATE TABLE IF NOT EXISTS "new_products"(
  id serial PRIMARY KEY,
  model VARCHAR(50) NOT NULL CHECK(char_length(model) >= 2),
  price DECIMAL NOT NULL CHECK (
    price BETWEEN 100 and 100000
  ),
  amount DECIMAL (10, 2) NOT NULL DEFAULT 0,
  manufacturer_id int REFERENCES "manufacturers"(id)
);
--@block
INSERT INTO "manufacturers" (brand, adress)
VALUES
('Nokia', 'Norway'),
('Samsung', 'North Korea'),
('Xiaomi', 'China'),
('Blackberry', 'USA') 


--@block
INSERT INTO "new_products"(model, price, amount, manufacturer_id)
VALUES
('G20', 4000, 100, 1),
('Key2', 18682.00, 50, 4),
('Note 5', 5500.00, 250, 3),
('Galaxy A51', 3500.00, 400, 2);