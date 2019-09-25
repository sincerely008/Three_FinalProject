package com.three.kidult.dto;

import java.util.Date;

public class NoteDto {
	
	private int note_no;
	private String note_content;
	private String note_send;
	private String note_get;
	private Date note_date;
	private String note_confirm;
	
	public NoteDto() {
	
	}

	public NoteDto(int note_no, String note_content, String note_send, String note_get, Date note_date,
			String note_confirm) {
		super();
		this.note_no = note_no;
		this.note_content = note_content;
		this.note_send = note_send;
		this.note_get = note_get;
		this.note_date = note_date;
		this.note_confirm = note_confirm;
	}

	public int getNote_no() {
		return note_no;
	}

	public void setNote_no(int note_no) {
		this.note_no = note_no;
	}

	public String getNote_content() {
		return note_content;
	}

	public void setNote_content(String note_content) {
		this.note_content = note_content;
	}

	public String getNote_send() {
		return note_send;
	}

	public void setNote_send(String note_send) {
		this.note_send = note_send;
	}

	public String getNote_get() {
		return note_get;
	}

	public void setNote_get(String note_get) {
		this.note_get = note_get;
	}

	public Date getNote_date() {
		return note_date;
	}

	public void setNote_date(Date note_date) {
		this.note_date = note_date;
	}

	public String getNote_confirm() {
		return note_confirm;
	}

	public void setNote_confirm(String note_confirm) {
		this.note_confirm = note_confirm;
	}
	
	
}
