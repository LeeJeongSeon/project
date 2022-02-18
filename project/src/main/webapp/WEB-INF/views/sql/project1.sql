create table rent(
bnum number not null primary key,
userid varchar2(50) not null,
book_id varchar2(50) not null,
aday  date default sysdate,
bday date default sysdate+7
);

create sequence rent_seq
start with 1
increment by 1;

alter table rent add rent_check int default 0;

alter table rent add constraint rent_userid_fk
foreign key(userid) references member(userid);
alter table rent add constraint rent_bookid_fk
foreign key(book_id) references book(book_id);

commit;