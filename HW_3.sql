use tasks;

 create table employees(
 	employee_id int primary key auto_increment,
 	first_name varchar(128) not null,
 	last_name varchar(128) not null,
 	email varchar(128) not null,
 	salary int, 
	department varchar(128) not null
 );
 
insert into employees(first_name, last_name, email, salary, department) values("Steven","King",	"SKING", 24000, "Sales");
insert into employees(first_name, last_name, email, salary, department) values("Neena" , "Kochhar" , "NKOCHHAR" , 17000 , "Sales");
insert into employees(first_name, last_name, email, salary, department) values("Lex" , "De Haan" , "LDEHAAN" , 17000 , "Sales");
insert into employees(first_name, last_name, email, salary, department) values("Alexander" , "Hunold" , "AHUNOLD" , 9000 , "Finance");
insert into employees(first_name, last_name, email, salary, department) values("Bruce" , "Ernst" , "BERNST" , 6000 , "Finance");
insert into employees(first_name, last_name, email, salary, department) values("Valli" , "Pataballa" , "VPATABAL" , 4800 , "Finance");
insert into employees(first_name, last_name, email, salary, department) values("Diana" , "Lorentz" , "DIANALO" , 8800 , "Finance");
insert into employees(first_name, last_name, email, salary, department) values("Nancy" , "Greenberg" , "NGREENBE" , 12008 , "Shipping");
insert into employees(first_name, last_name, email, salary, department) values("Daniel" , "Faviet" , "DFAVIET" , 9000 , "Shipping");
insert into employees(first_name, last_name, email, salary, department) values("Jose Manuel" , "Urman" , "JMURMAN" , 7800 , "Shipping");
insert into employees(first_name, last_name, email, salary, department) values("Luis" , "Popp" , "LPOPP" , 6900 , "Shipping");
insert into employees(first_name, last_name, email, salary, department) values("Den" , "Raphaely" , "DRAPHEAL" , 11000 , "Marketing");
insert into employees(first_name, last_name, email, salary, department) values("Alexander" , "Khoo" , "AKHOO" , 3100 , "Marketing");
insert into employees(first_name, last_name, email, salary, department) values("Shelli" , "Baida" , "SBAIDA" , 2900 , "Marketing");
insert into employees(first_name, last_name, email, salary, department) values("Sigal" , "Tobias" , "STOBIAS" , 2800 , "Marketing");
insert into employees(first_name, last_name, email, salary, department) values("Matthew" , "Weiss" , "MWEISS" , 8000 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Adam" , "Fripp" , "AFRIPP" , 8200 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Payam" , "Kaufling" , "PKAUFLIN" , 7900 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Shanta" , "Vollman" , "SVOLLMAN" , 6500 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Kevin" , "Mourgos" , "KMOURGOS" , 5800 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Julia" , "Nayer" , "JNAYER" , 3200 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Adam" , "Markle" , "SMARKLE" , 2200 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Laura" , "Bissot" , "LBISSOT" , 3300 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Mozhe" , "Atkinson" , "MATKINSO" , 2800 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Joshua" , "Patel" , "JPATEL" , 2500 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Trenna" , "Rajs" , "TRAJS" , 3500 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("John" , "Russell" , "JRUSSEL" , 14000 , "IT");
insert into employees(first_name, last_name, email, salary, department) values("Karen" , "Partners" , "KPARTNER" , 13500 , "IT");
insert into employees(first_name, last_name, email, salary, department) values("Alberto" , "Errazuriz" , "AERRAZUR" , 12000 , "IT");
insert into employees(first_name, last_name, email, salary, department) values("Gerald" , "Cambrault" , "GCAMBRAU" , 11000 , "IT");
insert into employees(first_name, last_name, email, salary, department) values("Eleni" , "Zlotkey" , "EZLOTKEY" , 10500 , "IT");
insert into employees(first_name, last_name, email, salary, department) values("Adam" , "Vargas" , "PVARGAS" , 2500 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Laura" , "Errazuriz" , "AERRAZUR" , 12000 , "IT");

select * from employees;

-- 1. Повысить зарплаты для отдела sales на 20%, для finance 15%, для shipping 10%, для marketing 25%, для Human Resources 20% и для IT 35%. 
-- Записать данные в новое поле new_salary. Поле создавать не нужно, используем AS. 
SELECT 
    employee_id,
    first_name AS name,
    last_name AS surname,
    salary AS total_salary,
    CASE 
        WHEN department = 'sales' THEN salary * 1.20
        WHEN department = 'finance' THEN salary * 1.15
        WHEN department = 'shipping' THEN salary * 1.10
        WHEN department = 'marketing' THEN salary * 1.25
        WHEN department = 'Human Resources' THEN salary * 1.20
        WHEN department = 'IT' THEN salary * 1.35
        ELSE salary
    END AS new_salary
FROM employees;

-- 2. Создать поле new_salary типа numeric(7, 2).

ALTER table employees
ADD column new_salary numeric (7,2);

-- 3. Заполнить поле: повысить зарплаты для отдела sales на 20%, для finance 15%, для shipping 10%, для marketing 25%, 
-- для Human Resources 20% и для IT 35%.

set sql_safe_updates = 0;

UPDATE employees
SET new_salary = CASE 
    WHEN department = 'sales' THEN salary * 1.20
    WHEN department = 'finance' THEN salary * 1.15
    WHEN department = 'shipping' THEN salary * 1.10
    WHEN department = 'marketing' THEN salary * 1.25
    WHEN department = 'Human Resources' THEN salary * 1.20
    WHEN department = 'IT' THEN salary * 1.35
    ELSE salary -- На случай, если отдел не указан в условиях
END;
 
-- 4. Вывести из таблицы employees firstname как name, lastname как surname и salary как total_salary.

SELECT 
    first_name AS name, 
    last_name AS surname, 
    salary AS total_salary
FROM 
    employees;
    
-- 5. Вывести новое поле commission (через AS), которое будет null, если зарплата сотрудника меньше 3000, будет 10, если зарплата меньше 6000, будет 15, 
-- если зарплата меньше 9000, и будет 20, если зарплата больше/равно 9000.

SELECT 
    first_name AS name, 
    last_name AS surname, 
    salary AS total_salary,
    CASE
        WHEN salary < 3000 THEN NULL
        WHEN salary < 6000 THEN 10
        WHEN salary < 9000 THEN 15
        ELSE 20
    END AS commission
FROM 
    employees;

-- 6. Создать новое поле commission и соответственно заполнить.

ALTER TABLE employees
ADD COLUMN commission NUMERIC(5, 2);

UPDATE employees
SET commission = CASE
    WHEN salary < 3000 THEN NULL
    WHEN salary < 6000 THEN 10
    WHEN salary < 9000 THEN 15
    ELSE 20
END;

-- 7. Создать поле finalsalary и заполнить формулой salary + salary * commission / 100. 
-- Проверить commission на null, так чтобы в случае неопределенности finalprice принимал значение salary. 

ALTER TABLE employees
ADD COLUMN finalsalary NUMERIC(10, 2);

UPDATE employees
SET finalsalary = CASE
    WHEN commission IS NULL THEN salary
    ELSE salary + salary * commission / 100
END;

-- 8. Удалить из таблицы сотрудников, у которых commission меньше 15.

DELETE FROM employees
WHERE commission < 15;

SELECT *
FROM employees;



