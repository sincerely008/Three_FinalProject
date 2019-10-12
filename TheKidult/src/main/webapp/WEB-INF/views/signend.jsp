<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-control", "no-store");
	response.setHeader("Expires", "0");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

	<h1>회원가입 완료</h1>
	이제 서비스를 이용할 수 있습니다
	<input type="button" value="메인으로" onclick="location.href='home.do'">
	<input type="button" value="로그인 페이지" onclick="location.href='UserLogin.do'"> <!-- 로그인 페이지 완료 후 링크 입력 -->

</body>
</html>