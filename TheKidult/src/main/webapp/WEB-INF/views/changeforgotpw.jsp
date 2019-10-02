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
	function popupClose(){
		close();
	}
</script>
</head>
<body>

	<h1>비밀번호 변경 완료</h1>
	<a>비밀번호가 변경되었습니다. 다시 로그인 해주세요.</a><br>
	<input type="button" value="닫기" onclick="popupClose()">

</body>
</html>