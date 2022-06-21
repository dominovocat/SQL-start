

--@block
SELECT * FROM users
WHERE id IN(1,2,3,4,5);


--@block
SELECT * FROM orders
WHERE id >(37);


CREATE VIEW month_report
AS
SELECT users.id as user_id, created_at as order_ts
from users
join orders on user_id=users.id
WHERE date_part('month',created_at)=date_part('month',CURRENT_DATE);
SELECT * FROM month_report;