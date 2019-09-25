package com.three.kidult.model.biz;

import java.util.List;

import com.three.kidult.dto.ProductDto;

public interface ProductBiz {
	
	public List<ProductDto> boardList(int offset, int noOfRecords);
	public ProductDto selectBoard();
	public int insertBoard(ProductDto dto);
	public int updateBoard(ProductDto dto);
	public int deleteBoard(String id);
	public int getNoOfRecords();
	public List<ProductDto> searchFiled(int offset, int noOfRecords, String searchFiled, String searchValue);

}
