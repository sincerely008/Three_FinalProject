<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function forgotId(){
		var url = "forgotid.do";
		var popOption = "width=370, height=360, resizable=no, scrollbars=no, status=no;";
		window.open(url,"",popOption);
	}
	
	function forgotPw(){
		var url = "forgotpw.do";
		var popOption = "width=370, height=360, resizable=no, scrollbars=no, status=no;";
		window.open(url,"",popOption);

	}
</script>
</head>
<body>

	<h1>시작</h1>
	<a href="product.do">게시판</a><br>
	<a href="crud.do">crud</a><br>
	<a href="signup.do">회원가입</a><br>
	<a href="chat.do">임시채팅방</a><br>
	<a href="javascript:forgotId()">아이디 찾기</a><br>
	<a href="javascript:forgotPw()">비밀번호 찾기</a><br>
	<a href="home.do">ㅇ</a>



</body>
</html>