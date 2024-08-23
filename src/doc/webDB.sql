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
values(null, 'aaa', '111', '남예준', 'male')
;

insert into users
values(null, 'bbb', '222', '한노아', 'male')
;

insert into users
values(null, 'ccc', '333', '채밤비', 'female')
;

insert into users
values(null, 'ddd', '444', '도은호', 'female')
;

insert into users
values(null, 'eee', '555', '유하민', 'male')
;




-- 수정
update users
set password = '666',
	name = '채봉구',
	gender = 'female'
where id = 'ccc'
;


-- 삭제
delete from users
where id = 'ccc'
and password = '666'
;


-- 회원가입 조회
select  no,
		name
from users
where id = 'ccc'
and password = '333'
;





#######################################################
###################### web_db 데이터 ####################


use web_db;

drop table guestbook;

create table guestbook (
	no  	 	 integer 		  primary key     auto_increment,
    id 			 varchar(20)	  not null        ,
    password	 varchar(20) 	  not null,
    content 	 text,
    reg_date     datetime
);








