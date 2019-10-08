<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-control", "no-store");
	response.setHeader("Expires", "0");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function forgotclose(){
		close();
	}
	function forgotPw(){
		location.href="forgotpw.do";
	}
</script>
</head>
<body>

	<h1>아이디 찾기 진행 후..</h1>
	<div>
		<c:choose>
			<c:when test="${empty dto }">
				<td>해당하는 아이디가 없습니다.</td>
			</c:when>
			<c:otherwise>
				<td>아이디 : ${dto.member_id }</td><br>
				<a href="javascript:forgotPw()">비밀번호를 찾으시겠습니까?</a><br>
			</c:otherwise>
		</c:choose>
		<input type="button" value="닫기" onclick="forgotclose()">
	</div>
	

</body>
</html>