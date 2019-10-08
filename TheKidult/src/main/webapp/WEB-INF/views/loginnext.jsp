<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:choose>
		<c:when test="${not empty memberDto.member_kakao }">
			<h1>잘된건가?</h1>
		</c:when>
		<c:otherwise>
			<h1>잘 안됨</h1>
		</c:otherwise>
	</c:choose>

</body>
</html>