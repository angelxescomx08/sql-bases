use AdventureWorks2017;

--1
select * from Person.Person;


-- 2
select Person.BusinessEntityID, Person.PersonType, Person.Person.FirstName, Person.Person.LastName 
from Person.Person;

--3
select Person.BusinessEntityID, Person.PersonType, Person.Person.FirstName, Person.Person.LastName 
from Person.Person
where Person.PersonType = 'EM';

--4
select HumanResources.Employee.BusinessEntityID, HumanResources.Employee.NationalIDNumber,  HumanResources.Employee.JobTitle
from HumanResources.Employee
order by HumanResources.Employee.BusinessEntityID desc;

--5
select distinct [HumanResources].[Employee].JobTitle as Unicos 
from [HumanResources].[Employee];

--6
select [HumanResources].[Employee].BusinessEntityID
from [HumanResources].[Employee]
where [HumanResources].[Employee].BusinessEntityID > 10;

--7
select * 
from  [HumanResources].[Employee] as a
where a.JobTitle = 'Sales Representative' and a.Gender = 'F';

--8
--select a.JobTitle, b.PayFrequency
--from  [HumanResources].[Employee] as a
--inner join [HumanResources].[Employee]. on a.JobTitle = b;

--9
select a.JobTitle, AVG(a.VacationHours) as Promedio
from [HumanResources].[Employee] as a
group by a.JobTitle;

--10
select SUM(a.SalesYTD) as SumaTotal
from [Sales].[SalesPerson] as a;

--11
select SUM(a.SalesYTD) as SumaTotal
from [Sales].[SalesPerson] as a
where a.TerritoryID is not NULL;

--12 
select MAX(a.Bonus) as maximo, MIN(a.Bonus) as minimo
from [Sales].[SalesPerson] as a;
