package com.three.kidult.model.dao;

import java.util.List;

import com.three.kidult.dto.CalendarDto;

public interface CalendarDao {
	
	String namespace = "calendar.";
	
	public List<CalendarDto> fullList();
	public int fullDropUpdate(CalendarDto dto);
	public int fullInsert(CalendarDto dto);
	public CalendarDto fullDetail(int fullId);
	public int fullUpdate(CalendarDto dto);
	public int fullDelete(int fullId);


}
