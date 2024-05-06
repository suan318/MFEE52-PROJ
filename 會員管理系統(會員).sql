use my_project;
-- 會員部分
create table Members(
member_id int not null primary key auto_increment,
member_name varchar(10),
member_email varchar(100) not null unique,-- 註冊用的email不可重複
member_password varchar(70) not null
);
create table MemberDetail(
memberdetail_id_fk int not null primary key auto_increment,
gender varchar(10),
nick_name varchar(10),
memberdetail_imgurl varchar(200) not null default 'default avatar',-- 可以不放大頭貼，若不放會顯示一個預設圖示
memberdetail_address varchar(500),#################資料型別還未定############################
memberdetail_mobile int null,-- 要驗證時需指定用戶輸入的格式(避免0900-000-000)
memberdetail_created_date timestamp default current_timestamp,
memberdetail_update_at timestamp default current_timestamp on update current_timestamp,
foreign key(memberdetail_id_fk) references Members(member_id) on delete cascade-- 基本表被刪,細節表內同筆id也被刪
);
########################會員與他的功能關聯表 舊版
create table MemberFunctions(
md_id int not null,
f_id int not null,
primary key (md_id, f_id),
foreign key (md_id) references members_detail(md_id) on delete cascade
);
########################會員與他的功能關聯表 舊版
#######會員與他的功能關聯表 新版
create table MemberFunctions(
memberfunctions_id_fk int not null,
memberfunctions_code_type varchar(50) not null,
memberfunctions_code_type_id varchar(50) not null,
foreign key (memberfunctions_id_fk) references MemberDetail(memberdetail_id_fk) on delete cascade
 );
 #######會員與他的功能關聯表 新版
 -- drop table members;
-- drop table members_detail;
-- drop table members_functions;

-- 填入資料 members
insert into Members(member_name,member_email,member_password)
values
('劉冠廷','dongdong123456@gmail.com','password'),
('王淨','lulu123456@gmail.com','password'),
('隋棠','meng123456@gmail.com','password'),
('溫昇豪','hao123456@gmail.com','password'),
('魏蔓','manman123456@gmail.com','password');
##################################地址欄位可能要建一個地址表連到CommonType再串接近來
-- 填入資料 memberdetail
insert into MemberDetail(gender,nick_name,memberdetail_imgurl,memberdetail_address,memberdetail_mobile)
values
('male','東東','thisisaphotourl','台北市大安區敦化南路一段100號','0943851740'),
('female','路路','thisisaphotourl','新北市板橋區中山路二段50號','0910755391'),
('female','','thisisaphotourl','台中市西區民生路三段200號','0978109552'),
('female','','','桃園市中壢區中正路五段400號','0953211710'),
('female','','','高雄市左營區明誠路四段300號','0936412338');
#####################################
##########################################待修改
-- -- 填入資料 會員與權限的關聯  功能id 3=讀取 4=更新 5=刪除
select * from members_detail;
insert into members_functions(md_id,f_id)
values
(1,3),(1,4),(1,5),
(2,3),(2,4),(2,5),
(3,3),(3,4),(3,5),
(4,3),(4,4),(4,5),
(5,3),(5,4),(5,5);
select * from members_functions;
##########################################待修改
-- join
select *
from members_detail
join members on members_detail.md_id = members.m_id
join members_functions on members_detail.md_id = members_functions.md_id
join functions on members_functions.f_id = functions.f_id;


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

-- test 地址表
-- create table address_d(
-- id int primary key auto_increment,
-- city varchar(50),
-- district varchar(50),
-- detail varchar(200)
-- );
-- insert into address_d(city,district,detail)
-- values('台北市','大安區','敦化南路一段100號');
-- select * from address_d;

-- create table m_detail(
-- id int primary key auto_increment,
-- m_name varchar(50),
-- address_id int
-- foreign key (address_id) references address_d(id)
-- );

-- insert into m_detail(m_name,address_id)
-- values('小明',1);

-- select * from m_detail
-- join address_d on (address_id)=address_d.id;

-- select m_detail.id,m_name,city,district,detail from m_detail
-- join address_d on (address_id)=address_d.id;
-- show warnings;

-- select m_detail.id,m_name,district from m_detail
-- join address_d on (address_id)=address_d.id;
