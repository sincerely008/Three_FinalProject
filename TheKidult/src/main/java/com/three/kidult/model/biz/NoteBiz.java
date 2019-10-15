package com.three.kidult.model.biz;

import java.util.List;

import com.three.kidult.dto.NoteDto;

public interface NoteBiz {

	public List<NoteDto> selectlist(String note_get); // 쪽지함 전체리스트
	public int sendnote(String note_content, String note_send, String note_get); 	// 쪽지 보내기
	public int noteselect(int note_no, String note_get);	// 쪽지 확인
	public int notedelete(int note_no, String note_get);	// 쪽지 삭제
}
