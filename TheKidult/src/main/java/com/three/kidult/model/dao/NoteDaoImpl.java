package com.three.kidult.model.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	public int noteselect(String note_get) {
		
		int res = 0;
		
		try {
			res = sqlSession.update(namespace+"noteselect",note_get);
		} catch (Exception e) {
			System.out.println("noteselect error");
		}
		
		return res;
	}

	@Override
	public int notedelete(int note_no) {

		int res = 0;
		
		try {
			res = sqlSession.delete(namespace+"notedelete",note_no);
		} catch (Exception e) {
			System.out.println("notedelete error");
		}
		
		return res;
	}

}
