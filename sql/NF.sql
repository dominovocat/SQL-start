

--@block  --"1NF"
CREATE TABLE "employee"(
  "firstName" VARCHAR(32) NOT NULL,
  "lastName" VARCHAR(32) NOT NULL,
  "email" VARCHAR(16) NOT NULL UNIQUE --employees_email_key
);


--@block  --"2NF"
CREATE TABLE "employee"(
  "firstName" VARCHAR(32) NOT NULL,
  "lastName" VARCHAR(32) NOT NULL,
  "email" VARCHAR(16) NOT NULL UNIQUE,
  position VARCHAR(32) NOT NULL,
  office VARCHAR(32) NOT NULL
);


CREATE TABLE "subjects"(
  name VARCHAR(32) NOT NULL UNIQUE
);

CREATE TABLE "students"(
  name VARCHAR(32) NOT NULL,
  teacher VARCHAR,
  subject varchar(32) NOT NULL,
  UNIQUE(teacher,subject)
);

CREATE TABLE "teachers"(
  name VARCHAR(32)NOT NULL UNIQUE,
  subject VARCHAR(32) REFERENCES subjects(subject)
);

b






