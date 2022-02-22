--리뷰 게시판 테이블
create table review (
review_bno number not null, --글번호
review_title varchar2(200) not null, --제목
review_content clob, --본문
review_writer varchar2(50) not null, --작성자
review_regdate date default sysdate, --작성일자
review_viewcnt number default 0, --조회수
review_show char(1) default 'Y', --삭제시 화면 표시 여부
primary key(review_bno)
);


--테이블 구조보기
desc review;

select * from review;

commit;


insert into review (review_bno,review_title,review_content,review_writer) values
(1,'제목','내용','kim');

insert into review (review_bno,review_title,review_content,review_writer) values
(993,'제목','내용','lee');

delete from review where review_bno=993;

select * from review;


--review의 시퀀스 생성(--drop sequence seq_board;--시퀀스 삭제)
drop sequence seq_review;

drop sequence dual;

--시퀀스 전체 검색
SELECT * FROM USER_SEQUENCES;

create sequence seq_review
start with 1
increment by 1;


select * from seq_review;

select seq_review.currval from dual;


--리뷰 게시판 댓글 테이블
drop table review_reply cascade constraints;


create table review_reply (
review_rno number not null primary key, --댓글번호
review_bno number default 0, --게시물 번호
review_replytext varchar2(1000) not null, -- 댓글 내용
review_replyer varchar2(50) not null, -- 댓글 작성자 아이디
review_regdate date default sysdate, -- 댓글 작성일
review_updatedate date default sysdate -- 댓글 수정일
);

select * from review_reply;


--foreign key 제약조건 추가
alter table review_reply add constraint fk_review
foreign key(review_bno) references review(review_bno);



--시퀀스 생성
drop sequence seq_review_reply;

create sequence seq_review_reply
start with 1
increment by 1;


commit;
