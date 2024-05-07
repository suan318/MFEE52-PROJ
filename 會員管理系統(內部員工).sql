create database my_project;
-- drop database my_project;
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
employeedetail_imgurl varchar(50)not null default 'default avatar',-- 可以不放大頭貼，若不放會顯示一個預設圖示
employeedetail_created_date timestamp default current_timestamp,
employeedetail_update_at timestamp default current_timestamp on update current_timestamp,
foreign key(employeedetail_id_fk) references Employees(employee_id) on delete cascade-- 基本表被刪,細節表內同筆id也被刪
);

-- 填入資料 Employees(正常版)
insert into Employees(employee_name,employee_email,employee_password)
values 
('李俊翰','randomuser1@gmail.com','user1'),
('蔡欣怡','testmail4321@gmail.com','user2'),
('林志宇','emailgenie89@gmail.com','user3'),
('鄭婷婷','examplemail567@gmail.com','user4'),
('楊子翔','quickmail1234@gmail.com','user5');

-- 填入資料(故意重複mail)
-- insert into Employees(employee_name,employee_email,employee_password)
-- values 
-- ('哇哈哈','quickmail1234@gmail.com','user6');
-- show warnings;
-- 會出現報錯

-- 填入資料(EmployeeDetail) 有頭貼   (資料類型:員工照片,該資料型別內的子id編號)
insert into EmployeeDetail(employeedetail_id_fk ,employeedetail_imgurl)
values(1,'employee_avatars'),(2,'employee_avatars'),(3,'employee_avatars');
-- 填入資料 (EmployeeDetail)無頭貼
insert into EmployeeDetail(employeedetail_id_fk)
values(4),(5);

 -- 權限表
 create table Functions(
 function_id int not null primary key auto_increment,
 function_name varchar(50) not null
 );
-- 填入資料Functions(製作權限表)
insert into functions(function_name)
values('admin'),('creat'),('read'),('update'),('delete');

 -- 員工權限表
 create table EmployeeFunctions(
 EmployeeFunctions_id_fk int,
 functions_id_fk int,
 foreign key (EmployeeFunctions_id_fk) references Employees(employee_id),
 foreign key (functions_id_fk) references Functions(function_id)
 );
-- 填入資料EmployeeFunctions
insert into EmployeeFunctions(EmployeeFunctions_id_fk,functions_id_fk)
values(1,1),(2,2),(3,3),(4,4),(5,5);


-- join資料(細節表中呈現 >員工基本資料+權限表)
select *
from EmployeeDetail
join Employees on EmployeeDetail.employeedetail_id_fk=Employees.employee_id
join EmployeeFunctions on EmployeeFunctions_id_fk=employeedetail_id_fk
join Functions ON EmployeeFunctions.functions_id_fk = Functions.function_id;










