<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<script type="text/javascript">
	
var IMP = window.IMP;
IMP.init('imp31732258');


function requestPay() {
      // IMP.request_pay(param, callback) 호출
   
    
	IMP.request_pay({
	    pg : 'kakaopay',
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : $("input[name=product_name]").val(),
	    amount :$("input[name=product_price]").val(),
	    buyer_email : $("input[name=member_email]").val(),
	    buyer_name : $("input[name=member_name]").val(),
	    buyer_tel : $("input[name=member_phone]").val(),
	    buyer_addr : $("input[name=addr1]").val() + $("input[name=addr2]").val(),
	}, function(rsp) {
		if (rsp.success) {
			var msg = '결제가 완료되었습니다.';
		    var addr = $("input[name=addr1]").val() + " " +$("input[name=addr2]").val();
			//msg += '고유ID : ' + rsp.imp_uid;
			//msg += '상점 거래ID : ' + rsp.merchant_uid;
			//msg += '결제 금액 : ' + rsp.paid_amount;
			//msg += '카드 승인번호 : ' + rsp.apply_num;
			location.replace("paymentres.do?member_id=${mdto.member_id}&product_no=${pdto.product_no}&product_addr="+addr+"&payment_groupno="+rsp.imp_uid);
			} else {
			var msg = '결제에 실패하였습니다.';
			//msg += '에러내용 : ' + rsp.error_msg;
			}
			alert(msg);
			});
    
    }


function searchAddr(){
    daum.postcode.load(function(){
        new daum.Postcode({
            oncomplete: function(data) {
            	
            	var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    $("input[name=addr3]").val(extraAddr);
                
                } else {
                	$("input[name=addr3]").val('');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                $("input[name=addr1]").val(addr);
                // 커서를 상세주소 필드로 이동한다.
                $("input[name=addr2]").focus();
            }
        }).open();
    });
}


</script>

</head>
<body>
	
	<div>
			<table>
				<tr>
					<th>상품명</th>
					<td>${pdto.product_name }</td>
					<td><input type="hidden" name="product_name" value="${pdto.product_name }"></td>
				</tr>
				<tr>
					<th>가   격</th>
					<td>${pdto.product_price }</td>
					<td><input type="hidden" name="product_price" value="${pdto.product_price }"></td>
				</tr>
				<tr>
					<th>배송지</th>
					<td><input type="text" name="addr1" value="${mdto.member_addr }" readonly="readonly"> <input type="text" name="addr2"></td>
					
					<td><input type="button" value="배송지 변경" onclick="location.href='javascript:searchAddr()'"></td>
				</tr>
				<tr>
					<th>받는 사람</th>
					<td>${mdto.member_name }</td>
					<td><input type="hidden" name="member_name" value="${mdto.member_name }"></td>
					<td><input type="hidden" name="member_email" value="${mdto.member_email }"></td>
					<td><input type="hidden" name="member_phone" value="${mdto.member_phone }"></td>
				</tr>
			</table>
	</div>
	
	<button onclick="requestPay()">결제하기</button>
	<button onclick="location.href='selectpage.do?product_no=${pdto.product_no}'">취소</button>

</body>
</html>