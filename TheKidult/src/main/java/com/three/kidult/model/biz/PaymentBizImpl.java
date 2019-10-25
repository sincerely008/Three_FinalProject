package com.three.kidult.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.three.kidult.dto.PaymentDto;
import com.three.kidult.model.dao.PaymentDao;

@Service
public class PaymentBizImpl implements PaymentBiz {

	@Autowired
	private PaymentDao dao;
	
	@Override
	public List<PaymentDto> selectList() {
		
		return dao.selectList();
	}

	@Override
	public int payinsert(PaymentDto dto) {
		
		return dao.payinsert(dto);
	}

	@Override
	public int paydelete(int payment_no, int payment_groupno) {
		
		return dao.paydelete(payment_no, payment_groupno);
	}

}
