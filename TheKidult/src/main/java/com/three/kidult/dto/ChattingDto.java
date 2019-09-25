package com.three.kidult.dto;

public class ChattingDto {
	
	private int chatting_no;
	private String chatting_admin;
	private String chatting_user;
	
	public ChattingDto() {
		
	}

	public ChattingDto(int chatting_no, String chatting_admin, String chatting_user) {
		super();
		this.chatting_no = chatting_no;
		this.chatting_admin = chatting_admin;
		this.chatting_user = chatting_user;
	}

	public int getChatting_no() {
		return chatting_no;
	}

	public void setChatting_no(int chatting_no) {
		this.chatting_no = chatting_no;
	}

	public String getChatting_admin() {
		return chatting_admin;
	}

	public void setChatting_admin(String chatting_admin) {
		this.chatting_admin = chatting_admin;
	}

	public String getChatting_user() {
		return chatting_user;
	}

	public void setChatting_user(String chatting_user) {
		this.chatting_user = chatting_user;
	}


}
