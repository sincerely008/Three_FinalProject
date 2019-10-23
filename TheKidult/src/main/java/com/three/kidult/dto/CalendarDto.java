package com.three.kidult.dto;

public class CalendarDto {
	
	private int fullid;
	private String fulltitle;
	private String fullstart;
	private String fullend;
	private String fulldescription;
	
	public CalendarDto() {
		
	}

	public CalendarDto(int fullid, String fulltitle, String fullstart, String fullend, String fulldescription) {
		super();
		this.fullid = fullid;
		this.fulltitle = fulltitle;
		this.fullstart = fullstart;
		this.fullend = fullend;
		this.fulldescription = fulldescription;
	}

	public int getFullid() {
		return fullid;
	}

	public void setFullid(int fullid) {
		this.fullid = fullid;
	}

	public String getFulltitle() {
		return fulltitle;
	}

	public void setFulltitle(String fulltitle) {
		this.fulltitle = fulltitle;
	}

	public String getFullstart() {
		return fullstart;
	}

	public void setFullstart(String fullstart) {
		this.fullstart = fullstart;
	}

	public String getFullend() {
		return fullend;
	}

	public void setFullend(String fullend) {
		this.fullend = fullend;
	}

	public String getFulldescription() {
		return fulldescription;
	}

	public void setFulldescription(String fulldescription) {
		this.fulldescription = fulldescription;
	}
	
	

}
