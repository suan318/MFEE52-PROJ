use my_project;
-- drop database my_project;
show warnings;
-- ########################## 類別總表 ##########################
create table CommonType (
    commontype_id INT PRIMARY KEY AUTO_INCREMENT,
    code_type INT,
    code_type_desc VARCHAR(50),
    code_id INT,
    code_desc VARCHAR(200),
    code_remark INT
);
-- ########################## 類別總表 ##########################
-- 會員部分
-- 會員基本表
create table Members(
member_id int not null primary key auto_increment,
member_name varchar(10),
member_email varchar(100) not null unique,-- 註冊用的email不可重複
member_password varchar(70) not null
);
-- 會員詳細地址表(與共同表連接)
create table MemberAddressDetail (
    MemberAddressDetail_id int auto_increment primary key,
    member_id_fk int,
    MemberAddressDetail_fk int,
    MemberAddress VARCHAR(300),
    foreign key (member_id_fk) REFERENCES members(member_id),
    foreign key (MemberAddressDetail_fk) REFERENCES CommonType(commontype_id)
);
-- 會員細節表
create table MemberDetail(
memberdetail_id_fk int not null primary key auto_increment,
gender varchar(10),
nick_name varchar(10),
memberdetail_imgurl varchar(200) not null default 'default avatar',-- 可以不放大頭貼，若不放會顯示一個預設圖示
memberdetail_address_fk int,
memberdetail_mobile int null,-- 要驗證時需指定用戶輸入的格式(避免0900-000-000)
memberdetail_created_date timestamp default current_timestamp,
memberdetail_update_at timestamp default current_timestamp on update current_timestamp,
foreign key(memberdetail_id_fk) references Members(member_id) on delete cascade,-- 基本表被刪,細節表內同筆id也被刪
foreign key (memberdetail_address_fk) references MemberAddressDetail(MemberAddressDetail_id)
);
-- 會員權限表
 create table MemberFunctions(
 MemberFunctions_id_fk int,
 functions_id_fk int,
 foreign key (MemberFunctions_id_fk) references Members(Member_id),
 foreign key (functions_id_fk) references Functions(function_id)
 );
 
-- 插入共同類別表格的資料為(縣市):
insert into CommonType (code_type, code_type_desc, code_id, code_desc)
VALUES
	(1, '縣市別', 1, '宜蘭縣'),
	(1, '縣市別', 2, '台北市'),
    (1, '縣市別', 3, '新北市'),
    (1, '縣市別', 4, '基隆市'),
    (1, '縣市別', 5, '桃園縣'),
    (1, '縣市別', 6, '新竹市'),
    (1, '縣市別', 7, '新竹縣'),
    (1, '縣市別', 8, '苗栗縣'),
    (1, '縣市別', 9, '台中市'),
    (1, '縣市別', 10, '彰化縣'),
    (1, '縣市別', 11, '南投縣'),
    (1, '縣市別', 12, '雲林縣'),
    (1, '縣市別', 13, '嘉義市'),
    (1, '縣市別', 14, '嘉義縣'),
    (1, '縣市別', 15, '台南市'),
    (1, '縣市別', 16, '高雄市'),
    (1, '縣市別', 17, '屏東縣'),
    (1, '縣市別', 18, '台東縣'),
    (1, '縣市別', 19, '花蓮縣'),
    (1, '縣市別', 20, '澎湖縣'),
    (1, '縣市別', 21, '金門縣'),
    (1, '縣市別', 22, '連江縣');
-- 插入共同類別表格的資料為(縣市)

-- 插入共同類別表格的資料為(地區):
insert into CommonType (code_type, code_type_desc, code_id, code_desc,code_remark)
VALUES
(2, '地區別', 1, '中正區',2),
(2, '地區別', 2, '文山區',2),
(2, '地區別', 3, '萬華區',2),
(2, '地區別', 4, '大同區',2),
(2, '地區別', 5, '中山區',2),
(2, '地區別', 6, '內湖區',2),
(2, '地區別', 7, '松山區',2),
(2, '地區別', 8, '南港區',2),
(2, '地區別', 9, '信義區',2),
(2, '地區別', 10, '士林區',2),
(2, '地區別', 11, '北投區',2),
(2, '地區別', 12, '大安區',2);
-- 插入共同類別表格的資料為(地區)
select * from commontype;

-- 填入資料 members
insert into Members(member_name,member_email,member_password)
values
('劉冠廷','dongdong123456@gmail.com','password'),
('王淨','lulu123456@gmail.com','password'),
('隋棠','meng123456@gmail.com','password'),
('溫昇豪','hao123456@gmail.com','password'),
('魏蔓','manman123456@gmail.com','password');

-- 建立詳細地址表內容
insert into MemberAddressDetail(member_id_fk,MemberAddressDetail_fk,MemberAddress)
values
(1,34,'復興南路一段100號'),
(2,31,'市府路45號'),
(3,27,'南京東路三段16號'),
(4,23,'羅斯福路一段7號'),
(5,32,'天母西路92號');

-- 填入資料 memberdetail
insert into MemberDetail(gender,nick_name,memberdetail_imgurl,memberdetail_address_fk,memberdetail_mobile)
values
('male','東東','thisisaphotourl',1,'0943851740'),
('female','路路','thisisaphotourl',2,'0910755391'),
('female','','thisisaphotourl',3,'0978109552'),
('female','','',4,'0953211710'),
('female','','',5,'0936412338');

 -- 填入資料 MemberFunctions
insert into MemberFunctions(MemberFunctions_id_fk,functions_id_fk)
values
(1,3),(1,4),(1,5),
(2,3),(2,4),(2,5),
(3,3),(3,4),(3,5),
(4,3),(4,4),(4,5),
(5,3),(5,4),(5,5);


-- join
select *
from memberdetail
join members on memberdetail_id_fk = members.member_id
join MemberAddressDetail on member_id_fk =memberdetail.memberdetail_id_fk
join CommonType on commontype_id = MemberAddressDetail_fk
join memberfunctions on MemberFunctions_id_fk = memberdetail.memberdetail_id_fk
join Functions ON memberfunctions.functions_id_fk = Functions.function_id;

show warnings;
-- 會員權限的篩選--------
SELECT 
    MemberFunctions_id_fk,
    GROUP_CONCAT(function_name ORDER BY function_id) AS function_names
FROM 
    MemberFunctions
JOIN 
    Functions ON functions_id_fk = function_id
GROUP BY 
    MemberFunctions_id_fk;
show warnings;
-- 會員權限的篩選--------



-- test 我的最愛
-- create table class(
-- id int primary key	auto_increment,
-- c_name varchar(50)
-- );
-- create table product(
-- id int primary key	auto_increment,
-- p_name varchar(50)
-- );
-- create table fav(
-- id int primary key	auto_increment,
-- class int,
-- product int,
-- foreign key (class) references class(id),
-- foreign key (product) references product(id)
-- );
-- insert into class(c_name)
-- values('國文'),('英文');
-- insert into product(p_name)
-- values('紅筆'),('藍筆');

-- select * from class;
-- select * from product;

-- insert into fav(class,product)
-- values(1,1);
-- SELECT * FROM fav;

-- SELECT * FROM fav
-- JOIN class ON fav.class = class.id
-- JOIN product ON fav.product = product.id;


