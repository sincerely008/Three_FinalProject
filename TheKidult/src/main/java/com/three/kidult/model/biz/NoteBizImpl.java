package com.three.kidult.model.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.three.kidult.model.dao.NoteDao;

@Service
public class NoteBizImpl implements NoteBiz {

	@Autowired
	private NoteDao dao;
	
	@Override
	public int sendnote(String note_content, String note_send, String note_get) {

		return dao.sendnote(note_content, note_send, note_get);
	}

	@Override
	public int noteselect(String note_get) {

		return dao.noteselect(note_get);
	}

	@Override
	public int notedelete(int note_no) {

		return dao.notedelete(note_no);
	}

}
