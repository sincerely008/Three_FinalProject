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

<c:choose>
	<c:when test="${!empty memberDto }">
		<script type="text/javascript">
			history.back();
		</script>
	</c:when>
	<c:otherwise>

<header>
<%@ include file="/form/header.jsp"%>
</header>
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

			<a href="https://kauth.kakao.com/oauth/authorize
						?client_id=0e2f445e50f3854d752de29fe5f4f3b6
						&redirect_uri=http://localhost:8787/kidult/kakaoLogin.do
						&response_type=code">
				<img alt="kakaoLogin" src="resources/images/kakao_account_login_btn_medium_narrow.png">
			</a>
			<a href="http://developers.kakao.com/logout"></a>
		<script type='text/javascript'>

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
	<br/>
	<%@ include file="/form/footer.jsp"%>
	</c:otherwise>
	</c:choose>
</body>

</html>