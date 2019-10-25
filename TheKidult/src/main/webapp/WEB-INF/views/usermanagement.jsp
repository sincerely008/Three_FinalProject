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
<script type="text/javascript" src="https://d3js.org/d3.v4.min.js"></script>
<script src="js/ddd.js"></script>
<script type="text/javascript">

$(document).on("click", "a.enabled", function() {
    var bung = $(this).text();
    var id = $(this).parent().siblings('.id').children('.aid').text();
    if(confirm("이 회원의 이용여부를 변경 하시겠습니까?")) {
        location.href="roleupdate.do?enabled=" + bung + "&id=" + id;
    }
});

$(document).on("click", "a.aid", function(){
	var id = $(this).text();
	if(confirm("이 회원을 탈퇴 시키겠습니까?")){
		location.href="deleteid.do?id="+id;
	}
});

onload=function(){
	lineGraph.data = [122,1299,124,20];
	lineGraph.chartname = ['A제품','B제품','C제품','D제품'];
	lineGraph.width = 500;
	lineGraph.height = 300;
	lineGraph.display();
}
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
						<td class="id"><a class='aid' href="javascript:;" onclick="delete();" value="${dto.member_id}">${dto.member_id}</a></td>
						<td>${dto.member_pw}</td>
						<td>${dto.member_name}</td>
						<td>${dto.member_birth}</td>
						<td>${dto.member_addr}</td>
						<td>${dto.member_phone}</td>
						<td>${dto.member_email}</td>
						<td><a class="enabled" href="javascript:;" onclick="enabled();" value="${dto.member_enabled}">${dto.member_enabled}</a></td>
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
	<h4>아이디 클릭시 계정삭제 / 이용여부 클릭시 계정 잠금</h4>
<!-- D3 -->
		<div id="dddChart"></div>
</body>
</html>