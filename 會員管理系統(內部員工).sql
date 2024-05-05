create database my_project;
use my_project;
-- 員工部分
create table Employees(
employee_id int not null primary key auto_increment,
employee_name varchar(10),
employee_email varchar(100) not null unique,-- 註冊用的email不可重複
employee_password varchar(70)
);
create table EmployeeDetail(
employeedetail_id_fk int not null primary key auto_increment,
employeedetail_code_type varchar(50) ,
employeedetail_code_type_id varchar(50)not null default 'default avatar',-- 可以不放大頭貼，若不放會顯示一個預設圖示
employeedetail_created_date timestamp default current_timestamp,
employeedetail_update_at timestamp default current_timestamp on update current_timestamp,
foreign key(employeedetail_id_fk) references Employees(employee_id) on delete cascade-- 基本表被刪,細節表內同筆id也被刪
);
create table EmployeeFunctions(
employeefunctions_id_fk int not null,
employeefunctions_code_type varchar(50) not null,
employeefunctions_code_type_id varchar(50) not null,
foreign key (employeefunctions_id_fk) references EmployeeDetail(employeedetail_id_fk) on delete cascade
 );
 -- drop table Employees;
 -- drop table EmployeeFunctions;
 -- drop table EmployeeDetail;
-- drop database my_project;
show warnings;

-- 填入資料 Employees(正常版)
insert into Employees(employee_name,employee_email,employee_password)
values 
('李俊翰','randomuser1@gmail.com','user1'),
('蔡欣怡','testmail4321@gmail.com','user2'),
('林志宇','emailgenie89@gmail.com','user3'),
('鄭婷婷','examplemail567@gmail.com','user4'),
('楊子翔','quickmail1234@gmail.com','user5');
select * from Employees;
-- 填入資料(故意重複mail)
-- insert into Employees(employee_name,employee_email,employee_password)
-- values 
-- ('哇哈哈','quickmail1234@gmail.com','user6');
-- show warnings;
-- 會出現報錯

-- 填入資料(EmployeeDetail) 有頭貼   (資料類型:員工照片,該資料型別內的子id編號)
insert into EmployeeDetail(employeedetail_code_type,employeedetail_code_type_id)
values('employee_avatars','01'),('employee_avatars','02'),('employee_avatars','03');
-- 填入資料 (EmployeeDetail)無頭貼
insert into EmployeeDetail(employeedetail_code_type)
values('employee_avatars'),('employee_avatars');
select * from EmployeeDetail;

-- 填入資料(EmployeeFunctions)  (資料類型:員工權限,該資料型別內的子id編號)
insert into EmployeeFunctions(employeefunctions_id_fk,employeefunctions_code_type,employeefunctions_code_type_id)
values
(1,'functions','01'),
(2,'functions','02'),
(3,'functions','03'),
(4,'functions','04'),
(5,'functions','05');
select * from EmployeeFunctions;


-- join資料(細節表中呈現 >員工基本資料+權限表)
select * 
from EmployeeDetail
join Employees on EmployeeDetail.employeedetail_id_fk=Employees.employee_id 
join EmployeeFunctions on EmployeeDetail.employeedetail_id_fk=EmployeeFunctions.employeefunctions_id_fk
join CommonCode on CommonCode.code_type=EmployeeFunctions.employeefunctions_code_type;

-- select sample
select * 
from EmployeeDetail 
join Employees on EmployeeDetail.employeedetail_id_fk=Employees.employee_id 
join EmployeeFunctions on EmployeeFunctions.employeeFunctions_code_type_id=EmployeeFunctions.employeefunctions_id_fk
join CommonCode on CommonCode.code_type=EmployeeFunctions.employeefunctions_code_type

where employeedetail_id_fk=3 and code_type_id=3 and EmployeeFunctions_id_fk=3;







