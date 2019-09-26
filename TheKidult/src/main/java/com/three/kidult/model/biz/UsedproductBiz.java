package com.three.kidult.model.biz;

import java.util.List;

import com.three.kidult.dto.UsedproductDto;

public interface UsedproductBiz {
	
	public List<UsedproductDto> boardList(int offset, int noOfRecords);
	public UsedproductDto selectBoard();
	public int insertBoard(UsedproductDto dto);
	public int updateBoard(UsedproductDto dto);
	public int deleteBoard(int product_no);
	public int getNoOfRecords();
	public List<UsedproductDto> searchFiled(int offset, int noOfRecords, String searchFiled, String searchValue);
	public int updateViews(int usedproduct_views);

}
