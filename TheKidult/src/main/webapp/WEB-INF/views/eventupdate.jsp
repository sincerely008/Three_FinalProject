<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <% request.setCharacterEncoding("UTF-8"); %>
    <% response.setContentType("text/html; charset=UTF-8"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

	function viewClose(){
		opener.location.reload();
		close();
	}
</script>

</head>
<body>
	
		<form action="fullUpdateRes.go" method="post">
		<input type="hidden" name="fullid" value="${dto.fullid }">
		<table border="1">
			<tr>
				<th>제목</th>
				<td><input type="text" name="fulltitle" value="${dto.fulltitle }"></td>
			</tr>
			<tr>
				<th>시작</th>
				<td><input type="date" name="fullstart" value="${dto.fullstart }"></td>
			</tr>
			<tr>
				<th>끝</th>
				<td><input type="date" name="fullend" value="${dto.fullend }"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="10" cols="60" name="fulldescription">${dto.fulldescription }</textarea></td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="수정">
					<input type="button" value="취소" onclick="viewClose();">
				</td>
			</tr>
		</table>
	</form>
	
	
</body>
</html>