<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

$(function(){
	$("#send").click(function(){
		var note_send = $("#sender").val();
		var note_get = $("#get").val();
		var note_contet = $("#content").val();
	
		location.href='/notesend.do?note_send='+note_send+'&note_get='+note_get+'&note_content='+note_content;
	})
});

</script>
</head>
<body>
<div>
	<table>
		<tr>
			<th>보내는 사람</th>
			<td>
				<input type="text" id="sender" />
			</td>
		</tr>
		<tr>
			<th>받는 사람</th>
			<td>
				<input type="text" id="get" />
			</td>
		</tr>
		<tr>
			<th>내	용</th>
			<td>
				<textarea id="content" rows="10" cols="40"></textarea>
			</td>
		</tr>
		<input type="button" id="send" value="보내기" />
	</table>
</div>
</body>
</html>