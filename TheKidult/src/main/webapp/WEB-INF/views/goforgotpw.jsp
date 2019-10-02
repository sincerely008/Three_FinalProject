<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-control", "no-store");
	response.setHeader("Expires", "0");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	function forgotclose() {
		close();
	}
	
	function check(){
		if(pwchk.password.value == null || pwchk.password.value == ""){
			$("#pwSapn").html("비밀번호를 입력해 주세요.");
			pwchk.password.focus();
			return false;
		}else if(pwchk.password.value == pwchk.pwConfirm.value){
			
			return true;
		}else{
			$("#pwSapn").html("비밀번호를 확인해 주세요.");
			pwchk.pwConfirm.focus();
			
			return false;
		}
	}
</script>
</head>
<body>

	<h1>비밀번호 찾기 진행 후..</h1>
	<div>
		<c:choose>
			<c:when test="${empty dto }">
				<td>해당하는 아이디가 없습니다.</td>
			</c:when>
			<c:otherwise>
				<form onsubmit="return check()" name="pwchk" action="changeforgotpw.do" method="POST">
					<table>
						<tr>
							<td>
								<input type="hidden" name="id" value="${dto.member_id }">
							</td>
						</tr>
						<tr>
							<th>새 비밀번호</th>
							<td><input type="password" name="password"></td>
						</tr>
						<tr>
							<th>새 비밀번호 확인</th>
							<td>
								<input type="password" name="pwConfirm">
								<span id="pwSapn"></span>
							</td>
						</tr>
						<tr>
							<td><input type="submit" value="확인"></td>
						</tr>
					</table>
				</form>
			</c:otherwise>
		</c:choose>
		<input type="button" value="닫기" onclick="forgotclose()">
	</div>


</body>
</html>