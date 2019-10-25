<%@page import="com.three.kidult.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/loginform2.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/loginform.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
<%
MemberDto memberDto = (MemberDto)session.getAttribute("memberDto");
%>

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
<style type="text/css">
a {
	color: white;
}
</style>
</head>
<body>
	<div id="style" class="myform">
		<form id="form" name="form" method="get" action="UserInformationUpdate.do">
			<h1>정보보기</h1>
			<div>
				<label>ID <span class="small">아이디</span></label> 
				<input type="text" name="id" id="id" readonly="readonly"
					value="<%=memberDto.getMember_id()%>" />
				<label>Name <span class="small">이름</span></label> 
				<input type="text" name="name" id="name" readonly="readonly"
					value="<%=memberDto.getMember_name()%>" /> 
				<label>Phone <span class="small">전화번호</span></label>
				<input type="text" name="phone" id="phone" readonly="readonly"
					value="<%=memberDto.getMember_phone()%>" />
				<label>Email<span class="small">이메일주소</span></label>
				<input type="text" name="email" id="email" readonly="readonly"
					value="<%=memberDto.getMember_email()%>" />
			</div>
			<div>
				<button type="submit" id="submit">수정하기</button>
				<button type="button" onclick="">탈퇴하기</button>

				<button type="button" onclick="" >결재내역</button>

				<button type="button" onclick="location.href='home.do'" >뒤로가기</button><br/>
			</div>
		</form>
		<div>
			<br>
				<label>Delivery <span class="small">배송조회</span></label> 
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
		<label>
			<span class="small">&emsp;운송장 번호</span>
		</label>
			<input type="text" id="number" />
			<input type="button" id="search" value="조 회" />
		</div>	
	</div>
	<%@ include file="/form/footer.jsp"%>
</body>
</html>