package com.three.kidult.model.dao;

import java.util.List;

import com.three.kidult.dto.ProductDto;

public interface ProductDao {
		
		String namespace = "board.";
		
		public List<ProductDto> boardList(int offset, int noOfRecords);
		public ProductDto selectBoard();
		public int insertBoard(ProductDto dto);
		public int updateBoard(ProductDto dto);
		public int deleteBoard(int product_no);
		public int getNoOfRecords();
		public List<ProductDto> searchFiled(int offset, int noOfRecords, String searchFiled, String searchValue);
		public List<ProductDto> productList();
		public int insert(List<ProductDto> list);

}



