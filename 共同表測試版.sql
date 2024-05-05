use my_project;
create table CommonCode(
commoncode_id int primary key auto_increment,
code_type varchar(50),
code_type_desc varchar(50),
code_type_id varchar(50),
code_desc varchar(50)
);
-- 建立共同表 資料型別:權限
insert into CommonCode(code_type,code_type_desc,code_type_id,code_desc)
values
('functions','權限','01','admin'),
('functions','權限','02','creat'),
('functions','權限','03','read'),
('functions','權限','04','update'),
('functions','權限','05','delete')
;

-- 建立共同表 資料型別:員工大頭貼
insert into CommonCode(code_type,code_type_desc,code_type_id,code_desc)
values
('employee_avatars','員工大頭貼','01','thisisaphotourl1'),
('employee_avatars','員工大頭貼','02','thisisaphotourl2'),
('employee_avatars','員工大頭貼','03','thisisaphotourl3'),
('employee_avatars','員工大頭貼','04','thisisaphotourl4'),
('employee_avatars','員工大頭貼','05','thisisaphotourl5')
;
-- 建立共同表 資料型別:會員大頭貼
insert into CommonCode(code_type,code_type_desc,code_type_id,code_desc)
values
('member_avatars','會員大頭貼','01','thisisaphotourl6'),
('member_avatars','會員大頭貼','02','thisisaphotourl7'),
('member_avatars','會員大頭貼','03','thisisaphotourl8'),
('member_avatars','會員大頭貼','04','thisisaphotourl9'),
('member_avatars','會員大頭貼','05','thisisaphotourl10')
;
select * from CommonCode;



-- drop table CommonCode;