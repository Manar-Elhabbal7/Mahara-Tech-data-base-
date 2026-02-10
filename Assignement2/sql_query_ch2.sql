
use Company_SD

--- 1 ---
select Dnum ,Dname ,SSN,Fname +' ' +Lname as name from Departments 
inner join Employee on Employee.SSN = Departments.MGRSSN

--- 2 ---
select Dname ,Pname from Departments 
inner join Project on Departments.Dnum = Project.Dnum

--- 3 ---
select Dependent.*, Employee.Fname + ' ' + Employee.Lname as Name
from Dependent
inner join Employee on Dependent.ESSN = Employee.SSN;

--- 4 --- 
select Dnum, Pname, Plocation from Project where City in ('Alex','Cairo')

--- 5 ---
select * from Project where Pname like 'a%'

--- 6 --- 
select * from Employee where Dno =30 and Salary between 1000 and 2000

--- 7 ---
select Fname +' '+Lname as Name  from Employee  inner join
Works_for on Employee.SSN = Works_for.ESSn and Hours >=10

--- 8 ---
select Fname + ' '+ Lname  as Name from Employee where Superssn =223344

--- 9 ---
select Fname +' '+Lname as Name,Pname from Employee 
inner join Works_for on Employee.SSN = Works_for.ESSn inner join
Project on Project.Pnumber = Works_for.Pno order by Pname 

--- 10 ---
select Pnumber ,Dname ,Lname,Address , Bdate from Project
inner join Departments on Project.Dnum = Departments.Dnum
and city ='Cairo' inner join Employee on Employee.SSN = Departments.MGRSSN

--- 11 ---
select distinct * from employee a , Departments d
where a.SSN = d.MGRSSN

--- 12 ---
select e.* , d.* from  Dependent d
right outer join Employee e on e.SSN =d.ESSN 

--- 13 ---
insert into Employee values('Manar' ,'Elhabbal',102672,2005-01-01,'El Mahala Elkobra',
'F',3000,112233,30)

--- 14 ---
insert into Employee values('Menna' ,'Elhabbal',102660,2005-01-01,'El Mahala Elkobra',
'F',null,null,30)

--- 15 ---
update Employee set Salary *=1.20 where SSN =102672

