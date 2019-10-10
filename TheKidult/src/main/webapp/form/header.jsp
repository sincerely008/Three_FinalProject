<%@page import="com.three.kidult.dto.MemberDto"%>
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
</head>
<%
	MemberDto memberDto = (MemberDto)session.getAttribute("memberDto");
%>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="resources/js/images.js"></script>
<style type="text/css">
* {
	padding: 0px;
	margin: 0px;
}

.header {
	width: 100%;
	height: 154px;
	font-family: "Goyang";
}

.headerdiv1 {
	width: 100%;
	height: 100px;
	margin: 0;
	font-family: "Exo", sans-serif;
	color: #fff;
	background: linear-gradient(-45deg, #ee7752, #e73c7e, #23a6d5, #23d5ab);
	background-size: 400% 400%;
	animation: gradientBG 15s ease infinite;
}

@keyframes gradientBG {
	0% {
		background-position: 0% 50%;
	}
	50% {
		background-position: 100% 50%;
	}
	100% {
		background-position: 0% 50%;
	}
}



.headerdiv2 {
	width: 100%;
	height: 50px;
	border-bottom: solid 2px;
	border-bottom-color: rgba(200, 200, 200, 0.5);
	border-top: solid 2px;
	border-top-color: rgba(200, 200, 200, 0.5);
	background: rgb(100, 100, 100);
		background: #46B8DF;
	background-image: -webkit-radial-gradient(center, circle cover, #049CCE, #0085B3);
	background-image: -moz-radial-gradient(center, circle cover, #049CCE, #0085B3);
	background-image: -o-radial-gradient(center, circle cover, #049CCE, #0085B3);
	background-image: radial-gradient(center, circle cover, #049CCE, #0085B3);
}

.headerdivwrapa {
	float: left;
	width: 20%;
	height: 100px;
	text-align: center;
	
}

.headerdiv1div {
	width: 70%;
	height: 150px;
	margin: 0 auto;
}

.headerdiv1divdiv {
	width: 100%;
	height: 96px;
}

.headerdiv2div a {
	padding: 2px 20px;
	margin: 10px;
	font-size: 15px;
	vertical-align: middle;
	font-family: "Goyang";
	font-weight: bold;
}

.headerdiv2div {
	width: 70%;
	margin: 0 auto;
	height: 50px;
	vertical-align: middle;
	display: flex;
}

.headerdiv2divul {
	list-style: none;
	width: 100%;
}

.headerdiv2divulli {
	float: left;
	width: calc(16.5% - 1.5px);
	height: 50px;
	text-align: center;
	border-left: 1px solid;
	border-left-color: rgba(200, 200, 200, 0.5);
	border-bottom: solid 2px;
	border-bottom-color: rgba(200, 200, 200, 0.5);
	position: relative;
}

.headerdiv2divullia {
	line-height: 50px;
	text-decoration: none;
	font-weight: bold;
	color: white;
}

.headerdiv2divulli:hover {
	background: rgb(80, 80, 80);
	transition: 0.5s;
}

.headerdiv2divulli:hover .headerdiv2divullia {
	color: #ffffff;
}

.headerdiv2divulli:hover .headerdiv2divulliul {
	display: block;
	z-index: 200;
	border-top: solid 2px;
	border-top-color: rgba(30, 110, 150, 0.5);
}

.headerdiv2divulliul li {
	list-style: none;
	width: 100%;
}

.headerunderdiv {
	width: 100%;
	height: 154px;
	margin: 0 auto;
}

.headerdiv2divulliul {
	display: none;
	background: rgb(100, 100, 100);
	width: 100%;
	line-height: 50px;
	position: absolute;
	z-index: 200;
}

.headerdiv2divulliul li {
	border-bottom: solid 2px;
	border-bottom-color: rgba(200, 200, 200, 0.5);
}

.headerdiv2divulliul>li a {
	text-decoration: none;
	font-weight: bold;
	color: #cccccc;
}

.headerdiv2divulliul li:hover {
	background: rgb(80, 80, 80);
	transition: 0.5s;
}

.headerdiv2divulliul li:hover>a {
	color: #ffffff;
}

.hedaerdiv3 {
	display: none;
	width: 100%;
	height: 300px;
}

#search {
	height: 30px;
	width: 95%;
	border: none;
	border-radius: 10px;
	padding: 5px;
}

#search:focus {
	outline: none;
}

.searchbar {
	padding: 30px;
	width: 45%;
}

.searchbardiv {
	display: flex;
	margin-left: 10px;
	width: 80%;
	margin: 0 auto;
	text-align: center;
}

.searchbardivbtn {
	width: 40px;
	height: 40px;
	background-color: rgba(200, 200, 200, 0.5);
	margin-left: 5px;
	border: none;
	border-radius: 10px;
}

.searchbardivbtn:hover {
	background-color: #B6B6B6;
	transition: .8s;
	cursor: pointer;
}

.searchbardivbtn:focus {
	outline: none;
}

.logindiv {
	padding-top: 35px;
	padding-right: 5px;
	width: 15%;
}

.logindivdiv {
	width: 80%;
	margin: 0 auto;
}

.logindivdivbtn {
	width: 100px;
	height: 30px;
	background-color: rgba(200, 200, 200, 0.5);
	margin-left: 15px;
	border: none;
	border-radius: 10px;
}

.logindivdivbtn:hover {
	background-color: #B6B6B6;
	transition: .8s;
	cursor: pointer;
}

.logindivdivbtn:focus {
	outline: none;
}

.section2 {
	width: 100%;
	height: 1500px;
}

.section2div1 {
	width: 70%;
	height: 600px;
	margin: 0 auto;
	background-image: url("images/braodcastpicture1.jpg");
	background-repeat: no-repeat;
	background-position: -400px;
	position: relative;
	overflow: hidden;
}

.section2div1div {
	width: 100%;
	height: 100px;
	color: white;
	font-size: 30px;
	text-align: center;
	padding-top: 50px;
	font-weight: bold;
}

.section2div2 {
	width: 70%;
	height: 600px;
	margin: 20px auto;
}

.section2div2div1 {
	width: 100%;
	height: 50px;
	color: red;
	font-size: 30px;
	text-align: center;
	padding-top: 10px;
	font-weight: bold;
	display: table;
}

.section2div2div1div {
	display: table-cell;
	vertical-align: middle;
	border-top: 2px groove gray;
	border-bottom: 2px double gray;
}

.section2div2div2 {
	width: 100%;
	height: 500px;
	margin: 20px auto;
}

.section2div2div2div1 {
	display: flex;
}

.section2div2div2div1div {
	display: flex-basis;
	width: calc(20% - 2px);;
	border: solid 1px;
}

.section2div2div2div1divdiv1 {
	width: 100%;
	height: 300px;
	margin: 0 auto;
	border: solid 1px;
}

.section2div2div2div1divdiv2 {
	width: 100%;
	height: 100px;
	text-align: center;
	magin-top: 5px;
	background-image: linear-gradient(-225deg, #E3FDF5 0%, #FFE6FA 100%);
	background-image: linear-gradient(to top, #a8edea 0%, #fed6e3 100%);	
	border: solid 1px;
}

.section2div2div2div1divdiv3 {
	width: 100%;
	height: 160px;
	margin: 0 auto;
	text-align: center;
	overflow: hidden;
}
</style>
<body>

	<header class="header">
		<div class="headerunderdiv">
			<div class="headerdiv1">
				<div class="headerdiv1div">
					<div class="headerdiv1divdiv">
						<div class="headerdivwrapa">
							<a onclick="location.href='home.do'" class="headerdiv1a">
								<!-- 홈으로 링크 --> <img alt="Kidult"
								src="resources/images/kidult.jpg" width="300px" height="100px">
							</a>
						</div>

						<div class="logindiv" style="float: right;">
							<div class="logindivdiv" style="margin-top: -30px;">
			
									<%
								if(memberDto == null) {
									%>
			
								<button onclick="location.href='UserLogin.do'"class="logindivdivbtn">
								로그인</button>
								<button onclick="location.href='signup.do'"class="logindivdivbtn">
								회원가입</button>

								     <%}else{ %>
						       		<div style ="font-size : 10px;">
									<%=memberDto.getMember_name()%>님 반갑습니다.  <br>
									</div>
									
									<%if(memberDto.getMember_enabled()!="N"){ %>
									<button onclick="location.href='pagemoving.do?command=userinformation'" class="logindivdivbtn">
     								내정보보기  
   							  		</button>
   							  		<%} %>
   							    	<button onclick="location.href='logout.do'" class="logindivdivbtn">
     								로그아웃
   							    	</button>
   							   <% }%>

							</div>
						</div>

						<div class="searchbar" style="float: right;">
							<div class="searchbardiv">
								<input type="text" id="search" type="text" placeholder="Search" />
								<button class="searchbardivbtn">
									<img src="resources/images/search.png" alt="대충 돋보기이미지"
										width="35px" height="35px" />
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>

			
			<div class="headerdiv2">
				<div class="headerdiv2div">
					<ul class="headerdiv2divul">
						<li class="headerdiv2divulli"
							onclick="location.href='pagemoving.do?command=musicgenre'">
							<a class="headerdiv2divullia"
							href="pagemoving.do?command=musicgenre"> 퍼즐/액세서리 </a>
							<ul class="headerdiv2divulliul">
								<li><a href="pagemoving.do?command=musicgenre"> 미니블럭 </a></li>
								<li><a href="pagemoving.do?command=musicalbumpopular">
										나노블럭</a></li>
										<li><a href="pagemoving.do?command=musicalbumpopular">
										큐브</a></li>
							</ul>
						</li>						
						<li class="headerdiv2divulli"
							onclick="location.href='pagemoving.do?command=broadcstingtop'">
							<a class="headerdiv2divullia"
							href="pagemoving.do?command=broadcstingtop"> 건프라/피규어 </a>
							<ul class="headerdiv2divulliul">
								<li><a href="pagemoving.do?command=broadcstingtop">
										건담(GUNDAM) </a></li>
								<li><a href="pagemoving.do?command=broadcstingrecommand">
										프라모델 </a></li>
								<li><a href="pagemoving.do?command=broadcstingnewest">
										피규어</a></li>
							</ul>
						</li>
						
						<li class="headerdiv2divulli"
							onclick="location.href='pagemoving.do?command=concerthallmain'">
							<a class="headerdiv2divullia"
							href="pagemoving.do?command=concerthallmain"> RC-드론/헬리콥터 </a>
							<ul class="headerdiv2divulliul">
								<li><a href="pagemoving.do?command=concerthallmain">
										입문용/고급용/실내용 </a></li>
								<li><a href="pagemoving.do?command=concerthallreservation">
										동영상촬영 </a></li>
										<li><a href="pagemoving.do?command=concerthallreservation">
										스마트드론 </a></li>
							</ul>
						</li>
							<li class="headerdiv2divulli"
							onclick="location.href='pagemoving.do?command=concerthallmain'">
							<a class="headerdiv2divullia"
							href="pagemoving.do?command=concerthallmain"> RC-자동차/바이크 </a>
							<ul class="headerdiv2divulliul">
								<li><a href="pagemoving.do?command=concerthallmain">
										입문용/고급용/실내용 </a></li>
								<li><a href="pagemoving.do?command=concerthallreservation">
										충전지타입 </a></li>
											<li><a href="pagemoving.do?command=concerthallreservation">
										바이크 </a></li>
							</ul>
						</li>
							
							<li class="headerdiv2divulli"
							onclick="location.href='pagemoving.do?command=concerthallmain'">
							<a class="headerdiv2divullia"
							href="pagemoving.do?command=concerthallmain"> RC-보트/요트 </a>
							<ul class="headerdiv2divulliul">
								<li><a href="pagemoving.do?command=concerthallmain">
										보트 </a></li>
								<li><a href="pagemoving.do?command=concerthallreservation">
										요트 </a></li>
											<li><a href="pagemoving.do?command=concerthallreservation">
										잠수함 </a></li>
							</ul>
						</li>
						<li class="headerdiv2divulli"
							style="border-right: 1px solid; border-right-color: rgba(200, 200, 200, 0.5);"
							onclick="location.href='pagemoving.do?command=servicecenter'">
							<a class="headerdiv2divullia"
							href="pagemoving.do?command=servicecenter">고객센터</a>
						</li>
				</ul>		
				
				</div>
				</div>
				
			</div>
	</header>

</body>
</html>