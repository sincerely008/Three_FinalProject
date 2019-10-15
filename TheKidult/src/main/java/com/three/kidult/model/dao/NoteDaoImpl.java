package com.three.kidult.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.three.kidult.dto.NoteDto;

@Repository
public class NoteDaoImpl implements NoteDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int sendnote(String note_content, String note_send, String note_get) {
		
		int res = 0;
		HashMap<String,Object> map =new HashMap<String,Object>();
		map.put("note_content", note_content);
		map.put("note_send", note_send);
		map.put("note_get",note_get);
		
		try {
			res = sqlSession.insert(namespace+"sendnote",map);
		} catch (Exception e) {
			System.out.println("sendnote error");
		}
		return res;
	}

	@Override
	public int noteselect(int note_no, String note_get) {
		
		int res = 0;
		
		try {
			res = sqlSession.update(namespace+"noteselect",note_get);
		} catch (Exception e) {
			System.out.println("noteselect error");
		}
		
		return res;
	}

	@Override
	public int notedelete(int note_no, String note_get) {

		int res = 0;
		
		try {
			res = sqlSession.delete(namespace+"notedelete",note_no);
		} catch (Exception e) {
			System.out.println("notedelete error");
		}
		
		return res;
	}

	@Override
	public List<NoteDto> selectlist(String note_get) {
		
		List<NoteDto> list = new ArrayList<NoteDto>();
		
		try {
			list = sqlSession.selectList(namespace+"selectlist",note_get);
		} catch (Exception e) {
			System.out.println("selectlist error");
		}
		
		return list;
	}
}
