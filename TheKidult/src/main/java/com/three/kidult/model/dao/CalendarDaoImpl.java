package com.three.kidult.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.three.kidult.dto.CalendarDto;

@Repository
public class CalendarDaoImpl implements CalendarDao{
	
	@Autowired
	private SqlSessionTemplate sqlsession;
	
	@Override
	public List<CalendarDto> fullList() {
		List<CalendarDto> list = new ArrayList<CalendarDto>();
		
		list = sqlsession.selectList(namespace + "callist");
		
		return list;
	}

	@Override
	public int fullDropUpdate(CalendarDto dto) {
		int res = 0;
		
		res = sqlsession.update(namespace + "caldropupdate", dto);
		
		
		return res;
	}

	@Override
	public int fullInsert(CalendarDto dto) {
		int res = 0;
		
		res = sqlsession.insert(namespace + "calinsert", dto);
		
		return res;
	}

	@Override
	public CalendarDto fullDetail(int fullid) {
		CalendarDto dto = null;
		
		dto = sqlsession.selectOne(namespace + "caldetail", fullid);
		
		return dto;
	}

	@Override
	public int fullUpdate(CalendarDto dto) {
		int res = 0;
		
		try {
			res = sqlsession.update(namespace + "calupdate", dto);
			
			System.out.println(res);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("update error");
		}
		
		return res;
	}

	@Override
	public int fullDelete(int fullid) {
		int res = 0;
		
		res = sqlsession.delete(namespace + "caldelete", fullid);
		
		return res;
	}

}
