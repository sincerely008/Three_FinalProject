<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		$(document).ready(function(){
			$('select[name=emailselect]').change(function(){
				if($(this).val()=="1"){
					$('.emailBack').val("");
				}else{
					$('.emailBack').val($(this).val());
					$(".emailBack").attr("readonly", true);
				}
			});
		});
	});
</script>
</head>
<body>

	<h1>회원가입</h1>
	
	<form action="">
		<table>
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
					<input type="text" name="emailFront"> @
					<input type="text" name="emailBack" class="emailBack">
					<select id="emailselect" name="emailselect">
						<option selected="selected" value="1">직접 입력</option>
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
						<option value="man" selected="selected">남성</option>
						<option value="woman">여성</option>
					</select>
				</td>
			</tr>
		</table>
	</form>

</body>
</html>