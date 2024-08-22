#######################################################
###################### web_db 계정 #####################


drop user 'web'@'%';

create user 'web'@'%' identified by 'web';

grant all privileges on web_db.* to 'web'@'%';

flush privileges;


#######################################################
###################### web_db DB생성 ###################


drop database web_db;

create database web_db
	default character set utf8mb4
    collate utf8mb4_general_ci
    default encryption='n'
;

show databases;


use web_db;





#######################################################
###################### web_db 데이터 ####################


use web_db;

drop table users;

create table users (
	no  	 	 integer 		  primary key     auto_increment,
    id 			 varchar(20)	  not null        unique,
    password	 varchar(20) 	  not null,
    name 		 varchar(20),
    gender  	 varchar(10)
);

-- 조회
select * from users;

select  no,
		id,
		password,
        name,
        gender
from users
;


-- 등록
insert into users
values(null, 'aaa', '111', '남예준', 'mail')
;

insert into users
values(null, 'bbb', '222', '한노아', 'mail')
;

insert into users
values(null, 'ccc', '333', '채밤비', 'femail')
;

insert into users
values(null, 'ddd', '444', '도은호', 'femail')
;

insert into users
values(null, 'eee', '555', '유하민', 'mail')
;




-- 수정
update users
set password = '666',
	name = '채봉구',
	gender = 'femail'
where id = 'ccc'
;


-- 삭제
delete from users
where id = 'ccc'
and password = '666'
;





