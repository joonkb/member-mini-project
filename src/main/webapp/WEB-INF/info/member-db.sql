	create table mvc_member(
			id varchar2(100) primary key,
			email varchar2(100) not null, 
			password varchar2(100) not null,
			name varchar2(100) not null,
			address varchar2(100) not null,
			birthday date not null,
			regdate date not null,
			question_no number not null,
			answer varchar2(100) not null,
)

insert into mvc_member values(id, email, password, name, address, birthday, regdate, question_no, answer)