package com.three.kidult.model.biz;

import com.three.kidult.dto.NoteDto;

public interface NoteBiz {

	public int sendnote(String note_content, String note_send, String note_get); 	// 쪽지 보내기
	public int noteselect(String note_get);	// 쪽지 확인
	public int notedelete(int note_no);	// 쪽지 삭제
}
