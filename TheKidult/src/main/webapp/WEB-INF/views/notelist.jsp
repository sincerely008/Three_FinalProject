<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.three.kidult.dto.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>쪽지함</h3>
	
	<table border="1">
		<col width="100px">
		<col width="100px">
		<tr>
			<th>번호</th>
			<th>보낸사람</th>
			<th>내용</th>
			<th>보낸날짜</th>
		</tr>
		<c:choose>
			<c:when test="${empty list}">
				<tr>
					<td colspan="4">쪽지가 없습니다.</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list}" var="dto">
					<tr>
						<td>${list.note_no}</td>
						<td>${list.note_send}</td>
						<td><a href="noteselect.do?">${list.note_content}</a></td>
						<td>${list.note_date}</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<tr>
			<td colspan="4">
				<input type="button" onclick="location.href='notesendform.do?note_send=<%=ChattingDto.getChatting_user() %>'" value="쪽지 보내기" />
			</td>
		</tr>
	</table>
</body>
</html>