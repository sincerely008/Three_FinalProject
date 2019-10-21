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
<script type="text/javascript">
<%
MemberDto memberDto = (MemberDto)session.getAttribute("memberDto");
%>
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
				<button type="button" onclick="location.href='delivery.do'" >배송조회</button>
				<button type="button" onclick="location.href='home.do'" >뒤로가기</button><br/>
			</div>
		

		</form>
	</div>
	<%@ include file="/form/footer.jsp"%>
</body>
</html>