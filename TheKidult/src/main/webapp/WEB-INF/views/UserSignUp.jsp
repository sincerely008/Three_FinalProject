<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<link href="resources/css/loginform.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src="resources/js/loginform.js"></script>

<style type="text/css">
a {
	color: white;
}
</style>
</head>
<body>
	<div id="style" class="myform">
		<form action="login.do" id="form" name="form" method="post">
			<input type="hidden" name="command" value="signupres">
			<h1>회원가입</h1>
			<p>모두 입력해 주세요.</p>

			<label>ID <span class="small">아이디 입력</span>
			</label> <input type="text" name="id" id="id" />
			<input type="button" onclick="idchk()" id="chk0" class="chk" value="중복체크" />

			<label>Name <span class="small">이름 입력</span></label>
			<input type="text" name="name" id="name" />
			
			<label>NickName<span class="small">닉네임 입력</span></label>
			<input type="text" name="nickname" id="nickname" />
			
			<input type="button" onclick="nicknamechk()" id="chk1" class="chk" value="닉네임중복체크" />

			<label>Password <span class="small">패스워드 9자이상</span></label>
			<input type="password" name="password" id="password" />
			
			<label>Password<span class="small">패스워드 확인</span></label>
			<input type="password" name="password1" id="password1" />
			
			<label>sex<span class="small">성별</span>	</label>
			<select name="sex" id="sex" >
				<option selected="selected">선택하세요</option>
				<option value="M">남자</option>
				<option value="F">여자</option>
				<option value="X">X</option>			
			</select>
			
			<label>age <span class="small">나이대 선택</span></label>
			<select name="age" id="age" >
				<option value="100">100이상</option>
				<option value="90">90대</option>
				<option value="80">80대</option>
				<option value="70">70대</option>
				<option value="60">60대</option>
				<option value="50">50대</option>
				<option value="40">40대</option>
				<option value="30">30대</option>
				<option selected="selected" value="20" >20대</option>
				<option value="10">10대</option>			
			</select>
			
			<label>Phone <span class="small">전화번호 입력</span></label>
			<input type="text" name="phone" id="phone" />
			
			<label>Email<span class="small">이메일주소</span></label>
			<input type="text" name="email" id="email" />
			
			<input type="button" id="chk2" class="chk" value="이메일인증" onclick="EmailCheckgo()" />
			
			<label><a></a></label>
			<input type="text" name="EmailCheck" id="EmailCheck" placeholder="입력하고 오른쪽 위 버튼을 눌러주세요." />

			<button class="ck1" type="submit" id="submit">회원가입 완료</button>
			<br />
			<br />
			<button class="ck1" type="button" onclick="location.href='UserLogin.do'">뒤로가기</button>
			<div class="spacer"></div>

		</form>
	</div>
	<br/><br/><br/><br/><br/><br/><br/>
	<%@ include file="/form/footer.jsp"%>
</body>
<style>
	#EmailCheck{
		display: none;
	}
	
	label:last-child {
		display: none;
	}
</style>
<script type="text/javascript">
	function EmailCheckgo() {
		$("#chk2").val("전송중...");
		$("#chk2").attr('disabled', true);
		var email = $("#email").val();
		 $.ajax({
             type : "post",
             url : "emailCheck.do?command=SendMail",
            data:{"email":email},
             datatype : "int",
             success : function(data) {
                alert("메일이 보내졌습니다.");
                $("#chk2").attr('disabled', false);
                $("#chk2").attr('onclick', 'confrom()');
                $("#chk2").val("인증하기");
                $("label:last a").text("인증번호");
                $("#EmailCheck").show();
                $("label:last").show();
				codenum=data;
				
             },
			error:function(request,status,error){
				alert("실패했습니다. 챗봇에 문의해 보세요.");
				$("#chk2").attr('disabled', true);
			}
         });
	}
	function confrom(){
		var code = $("#EmailCheck").val();
		if(codenum.indexOf(code)==0){
			alert("인증되었습니다.");
		} else {
			alert("문자가 다릅니다.");
		}
	}
</script>
</html>