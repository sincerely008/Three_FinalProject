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
<script type="text/javascript" src="/js/loginform.js"></script>
<%
MemberDto memberDto = (MemberDto)session.getAttribute("memberDto");
%>
<style type="text/css">
a{
	color:white;
}
</style>
</head>
<body>
	<div id="style" class="myform">
		<form id="form" name="form" method="get" action="Userlogin.do">
		<input type="hidden" name= "command" value="update" />
		<input type="hidden" name= "id" value="<%= memberDto.getMember_id() %>" />
			<h1>회원 정보 수정</h1>
			<p>수정해주세요. 수정 완료후에는 재로그인이 필요합니다.</p>
			<div>
				<label>NickName<span class="small">닉네임</span></label>
				<input type="text" name="nickname" id="nickname" value="<%=memberDto.getMember_name()%>" />
				<label>Password<span class="small">패스워드</span></label>
				<input type="password" name="password1" id="password1" value="" />
				<label>Password<span class="small">패스워드 확인</span></label>
				<input type="password" name="password2" id="password2" value="" />
				<label>Phone <span class="small">전화번호</span></label>
				<input type="text" name="phone" id="phone" value="<%=memberDto.getMember_phone()%>" />
				<label>Email<span class="small">이메일주소</span></label>
				<input type="text" name="email" id="email" value="<%=memberDto.getMember_email()%>" />
			</div>
			<div>
				<button type="submit" id="submit">수정하기</button>
				<button type="button" onclick="window.history.go(-1); return false;">뒤로가기
				</button>
				<div class="spacer"></div>
			</div>
		</form>
	</div>
	<br />
	<br />
	<%@ include file="/form/footer.jsp"%>
</body>
</html>