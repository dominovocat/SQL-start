--@block
CREATE OR REPLACE FUNCTION month_report(month int) RETURNS TABLE (user_id int, order_ts timestamp) As $$ BEGIN RETURN QUERY
SELECT u.id, o.created_at
  FROM users as u
  JOIN orders as o ON o.user_id = u.id
WHERE date_part('month', o.created_at) = month;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM month_report(6);


--@block
CREATE OR REPLACE FUNCTION group_report(groups int) RETURNS TABLE (group_id int, lessons_id int)
AS $$ 
BEGIN RETURN QUERY
SELECT u.id,o.lessons_id
FROM groups as u
JOIN group_to_lessons as o ON o.group_id=u.id 
WHERE o.group_id=groups;
END;
 $$
 LANGUAGE plpgsql;

 SELECT * FROM group_report(2);


 