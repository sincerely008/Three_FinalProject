<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Home</title>
</head>
<script type="text/javascript">
	
</script>
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
	width: calc(25% - 1.5px);
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
	color: #cccccc;
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
	color: black;
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
	height: 600px;
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
	width: 95%;
	height: 190px;
	margin: 0 auto;
	border: solid 1px;
}

.section2div2div2div1divdiv2 {
	width: 95%;
	height: 30px;
	text-align: center;
	magin-top: 5px;
}

.section2div2div2div1divdiv3 {
	width: 95%;
	height: 160px;
	margin: 0 auto;
	text-align: center;
	overflow: hidden;
}
</style>
</head>
<body>


	<header class="header">
		<div class="headerunderdiv">
			<div class="headerdiv1">
				<div class="headerdiv1div">
					<div class="headerdiv1divdiv">
						<div class="headerdivwrapa">
							<a href="pagemoving.do?command=musichome" class="headerdiv1a">
								<!-- 홈으로 링크 --> <img alt="Kidult"
								src="resources/images/kidult.jpg" width="200px" height="100px">
							</a>
						</div>

						<div class="logindiv" style="float: right;">
							<div class="logindivdiv" style="margin-top: -30px;">

								<button onclick="location.href='UserLogin.jsp'"
									class="logindivdivbtn">로그인</button>
								<button onclick="location.href='UserSignUp.jsp'"
									class="logindivdivbtn">회원가입</button>



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
							</ul>
						</li>
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
				<
			</div>
		</div>
	</header>
	<section class="section2">
		<div class="section2div1">
			<div class="section2div1div">
				<span> </span>
			</div>
		</div>
		<div class="section2div2">
			<div class="section2div2div1">
				<div class="section2div2div1div">
					<span> 인기 아이템 Top10 </span>
				</div>
			</div>
			<div class="section2div2div2">
				<div class="section2div2div2div1">
					<div class="section2div2div2div1div">
						<div class="section2div2div2div1divdiv1">
							<img src="" alt="HOT1" />
						</div>
						<div class="section2div2div2div1divdiv2">
							<span>11</span>
						</div>
					</div>
					<div class="section2div2div2div1div">
						<div class="section2div2div2div1divdiv1">
							<img src="" alt="HOT2" />
						</div>
						<div class="section2div2div2div1divdiv2">
							<span>12</span>
						</div>
					</div>
					<div class="section2div2div2div1div">
						<div class="section2div2div2div1divdiv1">
							<img src="" alt="HOT3" />
						</div>
						<div class="section2div2div2div1divdiv2">
							<span>13</span>
						</div>
					</div>
					<div class="section2div2div2div1div">
						<div class="section2div2div2div1divdiv1">
							<img src="" alt="HOT4" />
						</div>
						<div class="section2div2div2div1divdiv2">
							<span>14</span>
						</div>
					</div>
					<div class="section2div2div2div1div">
						<div class="section2div2div2div1divdiv1">
							<img src="" alt="HOT5" />
						</div>
						<div class="section2div2div2div1divdiv2">
							<span>15</span>
						</div>
					</div>
				</div>
				<div class="section2div2div2div1">
					<div class="section2div2div2div1div">
						<div class="section2div2div2div1divdiv1">
							<img src="" alt="HOT6" />
						</div>
						<div class="section2div2div2div1divdiv2">
							<span>16</span>
						</div>
					</div>
					<div class="section2div2div2div1div">
						<div class="section2div2div2div1divdiv1">
							<img src="" alt="HOT7" />
						</div>
						<div class="section2div2div2div1divdiv2">
							<span>17</span>
						</div>
					</div>
					<div class="section2div2div2div1div">
						<div class="section2div2div2div1divdiv1">
							<img src="" alt="HOT8" />
						</div>
						<div class="section2div2div2div1divdiv2">
							<span>18</span>
						</div>
					</div>
					<div class="section2div2div2div1div">
						<div class="section2div2div2div1divdiv1">
							<img src="" alt="HOT9" />
						</div>
						<div class="section2div2div2div1divdiv2">
							<span>19</span>
						</div>
					</div>
					<div class="section2div2div2div1div">
						<div class="section2div2div2div1divdiv1">
							<img src="" alt="HOT10" />
						</div>
						<div class="section2div2div2div1divdiv2">
							<span>10</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<input id="throwmusic" type="hidden" value="123" />
</body>
</html>
</body>
</html>