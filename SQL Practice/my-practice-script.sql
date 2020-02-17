
;------------------------------------------
--DDL statement for table 'HR' database--
--------------------------------------------

CREATE TABLE EMPLOYEES (
                            EMP_ID CHAR(9) NOT NULL, 
                            F_NAME VARCHAR(15) NOT NULL,
                            L_NAME VARCHAR(15) NOT NULL,
                            SSN CHAR(9),
                            B_DATE DATE,
                            SEX CHAR,
                            ADDRESS VARCHAR(30),
                            JOB_ID CHAR(9),
                            SALARY DECIMAL(10,2),
                            MANAGER_ID CHAR(9),
                            DEP_ID CHAR(9) NOT NULL,
                            PRIMARY KEY (EMP_ID));
                            
  CREATE TABLE JOB_HISTORY (
                            EMPL_ID CHAR(9) NOT NULL, 
                            START_DATE DATE,
                            JOBS_ID CHAR(9) NOT NULL,
                            DEPT_ID CHAR(9),
                            PRIMARY KEY (EMPL_ID,JOBS_ID));
 
 CREATE TABLE JOBS (
                            JOB_IDENT CHAR(9) NOT NULL, 
                            JOB_TITLE VARCHAR(15) ,
                            MIN_SALARY DECIMAL(10,2),
                            MAX_SALARY DECIMAL(10,2),
                            PRIMARY KEY (JOB_IDENT));

CREATE TABLE DEPARTMENTS (
                            DEPT_ID_DEP CHAR(9) NOT NULL, 
                            DEP_NAME VARCHAR(15) ,
                            MANAGER_ID CHAR(9),
                            LOC_ID CHAR(9),
                            PRIMARY KEY (DEPT_ID_DEP));

CREATE TABLE LOCATIONS (
                            LOCT_ID CHAR(9) NOT NULL,
                            DEP_ID_LOC CHAR(9) NOT NULL,
                            PRIMARY KEY (LOCT_ID,DEP_ID_LOC));
                            
;-------------------------------------


-- Query 1------
;
select F_NAME , L_NAME
from EMPLOYEES
where ADDRESS LIKE '%Elgin,IL%' ;

--Query 2--
;
select F_NAME , L_NAME , B_DATE
from EMPLOYEES
where B_DATE LIKE '197%' ;

--Query 3--
;
select *
from EMPLOYEES
where DEP_ID = 5 and SALARY between 60000 and 70000;

--Query 4a--
;
select *
from EMPLOYEES
order by DEP_ID;

--Query4B--
;
select *
from EMPLOYEES
order by DEP_ID desc , L_NAME desc; 

--Query 5a--
;
select DEP_ID, count(*) as count
from EMPLOYEES
group by DEP_ID;


--Query 5b--
;
select DEP_ID , AVG(SALARY) as avg_salary , count(*) as count
from EMPLOYEES
group by DEP_ID;

--Query 5c--
;
select DEP_ID , AVG(SALARY) as avg_salary , count(*) as NUM_EMPLOYEES
from EMPLOYEES
group by DEP_ID;

--Query 5D--
;
select DEP_ID , AVG(SALARY) as avg_salary , count(*) as NUM_EMPLOYEES
from EMPLOYEES
group by DEP_ID order by avg_salary;

--Query 5e--
;
select DEP_ID , AVG(SALARY) as avg_salary , count(*) as NUM_EMPLOYEES
from EMPLOYEES
group by DEP_ID having count(*) < 5 order by avg_salary;

--Query 6--
;
select D.DEP_NAME , E.F_NAME, E.L_NAME , E.SALARY
from EMPLOYEES as E, DEPARTMENTS as D
where E.DEP_ID = D.DEPT_ID_DEP
order by D.DEP_NAME, E.SALARY desc;


--------------------------------------------------------------

-- Drop the PETSALE table in case it exists
drop table PETSALE;
-- Create the PETSALE table 
create table PETSALE (
	ID INTEGER PRIMARY KEY NOT NULL,
	ANIMAL VARCHAR(20),
	QUANTITY INTEGER,
	SALEPRICE DECIMAL(6,2),
	SALEDATE DATE
	);
-- Insert sample data into PETSALE table
insert into PETSALE values 
	(1,'Cat',9,450.09,'2018-05-29'),
	(2,'Dog',3,666.66,'2018-06-01'),
	(3,'Dog',1,100.00,'2018-06-04'),
	(4,'Parrot',2,50.00,'2018-06-04'),
	(5,'Dog',1,75.75,'2018-06-10'),
	(6,'Hamster',6,60.60,'2018-06-11'),
	(7,'Cat',1,44.44,'2018-06-11'),
	(8,'Goldfish',24,48.48,'2018-06-14'),
	(9,'Dog',2,222.22,'2018-06-15')
;


select * from PETSALE; 
select sum(SALEPRICE) as price_sum from PETSALE;
select max(SALEPRICE) as price_max from PETSALE;
select max(QUANTITY) as min_quantity from PETSALE where LCASE(ANIMAL) = 'cat'; 
select round(SALEPRICE) from PETSALE;
select DAY(SALEDATE) from PETSALE where LCASE(ANIMAL) = 'cat';
select * from PETSALE where MONTH(SALEDATE) = '05';
select (SALEDATE + 3) from PETSALE;
select (CURRENT_DATE - SALEDATE) from PETSALE;


--------------------------------------------------------------------------------------

select EMP_ID , F_NAME , L_NAME , SALARY
from employees
where SALARY > (select avg(SALARY) from employees);

select * from (select F_NAME from employees) as EMP4ALL;

select DEPT_ID_DEP , DEP_NAME from departments 
where DEPT_ID_DEP IN (select DEP_ID from employees where SALARY > 70000);





