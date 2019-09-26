package com.three.kidult.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.three.kidult.dto.UsedproductDto;
import com.three.kidult.model.dao.UsedproductDao;

@Service
public class UsedproductBizImpl implements UsedproductBiz {
	
	@Autowired
	private UsedproductDao dao;

	@Override
	public List<UsedproductDto> boardList(int offset, int noOfRecords) {
		
		return dao.boardList(offset, noOfRecords);
	}

	@Override
	public UsedproductDto selectBoard() {
		
		return dao.selectBoard();
	}

	@Override
	public int insertBoard(UsedproductDto dto) {
		
		return dao.insertBoard(dto);
	}

	@Override
	public int updateBoard(UsedproductDto dto) {
		
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
	public List<UsedproductDto> searchFiled(int offset, int noOfRecords, String searchFiled, String searchValue) {
		
		return dao.searchFiled(offset, noOfRecords, searchFiled, searchValue);
	}

	@Override
	public int updateViews(int usedproduct_views) {
		
		return dao.updateViews(usedproduct_views);
	}

}
