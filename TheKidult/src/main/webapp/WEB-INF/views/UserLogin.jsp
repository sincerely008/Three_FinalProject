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
<script src="js/jquery-3.4.1.min.js"></script>
<link href="resources/css/index.css" rel="stylesheet" type="text/css">



<style type="text/css">

.ir{
	color:white;
	 background: rgba(241, 242, 181, 1);
  background: -moz-radial-gradient(center, ellipse cover, rgba(255, 255, 255, 1) 0%, rgba(19, 80, 88, 1) 100%);
  background: -webkit-gradient(radial, center center, 0px, center center, 100%, color-stop(0%, rgba(255, 255, 255, 1)), color-stop(100%, rgba(19, 80, 88, 1)));
  background: -webkit-radial-gradient(center, ellipse cover, rgba(255, 255, 255, 1) 0%, rgba(19, 80, 88, 1) 100%);
  background: -o-radial-gradient(center, ellipse cover, rgba(255, 255, 255, 1) 0%, rgba(19, 80, 88, 1) 100%);
  background: -ms-radial-gradient(center, ellipse cover, rgba(255, 255, 255, 1) 0%, rgba(19, 80, 88, 1) 100%);
  background: radial-gradient(ellipse at center, rgba(255, 255, 255, 1) 0%, rgba(19, 80, 88, 1) 100%);
  filter: progid: DXImageTransform.Microsoft.gradient( startColorstr='#f1f2b5', endColorstr='#135058', GradientType=1);

	font-size:21px;
}
.login_box{
}

</style>
</head>
<body class="login">
<div id="particles-js">
</div>
	<div class="con">
		<form action="login.do" method="post">
			<div class="login">
				<h1>LOGIN</h1>
			</div>
			<div class="input_box">
				<div>
					<input type="text" placeholder="ID" name="id"> <input type="password"
						placeholder="PASSWORD" name="password">
				</div>
			</div>
			<div class="login_box" style="margin-bottom: 15px;">
				<div>
				<input type="submit" class="ir" value="로그인"><br/>
				</div>
			</div>
		</form>
		<div>
			<div>
				<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

				<a id="kakao-login-btn"></a> 
<a href="http://developers.kakao.com/logout"></a>
	<script type='text/javascript'>
	
Kakao.init('8e6d53d7202906065b4fa4f403a2bee0');

	Kakao.Auth.createLoginButton({
	container : '#kakao-login-btn',
	success : function(authObj) {
	Kakao.API.request({

		url: '/v2/user/me',

		success: function(res) {
			   
			location.href="login.do?command=snslogin&id="+res.properties['nickname'];
      
		}
	})

},fail : function(err) {alert("로그인 실패 했습니다. 고객센터에 문의해 주세요.");}});

				</script>
			</div>
		</div>
		<div class="sub">
			<ul>
				<li><a href="#" onclick="window.open('forgotid.do','searchid','width=456, height=510')">아이디 찾기</a></li>
				<li><a href="#" onclick="window.open('forgotpw.do','searchpassword','width=456, height=510')">비밀번호 찾기</a></li>
				<li><a href="#" onclick="location.href='signup.do'">회원가입</a></li>

			</ul>
		</div>
	</div>
	<br />
	<%@ include file="/form/footer.jsp"%>
</body>

</html>