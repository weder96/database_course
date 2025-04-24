ALTER VIEW vw_customers as
select CONCAT(Firstname,' ',LastName) as name,
EmailAddress, 
BirthDate, gender
from  DimCustomer
WHERE Gender='F'



DROP VIEW vw_customers;


CREATE VIEW vw_customers as
select CONCAT(Firstname,' ',LastName) as name,
EmailAddress, 
BirthDate
from  DimCustomer
