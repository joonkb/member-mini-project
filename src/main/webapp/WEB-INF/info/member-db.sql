create table mini_member(
	id varchar2(100) primary key,
	email varchar2(100) not null, 
	password varchar2(100) not null,
	name varchar2(100) not null,
	address varchar2(100) not null,
	birthday date not null,
	regdate date not null,
	question_no number not null,
    answer varchar2(100) not null
)

insert into mini_member(id, email, password, name, address, birthday, regdate, question_no, answer)
    values('test2','test2@kst.com','0000','테스트2','한국','1900-02-02',sysdate,'2','휴대폰');
insert into mini_member(id, email, password, name, address, birthday, regdate, question_no, answer)
    values('test','test@kst.com','0000','테스트','한국','1900-01-01',sysdate,'1','컴퓨터');


select * from mini_member;