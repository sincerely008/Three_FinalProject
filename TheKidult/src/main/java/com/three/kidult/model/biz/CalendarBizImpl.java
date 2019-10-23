package com.three.kidult.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.three.kidult.dto.CalendarDto;
import com.three.kidult.model.dao.CalendarDaoImpl;

@Service
public class CalendarBizImpl implements CalendarBiz{
	
	@Autowired
	private CalendarDaoImpl dao;

	@Override
	public List<CalendarDto> fullList() {
		// TODO Auto-generated method stub
		return dao.fullList();
	}

	@Override
	public int fullDropUpdate(CalendarDto dto) {
		// TODO Auto-generated method stub
		return dao.fullDropUpdate(dto);
	}

	@Override
	public int fullInsert(CalendarDto dto) {
		// TODO Auto-generated method stub
		return dao.fullInsert(dto);
	}

	@Override
	public CalendarDto fullDetail(int fullId) {
		// TODO Auto-generated method stub
		return dao.fullDetail(fullId);
	}

	@Override
	public int fullUpdate(CalendarDto dto) {
		// TODO Auto-generated method stub
		return dao.fullUpdate(dto);
	}

	@Override
	public int fullDelete(int fullId) {
		// TODO Auto-generated method stub
		return dao.fullDelete(fullId);
	}

}
