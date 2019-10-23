<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.three.kidult.dto.MemberDto"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="js/pament.js"></script>
<script type="text/javascript">
<%
	MemberDto mdto = (MemberDto)session.getAttribute("memberDto");
%>
	var IMP = window.IMP;
	IMP.init('imp31732258');
	
	
	function requestPay() {
	      // IMP.request_pay(param, callback) 호출
		IMP.request_pay({
		    pg : 'kakaopay',
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : ${pdto.product_name},
		    amount : ${pdto.product_price },
		    buyer_email : 'iamport@siot.do',
		    buyer_name : '구매자이름',
		    buyer_tel : '010-1234-5678',
		    buyer_addr : '서울특별시 강남구 삼성동',
		    buyer_postcode : '12356'
		}, function(rsp) {
			if (rsp.success) {
				var msg = '결제가 완료되었습니다.';
				msg += '고유ID : ' + rsp.imp_uid;
				msg += '상점 거래ID : ' + rsp.merchant_uid;
				msg += '결제 금액 : ' + rsp.paid_amount;
				msg += '카드 승인번호 : ' + rsp.apply_num;
				location.href="home.do";
				} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
				}
				alert(msg);
				});
 
	    }

</script>

<title>Insert title here</title>
</head>
<body>
	<div>
		<table>
			<tr>
				<td><a>이름 : ${pdto.product_name }</a></td>
			</tr>
			<tr>
				<td><a>가격 : ${pdto.product_price } 원</a></td>
			</tr>
			<tr>
				<td>
					<input type="button" value="구입하기" onclick="location.href='requestPay()'">
					<input type="button" value="장바구니" onclick="location.href=''">
				</td>
			</tr>
		</table>
	</div>
	<div>
		<img alt="" src="${pdto.product_details }">
	</div>
	<a>${mdto.member_id }</a>


</body>
</html>