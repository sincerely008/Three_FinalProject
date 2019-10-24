<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
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

	<h1>중고 거래</h1>
	
	<table border="1">
		<c:choose>
			<c:when test="${empty list }">
				<tr>
					<td><h3>게시글이 없습니다.</h3></td>
				</tr>
			</c:when>
			<c:otherwise>
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>글쓴이</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
				<c:forEach items="${list }" var="dto">
					<tr>
						<td>${dto.usedproduct_no}</td>
						<td>${dto.usedproduct_title}</td>
						<td>${dto.product_stock}</td>
						<td>${dto.usedproduct_date}</td>
						<td>${dto.usedproduct_views}</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<tr>
			<td>
				<input type="button" value="글쓰기" onclick="location.href='aaaa'" />
			</td>
		</tr>
		<tr>
			<td>
				<select>
					<option value="">제목</option>
					<option value="">내용</option>
					<option value="">제목+내용</option>
					<option value="">글쓴이</option>
					<option value="">태그</option>
				</select>
				<input type="text" />
				<input type="button" value="검색" onclick="aa()" />
			</td>
		</tr>
	</table>

</body>
</html>