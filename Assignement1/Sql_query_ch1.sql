
use Company_SD

--- 1 ---
SELECT * FROM Employee

--- 2 ---
SELECT Fname , Lname , Salary ,Dno FROM Employee

--- 3 ---
SELECT Pname ,Plocation ,Dnum FROM Project

--- 4 ---
SELECT Fname +' ' +Lname as FullName , (Salary*12)*1 as 'ANNUAL COMM' FROM Employee
  
--- 5 ---
SELECT SSN, Fname +' ' +Lname as 'Name' FROM Employee where Salary >1000 

--- 6 ---
SELECT SSN, Fname +' ' +Lname as 'Name' FROM Employee where Salary *12 >10000 

--- 7 ---
SELECT Fname +' ' +Lname as 'Name' ,Salary FROM Employee WHERE SEX ='F'

--- 8 --- 
SELECT Dnum,Dname from Departments WHERE MGRSSN = 968574

--- 9 ---
SELECT Pnumber , Pname , Plocation FROM Project WHERE Dnum =10
