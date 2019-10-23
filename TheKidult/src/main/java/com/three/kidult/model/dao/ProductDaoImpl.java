package com.three.kidult.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.three.kidult.dto.ProductDto;

@Repository
public class ProductDaoImpl implements ProductDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	int noOfRecords;
	
	@Override
	public List<ProductDto> boardList(int offset, int noOfRecords) {
		
		List<ProductDto> list = new ArrayList<ProductDto>();
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("offset", offset);
		params.put("noOfRecords", offset + noOfRecords);
		
		try {
			list = sqlSession.selectList(namespace + "boardlist", params);
			this.noOfRecords = sqlSession.selectOne(namespace + "totalCountList");
			
		} catch (Exception e) {
			System.out.println("list error");
		}
		return list;
	}

	@Override
	public ProductDto selectBoard() {
		
		ProductDto dto = new ProductDto();
		
		try {
			dto = sqlSession.selectOne(namespace + "selectOne");
		} catch (Exception e) {
			System.out.println("selectOne error");
		}
		return dto;
	}

	@Override
	public int insertBoard(ProductDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateBoard(ProductDto dto) {
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
		
		return noOfRecords;
	}

	@Override
	public List<ProductDto> searchFiled(int offset, int noOfRecords, String searchFiled, String searchValue) {
		
		List<ProductDto> list = new ArrayList<ProductDto>();
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("offset", offset);
		params.put("noOfRecords", offset + noOfRecords);
		params.put("searchFiled", searchFiled);
		params.put("searchValue", searchValue);
		
		list = sqlSession.selectList(namespace + "boardlist", params);
		this.noOfRecords = sqlSession.selectOne(namespace + "fileCount", params);
		
		return list;
	}

	@Override
	public List<ProductDto> productList() {
		
		List<ProductDto> list = new ArrayList<ProductDto>();
		
		try {
			list = sqlSession.selectList(namespace + "productlist");
		} catch (Exception e) {
			System.out.println("list 출력 실패");
		}
		return list;
	}

	@Override
	public int insert(List<ProductDto> list) {
		
		int res = 0;
		Map<String, List<ProductDto>> map = new HashMap<String, List<ProductDto>>();
		map.put("lists", list);
		
		System.out.println(list.size());
		for(int i  = 0; i < list.size(); i++) {
		System.out.println(map.get("lists").get(i).getCategory_no());
		}
		
		try {
			res = sqlSession.insert(namespace + "dummyInsert", map);
		} catch (Exception e) {
			System.out.println(e);
			System.out.println("dummy insert error");
		}
		return res;
	}

}
