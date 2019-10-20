package com.three.kidult.dto;

public class ProductDto {
	
	private int category_no;
	private int product_no;
	private String product_name;
	private int product_stock;
	private String product_details;
	private int product_price;
	private String product_imgurl;
	
	public ProductDto() {
		
	}

	public ProductDto(int category_no, int product_no, String product_name, int product_stock, String product_details,
			int product_price, String product_imgurl) {
		super();
		this.category_no = category_no;
		this.product_no = product_no;
		this.product_name = product_name;
		this.product_stock = product_stock;
		this.product_details = product_details;
		this.product_price = product_price;
		this.product_imgurl = product_imgurl;
	}

	public int getCategory_no() {
		return category_no;
	}

	public void setCategory_no(int category_no) {
		this.category_no = category_no;
	}

	public int getProduct_no() {
		return product_no;
	}

	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public int getProduct_stock() {
		return product_stock;
	}

	public void setProduct_stock(int product_stock) {
		this.product_stock = product_stock;
	}

	public String getProduct_details() {
		return product_details;
	}

	public void setProduct_details(String product_details) {
		this.product_details = product_details;
	}

	public int getProduct_price() {
		return product_price;
	}

	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}

	public String getProduct_imgurl() {
		return product_imgurl;
	}

	public void setProduct_imgurl(String product_imgurl) {
		this.product_imgurl = product_imgurl;
	}

}
