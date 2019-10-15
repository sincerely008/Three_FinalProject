<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<th>보낸사람</th>
			<td>
				<input type="text" id="sender" />
			</td>
		</tr>
		<tr>
			<th>내	용</th>
			<td>
				<textarea id="content" rows="10" cols="40"></textarea>
			</td>
		</tr>
		<tr>
			<th>보낸 날짜</th>
			<td>
				<input type="text" />
			</td>
		</tr>	
		<input type="button" id="delete" value="삭제" />
		<input type="button" id="back" value="뒤로가기" />
	</table>

</body>
</html>