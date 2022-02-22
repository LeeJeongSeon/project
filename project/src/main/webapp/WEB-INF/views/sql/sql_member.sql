create table member(
userid varchar2(50) not null primary key,-- 유저아이디
passwd varchar2(50) not null, -- 패스워드
name varchar2(50) not null,--유저이름
phone varchar2(20) not null,--유저 전화번호
zipcode varchar2(10), -- 우편번호
address1 varchar2(200),--주소
address2 varchar2(200),--상세주소
email varchar2(50),--이메일
join_date date default sysdate,--가입일자
adminCk number default 0--관리자 체크
);

insert into member (userid,passwd,name,email,zipcode,address1,address2,phone)
values ('mire','1234','미래','mire@gmail.com','04779','서울 성동구 왕십리로2길 20',
'4층 미래능력개발교육원','010111111234');
insert into member (userid,passwd,name,email,zipcode,address1,address2,phone)
values ('kim','1234','김철수','kim@gmail.com','04779','서울 성동구 왕십리로1길 20',
'4층 미래능력개발교육원','01022223333');
insert into member (userid,passwd,name,email,zipcode,address1,address2,phone)
values ('lee','1234','이광수','lee@gmail.com','04779','서울 성동구 왕십리로80길 20',
'4층 미래능력개발교육원','01033334444');
insert into member (userid,passwd,name,email,zipcode,address1,address2,phone)
values ('admin','1234','관리자','admin@gmail.com','04779','서울 성동구 왕십리로90길 20',
'4층 미래능력개발교육원','01088889999');

UPDATE  member set adminCk='1' where userid='admin';--관리자체크 업데이트


commit;
