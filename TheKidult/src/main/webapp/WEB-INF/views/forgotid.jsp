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
<script type="text/javascript">
	function idcancle(){
		close();
	}
</script>
</head>
<body>

	<h1>ID 찾기</h1>
	
	<form action="goforgotid.do" method="POST">
		<table>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" name="email"></td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="찾기">
					<input type="button" value="취소" onclick="idcancle()">
				</td>
			</tr>
		</table>
	</form>

</body>
</html>