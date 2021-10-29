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
    values('test3','test3@kst.com','a','테스트3','한국',to_date('2010-04-07','YYYY-MM-DD'),sysdate,'2','휴대폰');
insert into mini_member(id, email, password, name, address, birthday, regdate, question_no, answer)
    values('test','test@kst.com','0000','테스트','한국','1900-01-01',sysdate,'1','컴퓨터');

select * from mini_member;
select birthday from mini_member where id='test3';
select to_char(regdate,'YYYY-MM-DD') from mini_member where id='test3';
select id,email,password,name,address,to_char(birthday,'YYYY-MM-DD'), to_char(regdate,'YYYY-MM-DD'), 
question_no, answer from mini_member;

select count(*) from mini_member where password ='a';