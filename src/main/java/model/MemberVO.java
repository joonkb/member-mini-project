package model;

public class MemberVO {
	private String id;
	private String email;
	private String password;
	private String name;
	private String address;
	private String birthday;
	private String regdate;
	private int questionNo;
	private String answer;
	public MemberVO() {
		super();
	}
	public MemberVO(String id, String email, String password, String name, String address, String birthday,
			String regdate, int questionNo, String answer) {
		super();
		this.id = id;
		this.email = email;
		this.password = password;
		this.name = name;
		this.address = address;
		this.birthday = birthday;
		this.regdate = regdate;
		this.questionNo = questionNo;
		this.answer = answer;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getQuestionNo() {
		return questionNo;
	}
	public void setQuestionNo(int questionNo) {
		this.questionNo = questionNo;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", email=" + email + ", password=" + password + ", name=" + name + ", address="
				+ address + ", birthday=" + birthday + ", regdate=" + regdate + ", questionNo=" + questionNo
				+ ", answer=" + answer + "]";
	}
}
/*
	id varchar2(100) primary key,
	email varchar2(100) not null, 
	password varchar2(100) not null,
	name varchar2(100) not null,
	address varchar2(100) not null,
	birthday date not null,
	regdate date not null,
	question_no number not null,
	answer varchar2(100) not null,
*/