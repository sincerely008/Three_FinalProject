package com.three.kidult.dto;

import java.util.Date;

public class PaymentDto {
	
	private int payment_no;
	private int paymemt_groupno;
	private String member_id;
	private int product_no;
	private String payment_name;
	private int payment_price;
	private Date payment_date;
	private String payment_addr;
	
	public PaymentDto() {
		
	}

	public PaymentDto(int payment_no, int paymemt_groupno, String member_id, int product_no, String payment_name,
			int payment_price, Date payment_date, String payment_addr) {
		super();
		this.payment_no = payment_no;
		this.paymemt_groupno = paymemt_groupno;
		this.member_id = member_id;
		this.product_no = product_no;
		this.payment_name = payment_name;
		this.payment_price = payment_price;
		this.payment_date = payment_date;
		this.payment_addr = payment_addr;
	}

	public int getPayment_no() {
		return payment_no;
	}

	public void setPayment_no(int payment_no) {
		this.payment_no = payment_no;
	}

	public int getPaymemt_groupno() {
		return paymemt_groupno;
	}

	public void setPaymemt_groupno(int paymemt_groupno) {
		this.paymemt_groupno = paymemt_groupno;
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

	public String getPayment_name() {
		return payment_name;
	}

	public void setPayment_name(String payment_name) {
		this.payment_name = payment_name;
	}

	public int getPayment_price() {
		return payment_price;
	}

	public void setPayment_price(int payment_price) {
		this.payment_price = payment_price;
	}

	public Date getPayment_date() {
		return payment_date;
	}

	public void setPayment_date(Date payment_date) {
		this.payment_date = payment_date;
	}

	public String getPayment_addr() {
		return payment_addr;
	}

	public void setPayment_addr(String payment_addr) {
		this.payment_addr = payment_addr;
	}
	
	

}
