# databases
Project and Lab - Databases in Oracle SQL

###note
notka - having jest łączone z group by, z group by nie uzywa sie where

###note
notka - sprawdzenie daty:

and  
DATA >= (SELECT TO_CHAR(SYSDATE, 'DD-Mon-YYYY') FROM Dual)  
and  
DATA <= ((SELECT TO_CHAR(SYSDATE+1, 'DD-Mon-YYYY') FROM Dual)) )  

select first_name, last_name, department_id from employees join departments using (department_id)  
where salary =  
(select max(salary)  
from employees   
join departments  
using(department_id)  
group by department_id)  
group by department_id;  

select ReleaseDate, Name from Movie join Genre using (ID);
