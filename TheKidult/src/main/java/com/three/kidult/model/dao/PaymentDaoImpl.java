package com.three.kidult.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.three.kidult.dto.PaymentDto;

@Repository
public class PaymentDaoImpl implements PaymentDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<PaymentDto> selectList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int payinsert(PaymentDto dto) {

		int res = 0;
		
		try {
			res = sqlSession.insert(namespace + "insertpay", dto);
		} catch (Exception e) {
			System.out.println("payinsert error");
		}
		return res;
	}

	@Override
	public int paydelete(int payment_no, int payment_groupno) {
		// TODO Auto-generated method stub
		return 0;
	}

}
