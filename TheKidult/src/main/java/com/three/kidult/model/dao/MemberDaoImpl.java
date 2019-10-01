package com.three.kidult.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.three.kidult.dto.MemberDto;


@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public MemberDto idchk(String id) {
		
		MemberDto dto = new MemberDto();
		
		try {
			dto = sqlSession.selectOne(namespace + "idchk", id);
		} catch (Exception e) {
			System.out.println("id chk error");
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public MemberDto emailchk(String email) {
		
		MemberDto dto = new MemberDto();
		
		try {
			dto = sqlSession.selectOne(namespace + "emailchk", email);
		} catch (Exception e) {
			System.out.println("email chk error");
		}
		return dto;
	}

	@Override
	public int signup(MemberDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<MemberDto> selectList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberDto login(String id, String pw) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberDto forgotId(String name, String email) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberDto forgotPw(String id, String name, String email) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updatePw(String id, String pw) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int goodbyeUser(MemberDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

}