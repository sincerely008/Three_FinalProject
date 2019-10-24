<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#data{
border: 1px solid gray;
width: 250px; 
height: 300px;
}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
<script type="text/javascript">

	var ws = new SockJS("<c:url value="/echo" />");

	ws.onmessage = onMessage;

	ws.onclose = onClose;

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
	
	function sendMessage() {
		ws.send($("#message").val());
	}

	function onMessage(evt) {
		var data = evt.data;
		$("#data").append(data + "<br/>");
	}

	function onClose(evt) {
		$("#data").append("서버가 닫혀 있습니다.");
	}
	
</script>
</head>
<body>

	<table>
		<input type="text" id="message" />
		<input type="button" id="sendBtn" value="전송" />
		<div id="data" style="overflow:auto;"></div>
	</table>
</body>
</html>