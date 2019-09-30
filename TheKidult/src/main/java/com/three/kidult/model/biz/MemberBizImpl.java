package com.three.kidult.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.three.kidult.dto.MemberDto;
import com.three.kidult.model.dao.MemberDao;

@Service
public class MemberBizImpl implements MemberBiz {

	@Autowired
	private MemberDao dao;
	
	@Override
	public MemberDto idchk(String id) {
		
		return dao.idchk(id);
	}

	@Override
	public MemberDto emailchk(String email) {
		
		return dao.emailchk(email);
	}

	@Override
	public int signup(MemberDto dto) {
		
		return dao.signup(dto);
	}

	@Override
	public List<MemberDto> selectList() {
		
		return dao.selectList();
	}

	@Override
	public MemberDto login(String id, String pw) {
		
		return dao.login(id, pw);
	}

	@Override
	public MemberDto forgotId(String name, String email) {
		
		return dao.forgotId(name, email);
	}

	@Override
	public MemberDto forgotPw(String id, String name, String email) {
		
		return dao.forgotPw(id, name, email);
	}

	@Override
	public int updatePw(String id, String pw) {
		
		return dao.updatePw(id, pw);
	}

	@Override
	public int goodbyeUser(MemberDto dto) {
		
		return dao.goodbyeUser(dto);
	}

}
