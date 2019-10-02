package com.three.kidult.model.dao;

import java.util.HashMap;
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
		
		int res = 0;
		
		try {
			res = sqlSession.insert(namespace + "signup", dto);
		} catch (Exception e) {
			System.out.println("signup error");
		}
		return res;
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
		
		MemberDto dto = new MemberDto();
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("name", name);
		param.put("email", email);
		
		try {
			dto = sqlSession.selectOne(namespace + "forgotid", param);
		} catch (Exception e) {
			System.out.println("아이디 찾기 error");
		}
		return dto;
	}

	@Override
	public MemberDto forgotPw(String id, String name, String email) {
		
		MemberDto dto = new MemberDto();
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("id", id);
		param.put("name", name);
		param.put("email", email);
		
		try {
			dto = sqlSession.selectOne(namespace + "forgotpw", param);
		} catch (Exception e) {
			System.out.println("비밀번호 찾기 error");
		}
		return dto;
	}

	@Override
	public int updatePw(String id, String pw) {
		
		int res = 0;
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("id", id);
		param.put("pw", pw);
		
		try {
			res = sqlSession.update(namespace + "changepw", param);
		} catch (Exception e) {
			System.out.println("비밀번호 변경 error");
		}
		return res;
	}

	@Override
	public int goodbyeUser(MemberDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

}
