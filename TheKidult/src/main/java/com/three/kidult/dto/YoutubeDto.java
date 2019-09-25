package com.three.kidult.dto;

public class YoutubeDto {
	
	private int youtube_no;
	private String youtube_url;
	
	public YoutubeDto() {
	
	}

	public YoutubeDto(int youtube_no, String youtube_url) {
		super();
		this.youtube_no = youtube_no;
		this.youtube_url = youtube_url;
	}

	public int getYoutube_no() {
		return youtube_no;
	}

	public void setYoutube_no(int youtube_no) {
		this.youtube_no = youtube_no;
	}

	public String getYoutube_url() {
		return youtube_url;
	}

	public void setYoutube_url(String youtube_url) {
		this.youtube_url = youtube_url;
	}
	
}
