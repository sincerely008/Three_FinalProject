
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script src="js/jquery-3.4.1.min.js"></script>
<script src="js/signup.js"></script>
<link href="resources/css/loginform.css" rel="stylesheet" type="text/css">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<script type="text/javascript">
history.go(1);
</script>
<style type="text/css">
.h1{

}

</style>
</head>
<body>
<header>
<%@ include file="/form/header.jsp"%>
</header>

	<div id="style" class="myform">
	<h1>회원가입</h1>
	
	<form action="signupres.do" method="post" onsubmit="return check();" id="sign">
		<table>
			<c:choose>
			
				<c:when test="${dto eq null }">
					<tr>
						<th>아이디</th>
						<td>
							<input type="text" name="id">
							<span id="idchkSapn"></span>
						</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="password"></td>
					</tr>
					<tr>
						<th>비밀번호 확인</th>
						<td>
							<input type="password" name="pwConfirm">
							<span id="pwSapn"></span>
						</td>
					</tr>
				</c:when>
				<c:otherwise>
					<tr>
						<td>
							<input type="hidden" name="id" value="${dto.member_id }">
							<input type="hidden" name="password" value="${dto.member_id }">
							<input type="hidden" name="pwConfirm" value="${dto.member_id }">
						</td>
					</tr>
				</c:otherwise>
			</c:choose>
				<tr>
					<th>이름</th>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td><input type="date" name="birth"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td>
						<input type="text" name="addr1" placeholder="주소찾기 버튼을 눌러주세요." readonly="readonly">
						<input type="button" value="주소찾기" onclick="searchAddr()">
					</td>
				</tr>
				<tr>
					<th>상세주소</th>
					<td>
						<input type="text" name="addr2" placeholder="상세주소">
					</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>
						<input type="text" name="phone1" maxlength="3"> -
						<input type="text" name="phone2" maxlength="4"> -
						<input type="text" name="phone3" maxlength="4">
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
					<c:choose>
						<c:when test="${emailFront ne null }">
							<input type="text" name="emailFront" value="${emailFront }"> @
							<input type="text" name="emailBack" id="emailBack" value="${emailBack }">
						</c:when>
						<c:otherwise>
							<input type="text" name="emailFront"> @
							<input type="text" name="emailBack" id="emailBack">
						</c:otherwise>
					</c:choose>
						<select id="emailselect" name="emailselect">
							<option selected="selected" value="self">직접 입력</option>
							<option value="naver.com">naver.com</option>
							<option value="hanmail.net">hanmail.net</option>
							<option value="nate.com">nate.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="hotmail.com">hotmail.com</option>
							<option value="lycos.co.kr">lycos.co.kr</option>
							<option value="empal.com">empal.com</option>
							<option value="korea.com">korea.com</option>
						</select>
						<input type="button" value="인증받기" onclick="emailChk()">
						<span id="emailSpan"></span>
					</td>
				</tr>
				<tr>
					<th>인증번호</th>
					<td>
						<input type="text" name="emailConfirm">
						<input type="button" value="확인" onclick="emailCon()">
						<span id="emailConSpan"></span>
					</td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
						<select name="gender">
							<option value="Man" selected="selected">남성</option>
							<option value="Woman">여성</option>
						</select>
					</td>
				</tr>
			</table>
		<table>
				<tr>
					<td>
						<input type="submit" value="가입하기" id="insertsign" style="display: none">
						<input type="button" value="취소" onclick="location.replace('UserLogin.do')"> 
					</td>
				</tr>
		</table>
	</form>
</div>
<br/><br/><br/><br/><br/><br/><br/>
<%@ include file="/form/footer.jsp"%>
</html>