package com.three.kidult.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.three.kidult.dto.UsedproductDto;

@Repository
public class UsedproductDaoImpl implements UsedproductDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	int noOfRecords;

	@Override
	public List<UsedproductDto> boardList(int offset, int noOfRecords) {
		
		List<UsedproductDto> list = new ArrayList<UsedproductDto>();
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("offset", offset);
		param.put("noOfRecords", offset + noOfRecords);
		
		try {
			list = sqlSession.selectList(namespace + "usedlist", param);
			
		} catch (Exception e) {
			System.out.println("list error");
		}
		this.noOfRecords = sqlSession.selectOne(namespace + "totalCountList");
		return list;
	}

	@Override
	public UsedproductDto selectBoard() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertBoard(UsedproductDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateBoard(UsedproductDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteBoard(int product_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getNoOfRecords() {
		// TODO Auto-generated method stub
		return noOfRecords;
	}

	@Override
	public List<UsedproductDto> searchFiled(int offset, int noOfRecords, String searchFiled, String searchValue) {
		
		List<UsedproductDto> list = new ArrayList<UsedproductDto>();
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("offset", offset);
		params.put("noOfRecords", offset + noOfRecords);
		params.put("searchFiled", searchFiled);
		params.put("searchValue", searchValue);
		
		list = sqlSession.selectList(namespace + "usedlist", params);
		this.noOfRecords = sqlSession.selectOne(namespace + "fileCount", params);
		
		return list;
		
	}

	@Override
	public int updateViews(int usedproduct_views) {
		
		int res = 0;
		
		try {
			res = sqlSession.update(namespace + "views", usedproduct_views);
		} catch (Exception e) {
			System.out.println("views error");
		}
		return res;
	}

}
