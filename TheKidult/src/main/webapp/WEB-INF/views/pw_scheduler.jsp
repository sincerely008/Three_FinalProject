<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>비밀번호를 변경해주세요.</h1>
	
	<form action="pwchange.do">
		<table>
			<tr>
				<th>현제 비밀번호</th>
				<td><input type="password" id="nowpassword" name="nowpassword"></td>
			</tr>
			<tr>
				<th>새로운 비밀번호</th>
				<td><input type="password" id="newpassword" name="newpassword"></td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td><input type="password" id="passwordcheck" name="passwordcheck"></td>
			</tr>
			<tr>
				<td><input type="submit" value="변경하기"></td>
				<td><input type="button" value="나중에 하기" onclick="location.href=''"></td>
				<td><input type="button" value="하루 뒤에 변경하기" onclick="location.href=''"></td>
			</tr>
		</table>
	</form>

</body>
</html>