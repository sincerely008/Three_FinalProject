package com.three.kidult.model.dao;

import com.three.kidult.dto.NoteDto;

public interface NoteDao {
	
	String namespace = "note.";
	
	public int sendnote(NoteDto dto); 	// 쪽지 보내기
	public int noteselect(String confirm);	// 쪽지 확인
	public int notedelete(NoteDto dto);	// 쪽지 삭제

}
