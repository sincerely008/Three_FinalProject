package com.three.kidult.dto;

public class OtherDto {
	
	private int product_no;
	private String other_site;
	private int other_price;
	
	public OtherDto() {
	
	}

	public OtherDto(int product_no, String other_site, int other_price) {
		super();
		this.product_no = product_no;
		this.other_site = other_site;
		this.other_price = other_price;
	}

	public int getProduct_no() {
		return product_no;
	}

	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}

	public String getOther_site() {
		return other_site;
	}

	public void setOther_site(String other_site) {
		this.other_site = other_site;
	}

	public int getOther_price() {
		return other_price;
	}

	public void setOther_price(int other_price) {
		this.other_price = other_price;
	}
	
	

}
