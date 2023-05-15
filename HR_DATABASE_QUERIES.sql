/*1. Write a query to display the names (first_name, last_name) using alias name “First Name", "Last Name"*/

select * from employees;
 select first_name as "First Name",last_name "Last Name" FROM EMPLOYEES;
 
 /*2. Write a query to get unique department ID from employee table.*/
 
 select * from employees;
 select distinct department_id from employees;
 
 /*3. Write a query to get all employee details from the employee table order by first name, descending.*/
 
 select * from employees 
order by FIRST_NAME desc;

/*4. Write a query to get the names (first_name, last_name), salary, PF of all the employees (PF is calculated as 15% of salary).*/

select first_name,last_name,salary,salary*0.15 as PF from employees;
 
  select first_name,substring(first_name,1,3) as 4word  from employees;
 select concat(first_name,' ',last_name) as NAME from employees;
 select upper(concat(first_name,' ',last_name)) as NAME from employees;
 
 /*5. Write a query to get the employee ID, names (first_name, last_name), salary in ascending order of salary.*/
 
 select EMPLOYEE_ID,concat(first_name,' ',last_name) as NAME,salary from employees
 order by salary asc;
 
 /*6. Write a query to get the total salaries payable to employees.*/
 select round(sum(salary),0) from employees;
 
 /*8. Write a query to get the average salary and number of employees in the employees table.*/
  select * from employees;
 select round(avg(salary),2) "AVG",count(employee_id) "TOTAL EMPLOYEE" from employees;
 
/* 9. Write a query to get the number of employees working with the company.*/
select * from employees;
select count(*) "TOTAL EMPLOYEE" from employees;

/*10. Write a query to get the number of jobs available in the employees table. */
select * from employees;
SELECT * FROM job_history;

SELECT COUNT(distinct(JOB_ID)) FROM EMPLOYEES;

/*11. Write a query get all first name from employees table in upper case.*/

SELECT UPPER(FIRST_NAME) FROM EMPLOYEES;

/*12. Write a query to get the first 3 characters of first name from employees table.*/

select substring(first_name,1,3) as 3CHAR from employees;

/*13. Write a query to calculate 171*214+625.*/

SELECT 171*214+625 RESULT;

/*14. Write a query to get the names (for example Ellen Abel, Sundar Ande etc.) of all the employees from employees table.*/

select concat(first_name,' ',last_name) as NAME from employees;

/*15. Write a query to get first name from employees table after removing white spaces from both side.*/
SELECT FIRST_NAME,TRIM(FIRST_NAME) AS NO FROM EMPLOYEES;

/*16. Write a query to get the length of the employee names (first_name, last_name) from employees table.*/

SELECT FIRST_NAME,LAST_NAME,LENGTH(FIRST_NAME)+LENGTH(LAST_NAME) AS LENGTH_OF_NAME FROM employees;

/*17. Write a query to check if the first_name fields of the employees table contains numbers. */

SELECT * FROM employees
WHERE FIRST_NAME REGEXP '[0-9]';

/*18. Write a query to select first 10 records from a table.*/

SELECT * FROM EMPLOYEES LIMIT 10;

/*19. Write a query to get monthly salary (round 2 decimal places) of each and every employee Go to the editor
Note : Assume the salary field provides the 'annual salary' information.*/

SELECT FIRST_NAME,LAST_NAME, ROUND(SALARY/12,2) AS "MONTHLY SALARY" FROM employees;

/*20. Write a query to display the name (first_name, last_name) and
 salary for all employees whose salary is not in the range $10,000 through $15,000.*/
 
 select first_name,last_name,salary from employees
 where  salary  not between 10000 and 15000;
 
 /*21. Write a query to display the name (first_name, last_name) and
 department ID of all employees in departments 30 or 100 in ascending order.*/
 
 select first_name,last_name,department_id from employees
 where DEPARTMENT_ID IN (30,100)
 order by department_id asc;
 
 /*22. Write a query to display the name (first_name, last_name) and salary for all employees whose salary is not in 
 the range $10,000 through $15,000 and are in department 30 or 100.*/
 
 select first_name,last_name,salary from employees
 where  salary  not between 10000 and 15000 and DEPARTMENT_ID IN (30,100);
 
 /*23.Write a query to display the name (first_name, last_name) and hire date for all employees who were hired in 1987.*/
 
 select first_name,last_name,HIRE_DATE from employees
 where extract(year from hire_date)=1987;
 
/* 24. Write a query to display the first_name of all employees who have both "b" and "c" in their first name.*/

select first_name from employees
where first_name like '%b%' and  FIRST_NAME like  '%c%';


/*25. Write a query to display the last name, job, and salary for all employees whose job is that of a Programmer or a Shipping Clerk, and
 whose salary is not equal to $4,500, $10,000, or $15,000.*/
  
select * from employees;
/*last_name job_id   salary*/
select * from jobs;
/*job_title  job_id */

select  e.last_name,j.job_title,e.salary from employees e
inner join jobs j on e.job_id=j.job_id
where j.JOB_TITLE in  ('Shipping Clerk','Programmer') 
and e.salary not in  (4500,10000,15000);

/*26. Write a query to display the last name of employees whose names have exactly 6 characters.*/

select last_name,length(last_name) from employees
where last_name like '______';

/*27. Write a query to display the last name of employees having 'e' as the third character.*/
 
 select last_name from employees
 where last_name like '__e%';
 
 
 /*28. Write a query to display the jobs/designations available in the employees table*/
 
 select   distinct(JOB_ID) from employees ;
 
 /*29. Write a query to display the name (first_name, last_name), salary and PF (15% of salary) of all employees*/
 
 select FIRST_NAME,LAST_NAME,SALARY,salary*15/100 as PF from employees;
 
/*30.Write a query to select all record from employees where last name in 'BLAKE','SCOTT','KING'and'FORD'*/


select * from employees
where last_name in ('blake','scott','king','ford'); 

/*31. Write a query to find the name (first_name, last_name) and 
the salary of the employees who have a higher salary than the employee whose last_name='Bull'.*/


select first_name,last_name,salary from employees
where salary>(select salary from employees where last_name='bull');

/*32. Write a query to find the name (first_name, last_name) of all employees who works in the IT department.*/

select first_name,last_name from employees
where department_id=
(select department_id from departments where department_name='IT');

/*33. Write a query to find the name (first_name, last_name) of the employees who have a manager and worked in a USA based department.*/

select first_name,last_name from employees
where manager_id in (select employee_id from employees where department_id 
in (select department_id from departments where location_id 
in (select location_id from locations where COUNTRY_ID='US')));

/*34. Write a query to find the name (first_name, last_name) of the employees who are managers.*/

SELECT FIRST_NAME,LAST_NAME FROM EMPLOYEES
WHERE  EMPLOYEE_ID IN (SELECT MANAGER_ID FROM EMPLOYEES);

/*35. Write a query to find the name (first_name, last_name), and salary of the employees whose salary is greater than the average salary.*/

SELECT  FIRST_NAME,LAST_NAME,SALARY FROM EMPLOYEES
WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEES);

/*36. Write a query to find the name (first_name, last_name), and salary of the employees whose salary is equal to the minimum salary for their job grade.*/

SELECT  FIRST_NAME,LAST_NAME,SALARY FROM EMPLOYEES
WHERE SALARY IN (SELECT MIN_SALARY FROM JOBS
WHERE employees.JOB_ID=JOBS.JOB_ID);

/*37. Write a query to find the name (first_name, last_name), and 
salary of the employees who earns more than the average salary and works in any of the IT departments.*/

SELECT  FIRST_NAME,LAST_NAME,SALARY FROM EMPLOYEES
WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEES) and 
DEPARTMENT_ID IN (SELECT DEPARTMENT_ID FROM departments WHERE DEPARTMENT_NAME='IT');

/*38. Write a query to find the name (first_name, last_name), and salary of the employees who earns more than the earning of Mr. Bell.*/

SELECT  FIRST_NAME,LAST_NAME,SALARY FROM EMPLOYEES
WHERE SALARY > (SELECT SALARY FROM EMPLOYEES WHERE LAST_NAME='BELL')
ORDER BY FIRST_NAME ASC;


/*39. Write a query to find the name (first_name, last_name), and 
salary of the employees who earn the same salary as the minimum salary for all departments.*/

SELECT  FIRST_NAME,LAST_NAME,SALARY FROM EMPLOYEES
WHERE SALARY IN (SELECT MIN(SALARY) FROM EMPLOYEES);

/*40. Write a query to find the name (first_name, last_name), and salary of the employees 
whose salary is greater than the average salary of all departments.*/

SELECT  FIRST_NAME,LAST_NAME,SALARY FROM EMPLOYEES
WHERE SALARY > all(SELECT AVG(SALARY) FROM EMPLOYEES GROUP BY DEPARTMENT_ID);

/*41. Write a query to find the name (first_name, last_name) and salary of the employees who earn a salary that is higher than 
the salary of all the Shipping Clerk (JOB_ID = 'SH_CLERK'). 
Sort the results of the salary of the lowest to highest.*/

select * from employees
where salary > all(select salary from employees where job_id='SH_CLERK') order by salary desc;

/*42. Write a query to find the name (first_name, last_name) of the employees who are not supervisors.*/

select first_name,last_name from employees
where employee_id not in (select manager_id from employees);


/*43. Write a query to display the employee ID, first name, last name, and department names of all employees.*/

select employee_id,first_name,last_name,(select department_name from departments d
where e.department_id=d.department_id) Department from employees e order by department;

/*44. Write a query to display the employee ID, first name, last name, salary of all employees whose salary is 
above average for their departments*/

select employee_id,first_name,last_name from employees e
where salary>(select AVG(salary) from employees where department_id=e.department_id);

/*45. Write a query to fetch even numbered records from employees table.*/

select * from employees
where mod(employee_id,2)=0;

/*46. Write a query to find the 5th maximum salary in the employees table*/

select distinct(salary) as DS from employees
order by DS desc limit 1 offset 4;
 
 
 
 
 
 
 
