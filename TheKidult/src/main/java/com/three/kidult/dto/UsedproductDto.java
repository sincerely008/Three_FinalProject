package com.three.kidult.dto;

import java.util.Date;

public class UsedproductDto {
	
	private int usedproduct_no;
	private String usedproduct_title;
	private String usedproduct_content;
	private Date usedproduct_date;
	private int category_no;
	private String member_id;
	private int usedproduct_views;
	private String category_name;
	
	public UsedproductDto() {
		
	}

	public UsedproductDto(int usedproduct_no, String usedproduct_title, String usedproduct_content,
			Date usedproduct_date, int category_no, String member_id, int usedproduct_views, String category_name) {
		super();
		this.usedproduct_no = usedproduct_no;
		this.usedproduct_title = usedproduct_title;
		this.usedproduct_content = usedproduct_content;
		this.usedproduct_date = usedproduct_date;
		this.category_no = category_no;
		this.member_id = member_id;
		this.usedproduct_views = usedproduct_views;
		this.category_name =category_name;
	}

	public int getUsedproduct_no() {
		return usedproduct_no;
	}

	public void setUsedproduct_no(int usedproduct_no) {
		this.usedproduct_no = usedproduct_no;
	}

	public String getUsedproduct_title() {
		return usedproduct_title;
	}

	public void setUsedproduct_title(String usedproduct_title) {
		this.usedproduct_title = usedproduct_title;
	}

	public String getUsedproduct_content() {
		return usedproduct_content;
	}

	public void setUsedproduct_content(String usedproduct_content) {
		this.usedproduct_content = usedproduct_content;
	}

	public Date getUsedproduct_date() {
		return usedproduct_date;
	}

	public void setUsedproduct_date(Date usedproduct_date) {
		this.usedproduct_date = usedproduct_date;
	}

	public int getCategory_no() {
		return category_no;
	}

	public void setCategory_no(int category_no) {
		this.category_no = category_no;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public int getUsedproduct_views() {
		return usedproduct_views;
	}

	public void setUsedproduct_views(int usedproduct_views) {
		this.usedproduct_views = usedproduct_views;
	}

	public String getCategory_name() {
		return category_name;
	}

	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}

	

}
