package com.javaex.vo;

public class GuestbookVo {
	
	private int no;
	private String id;
	private String password;
	private String content;
	private String regDate;
	
	
	public GuestbookVo() {
		super();
	}
	public GuestbookVo(int no, String id, String password, String content, String regDate) {
		super();
		this.no = no;
		this.id = id;
		this.password = password;
		this.content = content;
		this.regDate = regDate;
	}
	
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	
	
	
	@Override
	public String toString() {
		return "GuestbookVo [no=" + no + ", id=" + id + ", password=" + password + ", content=" + content + ", regDate="
				+ regDate + "]";
	}
	
	
	
	
	
	
	
	
	
	

}
