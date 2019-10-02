<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<<<<<<< HEAD
<style type="text/css">
#data{
border: 1px solid gray;
width: 250px; 
height: 300px;
}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js">" ></script>
<script type="text/javascript">

	$(document).ready(function() {
		$("#sendBtn").click(function() {
			sendMessage();
			moveScroll();
		});
	});
	
	function moveScroll() {
		var divdiv = document.getElementById("data");
		divdiv.scrollTop=divdiv.scrollHeight;
	}

	var ws = new SockJS("<c:url value="/echo" />");

	ws.onmessage = onMessage;

	ws.onclose = onClose;

	function sendMessage() {
		ws.send($("#message").val());
	}

	function onMessage(evt) {
		var data = evt.data;
		$("#data").append(data + "<br/>");
	}

	function onClose(evt) {
		$("#data").append("서버가 닫혀 있습니다.");
=======
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
>>>>>>> refs/heads/master
	}
</script>
</head>
<body>

	<h1>시작</h1>
	<a href="product.do">게시판</a><br>
	<a href="crud.do">crud</a><br>
	<a href="signup.do">회원가입</a><br>
<<<<<<< HEAD
	<a href="home.do">ㅇ</a></br>
	
	<input type="text" id="message" />
	<input type="button" id="sendBtn" value="전송" />
	<div id="data" style="overflow:auto;"></div>
	
=======
	<a href="javascript:forgotId()">아이디 찾기</a><br>
	<a href="javascript:forgotPw()">비밀번호 찾기</a><br>
	<a href="home.do">ㅇ</a>

>>>>>>> refs/heads/master

</body>
</html>