create database my_project;
use my_project;
-- 員工部分
create table employee(
e_id int not null primary key auto_increment,
e_name varchar(10),
e_email varchar(100) not null unique,-- 註冊用的email不可重複
e_password varchar(70)
);
create table functions(
f_id int not null primary key auto_increment,
f_name varchar(10)
);
create table employee_detail(
d_id int not null primary key auto_increment,
img_url varchar(200) not null default 'default avatar',-- 可以不放大頭貼，若不放會顯示一個預設圖示
created_date timestamp default current_timestamp,
updatde_date timestamp default current_timestamp on update current_timestamp,
functions int,
foreign key(d_id) references employee(e_id) on delete cascade,-- 基本表被刪,細節表內同筆id也被刪
foreign key (functions) references functions(f_id)
);
-- drop table employee_detail;
-- drop database my_project;

-- 填入資料 employee(正常版)
insert into employee(e_name,e_email,e_password)
values 
('李俊翰','randomuser1@gmail.com','user1'),
('蔡欣怡','testmail4321@gmail.com','user2'),
('林志宇','emailgenie89@gmail.com','user3'),
('鄭婷婷','examplemail567@gmail.com','user4'),
('楊子翔','quickmail1234@gmail.com','user5');
select * from employee;
-- 填入資料(故意重複mail)
-- insert into employee(e_name,e_email,e_password)
-- values 
-- ('哇哈哈','quickmail1234@gmail.com','user6');
-- show warnings;
-- 會出現報錯

-- 填入資料(function)
insert into functions(f_name)
values('admin'),('create'),('read'),('update'),('delete');
select * from functions;

-- 填入資料(detail) 有頭貼
insert into employee_detail(img_url,functions)
values('thisisaphotourl',1),('thisisaphotourl',2),('thisisaphotourl',3);
-- 填入資料 無頭貼
insert into employee_detail(functions)
values(4),(5);
select * from employee_detail;

-- join資料(細節表中呈現 >員工基本資料+權限表)
select e_id,e_name,e_email,e_password,img_url,f_name,created_date,updatde_date 
from employee_detail

join employee on d_id=employee.e_id

join functions on functions=functions.f_id;




