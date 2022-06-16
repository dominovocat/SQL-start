--@block
CREATE TABLE brands(
  id serial PRIMARY KEY,
  name VARCHAR(64) NOT NULL UNIQUE CHECK(name !=='')
);

--@block
CREATE TABLE goods(
  id serial PRIMARY KEY,
  name VARCHAR(128) NOT NULL CHECK (char_length(name)>=4),
  brand_id int REFERENCES brands(id)
);



--@block
CREATE TABLE "groups"(
  id serial PRIMARY KEY,
  name VARCHAR(30) NOT NULL UNIQUE CHECK(char_length(name)>=1),
  turn int NOT NULL UNIQUE
);

--@block
CREATE TABLE "lessons"(
  id serial PRIMARY KEY,
  name VARCHAR(30) NOT NULL UNIQUE CHECK(char_length(name)>=1)
);

CREATE TABLE "group_to_lessons"(
  group_id int REFERENCES groups(id),
  lessons_id int REFERENCES lessons(id),
  real_turn int NOT NULL CHECK(real_turn>=1),
  UNIQUE(group_id,lessons_id)
);

INSERT INTO "groups"(name,turn) VALUES 
('1-A',3),
('2-B',1),
('5-A',2);

INSERT INTO "lessons"(name) VALUES
('Math'),
('OOP'),
('History');

--@block
INSERT INTO "group_to_lessons" VALUES
(2,2,3),
(1,3,3),
(3,1,1);

--@block
DROP TABLE groups,lessons,group_to_lessons;



SELECT name FROM groups;



