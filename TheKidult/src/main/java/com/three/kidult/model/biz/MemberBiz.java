package com.three.kidult.model.biz;

import java.util.HashMap;
import java.util.List;

import com.three.kidult.dto.MemberDto;

public interface MemberBiz {
	
	public MemberDto idchk(String id);									// 회원가입 idchk
	public MemberDto emailchk(String email);							// 회원가입 emailchk
	public int signup(MemberDto dto);									// 회원가입
	public List<MemberDto> selectList();								// 회원 리스트
	public MemberDto login(String id, String pw);						// 로그인
	public MemberDto forgotId(String name, String email);				// 아이디 찾기
	public MemberDto forgotPw(String id, String name, String email);	// 비밀번호 찾기
	public int updatePw(String id, String pw);							// 비빌번호 변경
	public int goodbyeUser(MemberDto dto);								// 회원탈퇴
	public String kakaoGetAccessToken(String authorize_code);				//카카오 로그인
	public HashMap<String, Object> kakaoGetUserInfo(String access_Token);	//카카오 로그인
	public int roleupdate(String enabled, String id);									// 웹 사용여부 변경(관리자 페이지)
	public int deleteid(String id);														// 회원 탈퇴(관리자 페이지)

}
