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
	function pwcancle(){
		close();
	}
	function forgotid(){
		location.href="forgotid.do";
	}
	
	function check(){
		if(chk.id.value == null || chk.id.value == ""){
			alert("아이디를 입력해주세요.");
			chk.id.focus();
			return false;
		}else if(chk.name.value == null || chk.name.value == ""){
			alert("이름을 입력해주세요.");
			chk.name.focus();
			return false;
		}else if(chk.email.value == null || chk.email.value == ""){
			alert("이메일을 입력해주세요.");
			chk.email.focus();
			return false;
		}else{
			return true;
		}
	}
</script>
</head>
<body>

	<h1>비밀번호 찾기</h1>
	
	<form action="goforgotpw.do" method="POST" name="chk" onsubmit="return check()">
		<table>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<th><input type="text" name="email"></th>
			</tr>
			<tr>
				<td colspan="2"><a href="javascript:forgotid()">아이디를 찾으시겠습니까?</a></td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="찾기">
					<input type="button" value="취소" onclick="pwcancle()">
				</td>
			</tr>
		</table>
	</form>

</body>
</html>