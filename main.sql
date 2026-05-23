
-- Single Table Lab Sheet

CREATE TABLE pet (name VARCHAR(20), owner VARCHAR(20), species VARCHAR(20), sex CHAR(1), checkups SMALLINT UNSIGNED, birth DATE, death DATE);

. schema
. table

INSERT INTO pet (name,owner,species,sex,checkups,birth,death)VALUES
('Fluffy','Harold','cat','f',5,'2001-02-04',NULL),
('Claws','Gwen','cat','m',2,'2000-03-17',NULL),
('Buffy','Harold','dog','f',7,'1999-05-13',NULL),
('Fang','Benny','dog','m',4,'2000-08-27',NULL),
('Bowser','Diane','dog','m',8,'1998-08-31','2001-07-29'),
('Chirpy','Gwen','bird','f',0,'2002-09-11',NULL),
('Whistler','Gwen','bird','',1,'2001-12-09',NULL),
('Slim','Benny','snake','m',5,'2001-04-29',NULL);

SELECT name FROM pet;

--Q1 (1-6)
SELECT owner, name FROM pet WHERE sex = 'f';
  
SELECT name, birth FROM pet WHERE species = 'dog';

SELECT DISTINCT owner FROM pet WHERE species = 'bird';

SELECT species FROM pet WHERE sex = 'f';

SELECT name, birth FROM pet WHERE species = 'cat' OR species = 'dog';

SELECT name, species FROM pet WHERE (species = 'cat' OR species = 'bird') AND sex = 'f';

SELECT name FROM pet WHERE name > "F" AND owner > "F";

--Q2 (1-6)
SELECT owner, name FROM pet WHERE name LIKE '%er' OR name LIKE '%all';

SELECT name FROM pet WHERE owner LIKE '%e%';

SELECT name FROM pet WHERE name NOT LIKE '%er';

SELECT name FROM pet WHERE owner LIKE '____';

SELECT owner FROM pet WHERE SUBSTR(owner, 1, 1) IN ('A','B','C','D','E','a','b','c','d','e') AND SUBSTR(owner, -1, 1) IN ('A','B','C','D','E','a','b','c','d','e');

SELECT owner FROM pet  WHERE LOWER(SUBSTR(owner, 1, 1)) BETWEEN 'a' AND 'e' AND LOWER(SUBSTR(owner, -1, 1)) BETWEEN 'a' AND 'e';

SELECT owner FROM pet  WHERE (SUBSTR(owner, 1, 1)) BETWEEN 'A' AND 'E' AND (SUBSTR(owner, -1, 1)) BETWEEN 'a' AND 'e';

--Q3 mock questions
SELECT name, birth FROM pet ORDER BY birth;

SELECT name, birth FROM pet ORDER BY birth DESC;

SELECT name, species, birth FROM pet ORDER BY species DESC, birth;

SELECT name FROM pet WHERE strftime('%m',birth) = strftime('%m','now');

SELECT name FROM pet WHERE strftime('%m', birth) = '08';

SELECT name, strftime('%m', birth) FROM pet;

SELECT name, strftime('%m', birth)AS Month FROM pet WHERE death IS NULL;

SELECT owner, name, (checkups * 20) AS income FROM pet;

SELECT owner, name, birth, MIN(strftime('%Y', birth)) AS birth_year FROM pet GROUP BY owner, name;

SELECT owner, species, COUNT(*) FROM pet GROUP BY owner, species;

--Q3 (1-6)
SELECT owner, AVG(checkups) AS avg_checkups FROM pet GROUP BY owner;

SELECT species, COUNT(*) AS total_species FROM pet GROUP BY species ORDER BY total_species ASC; 

SELECT owner, species, COUNT(*) AS total_species FROM pet GROUP BY owner, species ORDER BY owner, species;

SELECT owner, COUNT(DISTINCT species) AS distinct_species FROM pet GROUP BY owner;

SELECT species, sex, COUNT(sex) AS count_sex FROM pet WHERE sex != '' GROUP BY species, sex;

SELECT owner, COUNT(*) AS total_birds FROM pet WHERE species = 'bird' GROUP BY owner;

SELECT owner, SUM(checkups) AS total_checkups FROM pet GROUP BY owner;