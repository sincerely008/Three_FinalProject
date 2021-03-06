package com.three.kidult.dto;

import java.util.Date;

public class MemberDto {
	
	private String member_id;
	private String member_pw;
	private String member_name;
	private String member_birth;
	private String member_addr;
	private String member_phone;
	private String member_email;
	private String member_enabled;
	private String member_gender;
	private String member_role;
	private String member_kakao;
	private Date member_regdate;
	private Date member_pwevent;
	
	
	public MemberDto() {
		
	}


	public MemberDto(String member_id, String member_pw, String member_name, String member_birth, String member_addr,
			String member_phone, String member_email, String member_enabled, String member_gender, String member_role,
			String member_kakao, Date member_regdate, Date member_pwevent) {
		super();
		this.member_id = member_id;
		this.member_pw = member_pw;
		this.member_name = member_name;
		this.member_birth = member_birth;
		this.member_addr = member_addr;
		this.member_phone = member_phone;
		this.member_email = member_email;
		this.member_enabled = member_enabled;
		this.member_gender = member_gender;
		this.member_role = member_role;
		this.member_kakao = member_kakao;
		this.member_regdate = member_regdate;
		this.member_pwevent = member_pwevent;
	}
	


	public String getMember_id() {
		return member_id;
	}


	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}


	public String getMember_pw() {
		return member_pw;
	}


	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}


	public String getMember_name() {
		return member_name;
	}


	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}


	public String getMember_birth() {
		return member_birth;
	}


	public void setMember_birth(String member_birth) {
		this.member_birth = member_birth;
	}


	public String getMember_addr() {
		return member_addr;
	}


	public void setMember_addr(String member_addr) {
		this.member_addr = member_addr;
	}


	public String getMember_phone() {
		return member_phone;
	}


	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}


	public String getMember_email() {
		return member_email;
	}


	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}


	public String getMember_enabled() {
		return member_enabled;
	}


	public void setMember_enabled(String member_enabled) {
		this.member_enabled = member_enabled;
	}


	public String getMember_gender() {
		return member_gender;
	}


	public void setMember_gender(String member_gender) {
		this.member_gender = member_gender;
	}


	public String getMember_role() {
		return member_role;
	}


	public void setMember_role(String member_role) {
		this.member_role = member_role;
	}


	public String getMember_kakao() {
		return member_kakao;
	}


	public void setMember_kakao(String member_kakao) {
		this.member_kakao = member_kakao;
	}


	public Date getMember_regdate() {
		return member_regdate;
	}


	public void setMember_regdate(Date member_regdate) {
		this.member_regdate = member_regdate;
	}


	public Date getMember_pwevent() {
		return member_pwevent;
	}


	public void setMember_pwevent(Date member_pwevent) {
		this.member_pwevent = member_pwevent;
	}

	
}