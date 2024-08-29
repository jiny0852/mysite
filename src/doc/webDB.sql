#######################################################
####################### web_db 계정 ####################


drop user 'web'@'%';

create user 'web'@'%' identified by 'web';

grant all privileges on web_db.* to 'web'@'%';

flush privileges;


#######################################################
####################### web_db DB생성 ##################


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
################## guestbook_db 데이터 ##################


use web_db;

drop table guestbook;

create table guestbook (
	no  	 	 integer 		  primary key     auto_increment,
    name		 varchar(20)	  not null,
    password	 varchar(20) 	  not null,
    content 	 text,
    reg_date     datetime
);

ALTER TABLE guestbook
RENAME COLUMN id TO name;

-- 조회
select * from guestbook;

select  no,
		name,
		password,
        content,
        reg_date
from guestbook
;


-- 등록
insert into guestbook
values(null, 'aaa', '111', '남예준', now() )
;

insert into guestbook
values(null, 'bbb', '222', '한노아', now() )
;

insert into guestbook
values(null, 'ccc', '333', '채밤비', now() )
;

insert into guestbook
values(null, 'ddd', '444', '도은호', now() )
;

insert into guestbook
values(null, 'eee', '555', '유하민', now() )
;




-- 수정#######
update guestbook
set password = '666',
	name = '채봉구',
	gender = 'female'
where id = 'ccc'
;


-- 삭제###########
delete from guestbook
where id = 'ccc'
and password = '666'
;




#######################################################
#################### board_db 데이터 ####################

use web_db;

drop table board;

create table board (
	no  	 	 integer 		  primary key     auto_increment,
    title 		 varchar(20)	  not null,
    content 	 text,
    hit			 integer          default 0,
    reg_date     datetime		  not null,
    user_no 	 integer          not null,
    
	constraint board_fk foreign key (user_no) 
    references Users(no)
);


-- 조회
select * from board;

-- 리스트 뽑기
select  no,
		title,
		content,
        hit,
        reg_date,
        user_no
from board
;

-- 내가 쓴글 리스트
select  b.no,
		b.title,
		b.content,
        b.hit,
        b.reg_date,
        b.user_no,
        u.name
from board b, users u
where b.user_no = u.no
;

-- 하나 글읽기
select  b.no,
		b.title,
		b.content,
        b.hit,
        b.reg_date,
        b.user_no,
        u.name
from board b, users u
where b.user_no  = u.no
and b.no  = 1
;




insert into board ( title, content, reg_date, user_no )
values( 'bbb', 'bbb', now(), 1 )
;


delete from board
where no = '2'
and user_no = '1'
;







-- 등록 ################
insert into board
values( null, 'aaa', '111', null, now(), 1 )
;





insert into guestbook
values(null, 'bbb', '222', '한노아', now() )
;

insert into guestbook
values(null, 'ccc', '333', '채밤비', now() )
;

insert into guestbook
values(null, 'ddd', '444', '도은호', now() )
;

insert into guestbook
values(null, 'eee', '555', '유하민', now() )
;




-- 수정#######
update guestbook
set password = '666',
	name = '채봉구',
	gender = 'female'
where id = 'ccc'
;


-- 삭제 ###############
delete from board
where id = 'bbb'
and password = 'bbb'
;




