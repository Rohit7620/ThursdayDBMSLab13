use thursdaylabdbms13;
create table employee (
e_id int primary key, 
first_name varchar(20) not null,
 last_name varchar(20) not null,
 Email varchar(20) not null ,
 DOB Varchar(20) not null,
 Phone_no varchar(10) not null unique key, 
 city varchar(10) not null , 
 state varchar(20) not null , 
 DOJ varchar(20) not null , 
 Des varchar(20) not null
 );
 insert into employee values
(1,'Rajesh','varma','Ramesh@gmamil.com','30-10-2002','7667789878','Pune','Maharashtra','30-10-2002','Soft Developer'),
(2,'suraj','sharma','shuraj@gmamil.com','1-10-2002','7845689545','Goa','Maharashtra','30-10-2002','java Developer'),
(3,'manish','kamble','kmanish@gmamil.com','12-10-2002','7667745327','Pune','Maharashtra','30-10-2002','Electric Developer'),
(4,'priti','jadhav','priti@gmamil.com','30-10-2002','7667789788','Mumbai','Maharashtra','30-10-2002','Web Developer'),
(5,'sneha','kamble','sneha@gmamil.com','30-10-2002','7667789876','Mumbai','Maharashtra','30-10-2002','Soft Developer'),
(6,'vijay','varma','vijay@gmamil.com','30-10-2002','7667787865','Mumbai','Maharashtra','30-10-2002','Soft Developer'),
(7,'vaishnavi','jadhav','vaish@gmamil.com','30-10-2002','7667789678','Mumbai','Maharashtra','30-10-2002','java Developer'),
(8,'shivani','gaikwad','shivani@gmamil.com','30-10-2002','7667789980','Pune','Maharashtra','30-10-2002','java Developer'),
(9,'Rajesh','gaikwad','Rajesh@gmamil.com','30-10-2002','7667784545','Pune','Maharashtra','30-10-2002','Soft Developer'),
(10,'Raj','varma','Raj@gmamil.com','30-10-2002','766772345','Pune','Maharashtra','30-10-2002','web Developer');
truncate employee;
select *from employee;

create table department (
d_id int primary key,
 d_name varchar(20) not null,
 e_id int not null, 
 location varchar(20) not null ,
 salary int not null
 );
 
 insert into department values
(1,'IT',1,'Pune',40000),
(2,'CO',2,'Mumbai',50000),
(3,'IT',3,'Nagpur',60000),
(4,'ME',4,'Nanded',70000),
(5,'CIVIL',5,'Bangolor',80000),
(6,'EE',6,'Pune',30000);
select *from department;

/*Fetch department id , employee firstname , last name , designination , date of joining.*/
select employee.first_name, employee.last_name, employee.Des, employee.DOJ , department.d_name
from employee,department;

/*Fetch  employee firstname , employee last name , employee designination , employee date of joining, employee joining date , employee city from employee table which has department name is IT and  employee city is MUMBAI*/
select employee.first_name, employee.last_name, department.d_name, employee.Des, employee.DOJ , employee.city
from employee , department where department.d_name = 'IT' and employee.city = 'Mumbai';

alter table employee add constraint kk1 foreign key(Des) references department(location);


SELECT first_name, DOj, Des FROM employee  WHERE des = 'Java Developer' in (select e_id from department where salary >= 30000);

/* Q-1. Write an SQL query to fetch “FIRST_NAME” from  Employee table using the alias name as <EMPLOYEE_NAME>.*/
SELECT FIRST_NAME AS "<EMPLOYEE_NAME>" FROM Employee;

/* Q-2. Write an SQL query to fetch “FIRST_NAME” from  EMPLOYEE table in upper case.*/
SELECT UPPER(FIRST_NAME) AS FIRST_NAME_UPPERCASE FROM Employee;

/* Q-3. Write an SQL query to fetch unique values of  DEPARTMENT from EMPLOYEE table.*/
SELECT DISTINCT e_id FROM Employee;

/* Q-4. Write an SQL query to print the first three characters  of FIRST_NAME from EMPLOYEE table.*/
SELECT SUBSTRING(FIRST_NAME, 1, 3) AS FIRST_THREE_CHARACTERS FROM Employee;

/* Q-5. Write an SQL query to find the position of the  alphabet (‘a’) in the first name column ‘Amitabh’ from  EMPLOYEE table.*/
SELECT POSITION('a' IN FIRST_NAME) AS A_POSITION FROM Employee WHERE FIRST_NAME = 'sneha';

/* Q-6. Write an SQL query to print the FIRST_NAME from  EMPLOYEE table after removing white spaces from the right side.*/
SELECT RTRIM(FIRST_NAME) AS FIRST_NAME_WITHOUT_RIGHT_WHITESPACE FROM Employee;

/* Q-7. Write an SQL query to print the DEPARTMENT from  EMPLOYEE table after removing white spaces from the  left side.*/
SELECT LTRIM(e_id) AS DEPARTMENT_WITHOUT_LEFT_WHITESPACE FROM Employee;

/* Q-8. Write an SQL query that fetches the unique values of  DEPARTMENT from EMPLOYEE table and prints its  length.*/
SELECT employee, LENGTH(employee) AS DEPARTMENT_LENGTH FROM Employee GROUP BY e_id;

/* Q-9. Write an SQL query to print the FIRST_NAME from  EMPLOYEE table after replacing ‘a’ with ‘A’. */
SELECT REPLACE(FIRST_NAME, 'a', 'A') AS MODIFIED_FIRST_NAME FROM EMPLOYEE;

/* Q-10. Write an SQL query to print the FIRST_NAME and  LAST_NAME from EMPLOYEE table into a single column COMPLETE_NAME. A space char should separate them.*/
SELECT first_name || ' ' || last_name AS COMPLETE_NAME FROM employee;

/* Q-11. Write an SQL query to print all EMPLOYEE details  from the EMPLOYEE table order by FIRST_NAME  Ascending.*/
SELECT * FROM EMPLOYEE ORDER BY FIRST_NAME ASC;

/* Q-12. Write an SQL query to print all EMPLOYEE details  from the EMPLOYEE table order by FIRST_NAME  Ascending and DEPARTMENT Descending.*/
SELECT * FROM EMPLOYEE ORDER BY FIRST_NAME ASC, DEPARTMENT DESC;

/* Q-13. Write an SQL query to print details for EMPLOYEEs  with the first name as “Vipul” and “Satish” from  EMPLOYEE table.*/
SELECT * FROM EMPLOYEE WHERE FIRST_NAME IN ('Vipul', 'Satish');

/* Q-14. Write an SQL query to print details of EMPLOYEEs  excluding first names, “Vipul” and “Satish” from  EMPLOYEE table.*/
SELECT * FROM EMPLOYEE WHERE FIRST_NAME NOT IN ('Vipul', 'Satish');

/* Q-15. Write an SQL query to print details of EMPLOYEEs  with DEPARTMENT name as “Admin”.*/
SELECT * FROM EMPLOYEE WHERE d_name = 'Admin';

/* Q-16. Write an SQL query to print details of the  EMPLOYEEs whose FIRST_NAME contains ‘a’.*/
SELECT * FROM EMPLOYEE WHERE FIRST_NAME LIKE '%a%';

/* Q-17. Write an SQL query to print details of the  EMPLOYEEs whose FIRST_NAME ends with ‘a’.*/
SELECT * FROM EMPLOYEE WHERE FIRST_NAME LIKE '%a';

/* Q-18. Write an SQL query to print details of the  EMPLOYEEs whose FIRST_NAME ends with ‘h’ and  contains six alphabets.*/
SELECT * FROM EMPLOYEE WHERE FIRST_NAME LIKE '______h';

/* Q-19. Write an SQL query to print details of the  EMPLOYEEs whose SALARY lies between 100000 and  500000.*/
SELECT * FROM EMPLOYEE WHERE SALARY BETWEEN 100000 AND 500000;

/* Q-20. Write an SQL query to print details of the  EMPLOYEEs who have joined in Feb’2014.*/
SELECT * FROM EMPLOYEE WHERE MONTH(JOIN_DATE) = 2 AND YEAR(JOIN_DATE) = 2014;





