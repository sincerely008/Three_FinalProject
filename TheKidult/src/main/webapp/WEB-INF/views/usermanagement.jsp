<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<%
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-control", "no-store");
	response.setHeader("Expires", "0");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"">
<title>Insert title here</title>
<script src="js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
function enabled(){
	var change="이 회원의 이용여부를 변경 하시겠습니까?";
	var flag = confirm(change);
	var bung = $(this).attr('.enabled').attr('value');
	alert(bung);
	flag;
	if(flag==true){
		location.href="roleupdate.do?enabled="+bung +"&id="+$('.id').attr('value');
	}
};

</script>
</head>
<body>

	<h1>회원 목록</h1>

	<table border="1">
		<col width="200px"/>
		<col width="100px"/>
		<c:choose>
			<c:when test="${empty list }">
				<tr>
					<td><h3>고객 정보가 없습니다.</h3></td>
				</tr>
			</c:when>
			<c:otherwise>
				<tr>
					<th>ID</th>
					<th>PW</th>
					<th>이름</th>
					<th>생년월일</th>
					<th>주소</th>
					<th>전화번호</th>
					<th>이메일</th>
					<th>이용여부</th>
					<th>성별</th>
					<th>권한</th>
					<th>kakao연동 여부</th>
					<th>가입일</th>
					<th>마지막 접속일</th>
				</tr>
				<c:forEach items="${list }" var="dto">
					<tr>
						<td class="id" value="${dto.member_id}">${dto.member_id}</td>
						<td>${dto.member_pw}</td>
						<td>${dto.member_name}</td>
						<td>${dto.member_birth}</td>
						<td>${dto.member_addr}</td>
						<td>${dto.member_phone}</td>
						<td>${dto.member_email}</td>
						<td><a class="enabled" href="javascript:;" onclick="enabled($(this)attr('value'));" value="${dto.member_enabled}">${dto.member_enabled}</a></td>
						<td>${dto.member_gender}</td>
						<td>${dto.member_role}</td>
						<td>${dto.member_kakao}</td>
						<td>${dto.member_regdate}</td>
						<td>${dto.member_pwevent}</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
</body>
</html>