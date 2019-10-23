package com.three.kidult.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.three.kidult.dto.ProductDto;
import com.three.kidult.model.dao.ProductDao;

@Service
public class ProductBizImpl implements ProductBiz {
	
	@Autowired
	private ProductDao dao;

	@Override
	public List<ProductDto> boardList(int offset, int noOfRecords) {
		
		return dao.boardList(offset, noOfRecords);
	}

	@Override
	public ProductDto selectBoard() {
		
		return dao.selectBoard();
	}

	@Override
	public int insertBoard(ProductDto dto) {
		
		return dao.insertBoard(dto);
	}

	@Override
	public int updateBoard(ProductDto dto) {
		
		return dao.updateBoard(dto);
	}

	@Override
	public int deleteBoard(int product_no) {
		
		return dao.deleteBoard(product_no);
	}

	@Override
	public int getNoOfRecords() {
		
		return dao.getNoOfRecords();
	}

	@Override
	public List<ProductDto> searchFiled(int offset, int noOfRecords, String searchFiled, String searchValue) {
		
		return dao.searchFiled(offset, noOfRecords, searchFiled, searchValue);
	}

	@Override
	public List<ProductDto> productList() {
		
		return dao.productList();
	}

	@Override
	public int insert(List<ProductDto> list) {
		
		return dao.insert(list);
	}

}
