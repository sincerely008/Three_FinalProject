package com.three.kidult.model.biz;

import java.util.List;

import com.three.kidult.dto.PaymentDto;

public interface PaymentBiz {

	public List<PaymentDto> selectList();		// 결제정보
	public int payinsert(PaymentDto dto);		// 구매 후 결제 정보 업데이트
	public int paydelete(int payment_no, int payment_groupno);		// 환불
	
}
