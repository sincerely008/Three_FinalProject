<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#search").click(function(){
		var delivery = $("#delivery option:selected").val();
		var number = $("#number").val();
	
		if(number.length!=10 && number.length!=11 && number.length!=12 && number.length!=13){
			alert("운송장 번호를 확인해 주세요");
		}else{
			window.open("https://tracker.delivery/#/"+delivery+"/"+number,"pop", "scrollbars=no,width=500,height=500,top=100,left=100,menubar=false");
		}
	})
});
</script>
</head>
<body>
	<div>
		<span>
			<select id=delivery>
				<option value="de.dhl">DHL</option>
				<option value="kr.chunilps">천일택배</option>
				<option value="kr.cjlogistics">CJ대한통운</option>
				<option value="kr.cupost">CU 편의점택배</option>
				<option value="kr.cvsnet">GS Postbox 택배</option>
				<option value="kr.cway">CWAY (Woori Express)</option>
				<option value="kr.daesin">대신택배</option>
				<option value="kr.epost">우체국 택배</option>
				<option value="kr.hanips">한의사랑택배</option>
				<option value="kr.hanjin">한진택배</option>
				<option value="kr.hdexp">합동택배</option>
				<option value="kr.homepick">홈픽</option>
				<option value="kr.honamlogis">한서호남택배</option>
				<option value="kr.ilyanglogis">일양로지스</option>
				<option value="kr.kdexp">경동택배</option>
				<option value="kr.kunyoung">건영택배</option>
				<option value="kr.logen">로젠택배</option>
				<option value="kr.lotte">롯데택배</option>
				<option value="kr.slx">SLX</option>
				<option value="nl.tnt">TNT</option>
				<option value="un.upu.ems">EMS</option>
				<option value="us.fedex">Fedex</option>
				<option value="us.ups">UPS</option>
				<option value="us.usps">USPS</option>
			</select>
		</span>
	</div>
	<div>
		<input type="text" id="number" />
	</div>
	<input type="button" id="search" value="조회" />


</body>
</html>