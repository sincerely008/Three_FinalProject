package com.three.kidult.dto;

public class BasketDto {
	
	private String member_id;
	private int product_no;
	private int basket_no;
	private int basket_quantity;
	
	public BasketDto() {
		
	}

	public BasketDto(String member_id, int product_no, int basket_no, int basket_quantity) {
		super();
		this.member_id = member_id;
		this.product_no = product_no;
		this.basket_no = basket_no;
		this.basket_quantity = basket_quantity;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public int getProduct_no() {
		return product_no;
	}

	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}

	public int getBasket_no() {
		return basket_no;
	}

	public void setBasket_no(int basket_no) {
		this.basket_no = basket_no;
	}

	public int getBasket_quantity() {
		return basket_quantity;
	}

	public void setBasket_quantity(int basket_quantity) {
		this.basket_quantity = basket_quantity;
	}
	
	

}
