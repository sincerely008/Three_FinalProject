package com.three.kidult.model.biz;

import java.util.List;

import com.three.kidult.dto.CalendarDto;

public interface CalendarBiz {
	
	public List<CalendarDto> fullList();
	public int fullDropUpdate(CalendarDto dto);
	public int fullInsert(CalendarDto dto);
	public CalendarDto fullDetail(int fullId);
	public int fullUpdate(CalendarDto dto);
	public int fullDelete(int fullId);

}
