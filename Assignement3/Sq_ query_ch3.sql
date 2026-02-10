
use Company_SD

--- 1 ---
select Dependent_name , Sex from Dependent where 
dependent.Sex = 'F'
and exists (select 1 from Employee where
Employee.SSN = dependent.ESSN and employee.Sex='F')
union
select Dependent_name , Sex from Dependent where 
dependent.Sex = 'M'
and exists (select 1 from Employee where
Employee.SSN = dependent.ESSN and employee.Sex='M')


--- 2 --- 
select Project.Pname ,sum(Works_for.Hours)as "total_hours"
from Project join 
Works_for on Project.Pnumber = Works_for.Pno
group by Project.Pname


--- 3 ---
select * from Departments
where Dnum =
(select Dno from Employee 
where SSN =(select min(ssn) from Employee))


--- 4 ---
Select 
 d.Dname,
 min(e.Salary)as 'Min_Salary',
 max(e.Salary) as'Max_Salary' ,
 avg(e.salary)as 'Average_salary' 
from Departments d
join Employee e
on d.Dnum = e.Dno
group by d.Dname


--- 5 ---
Select Fname +' ' + Lname as 'Full Name'
from Employee e
join Departments d
on d.MGRSSN = e.SSN where 
not exists( select 1 from Dependent 
where Dependent.ESSN =d.MGRSSN)

--- 6 ---
Select 
	Dname ,
	Dnum ,
	(select count(*) from Employee where Employee.Dno = Departments.Dnum)as 'Employee Count'
from Departments
where 
(select avg(Salary)from Employee where Employee.Dno = Departments.Dnum)
<
(select avg(salary) from Employee)

--- 7 ---
Select Fname +' ' +Lname as 'Full Name' 
,Pname from Employee e
join Works_for w on w.ESSn =e.SSN
join Project p on w.Pno = p.Pnumber
join Departments d on e.Dno =d.Dnum
order by d.Dnum ,p.Pname


--- 8 ---
Select
    (Select max(Salary) from Employee) as 'Max Salary',
    (Select max(Salary) from Employee 
	where Salary < (Select max(Salary) from Employee)) as 'Second Max Salary';

--- 9 ---
Select distinct Fname +' '+Lname as Fullname from Employee e
join Dependent D on e.SSN = D.ESSN  
where d.Dependent_name like '%'+Fname +' '+Lname+'%'


--- 10 ---
Select Fname +' ' +Lname as 'Full Name' ,e.SSN
from Employee e
where exists(select * from Dependent where e.SSN = Dependent.ESSN)


--- 11 ---
insert into Departments values('DEPT IT' ,100,112233,1-11-2006)


---12---
update Departments set MGRSSN =968574 ,
[MGRStart Date]=getdate()
where Dnum =100

update Departments set MGRSSN =102672 
,[MGRStart Date]=getdate()
where Dnum =20

update employee set Superssn=102672
where SSN =102672
--- 13 ---
update departments set MGRSSN=102672
where MGRSSN =223344

update Employee set Superssn=102672
where Superssn =223344

delete from Works_for where ESSn=223344
delete from Employee where SSn=223344

--- 14 ---
update e set Salary+=0.3*Salary 
from Employee e
join Works_for w on e.SSN =w.ESSn
join Project p on w.Pno =p.Pnumber
where p.Pname='Al Rehab'
