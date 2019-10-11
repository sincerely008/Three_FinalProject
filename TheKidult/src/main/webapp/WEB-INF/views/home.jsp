<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Home</title>

<script type="text/javascript">
	
</script>
<script src="js/jquery-3.4.1.min.js"></script>
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
.section2{
background-color: silver;
	background-image: linear-gradient(335deg, #eee 23px, transparent 23px),
	linear-gradient(155deg, #f2f2f2 23px, transparent 23px),
	linear-gradient(335deg, #eee 23px, transparent 23px),
	linear-gradient(155deg, #f2f2f2 23px, transparent 23px);
	background-size: 58px 58px;background-position: 0px 2px, 4px 35px, 29px 31px, 34px 6px}
}
*{ margin:0;padding:0;text-decoration:none}
li{list-style:none}

.gallery-wrapper{ position:relative; width:600px; top:100px;margin:0 auto;padding:10px; border:5px solid #ccc }
.gallery-wrapper .gallery-list{overflow:hidden;position:relative;width:100%;height:350px;}
.gallery-wrapper .gallery-list li{ position:absolute;left:0;display:none}
.gallery-wrapper .gallery-list li:first-child{display:block;}
.gallery-wrapper .gallery-list li.active{display:block;}
.gallery-wrapper .gallery-list li a{display:block;text-align: center}
.gallery-wrapper .gallery-list li a img {display:block;}

.gallery-wrapper .btn-prev,.gallery-wrapper .btn-next { position:absolute;top:160px;color: #f4e9ed; font-size: 26px;}
.gallery-wrapper .btn-prev { left:20px;}
.gallery-wrapper .btn-next { right:20px;}
.ctrl-box {margin-top:15px;text-align:center;}
.ctrl-box a { }
.ctrl-box a .bullet {display:inline-block; width: 12px; height: 12px;border:1px solid #cfd2d7;border-radius:100%;background:#dfe2e7; text-indent: -9999em; font-size: 0;vertical-align: middle}
.ctrl-box a.active .bullet {
	border: 1px solid #d43a3a;
	background: #fd4b4b;
}
.btn-ctrl {
	margin-left: 10px;
	padding: 0 4px;
	border: 1px solid #b6b6b6;
	border-radius: 4px;
	background-color: #dadada;
	line-height: 20px;
}
</style>
</head>
<body>
<header>
<%@ include file="/form/header.jsp"%>
</header>
		<div id="slider01" class="gallery-wrapper">
	<ul class="gallery-list">
		<li><a href="#none"><img src=http://willywillytoy.com/shop/data/category/goods_list/018_b3.png alt="" /></a></li>
		<li><a href="#none"><img src=http://willywillytoy.com/shop/data/category/goods_list/019_b3.png alt="" /></a></li>
		<li><a href="#none"><img src=http://willywillytoy.com/shop/data/category/goods_list/002_b3.png alt="" /></a></li>
		<li><a href="#none"><img src=http://willywillytoy.com/shop/data/category/goods_list/016_b3.png alt="" /></a></li>
		<li><a href="#none"><img src=http://willywillytoy.com/shop/data/category/goods_list/006_b3.png alt="" /></a></li>
	</ul>
	<a class="btn-prev" href="#none">◀ prev</a>
	<a class="btn-next" href="#none">next ▶</a>
	
	<div class="ctrl-box">
		<a href="#none" class="active"><i class="bullet">1</i></a>
		<a href="#none"><i class="bullet">2</i></a>
		<a href="#none"><i class="bullet">3</i></a>
		<a href="#none"><i class="bullet">4</i></a>
		<a href="#none"><i class="bullet">5</i></a>
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
							<img src="resources/images/hot1.jpg" alt="HOT1" width="100%" height="100%" />
						</div>
						<div class="section2div2div2div1divdiv2">
							<span>이름 / 가격</span>
						</div>
					</div>
					<div class="section2div2div2div1div">
						<div class="section2div2div2div1divdiv1">
							<img src="resources/images/hot2.jpg" alt="HOT2" width="100%" height="100%" />
						</div>
						<div class="section2div2div2div1divdiv2">
							<span>이름 / 가격</span>
						</div>
					</div>
					<div class="section2div2div2div1div">
						<div class="section2div2div2div1divdiv1">
							<img src="resources/images/hot3.jpg" alt="HOT3" width="100%" height="100%" />
						</div>
						<div class="section2div2div2div1divdiv2">
							<span>이름 / 가격</span>
						</div>
					</div>
					<div class="section2div2div2div1div">
						<div class="section2div2div2div1divdiv1">
							<img src="resources/images/hot4.jpg" alt="HOT4" width="100%" height="100%" />
						</div>
						<div class="section2div2div2div1divdiv2">
							<span>이름 / 가격</span>
						</div>
					</div>
					<div class="section2div2div2div1div">
						<div class="section2div2div2div1divdiv1">
							<img src="resources/images/hot5.jpg" alt="HOT5" width="100%" height="100%" />
						</div>
						<div class="section2div2div2div1divdiv2">
							<span>이름 / 가격</span>
						</div>
					</div>
				</div>
				<div class="section2div2div2div1">
					<div class="section2div2div2div1div">
						<div class="section2div2div2div1divdiv1">
							<img src="resources/images/hot6.jpg" alt="HOT6" width="100%" height="100%" />
						</div>
						<div class="section2div2div2div1divdiv2">
							<span>이름 / 가격</span>
						</div>
					</div>
					<div class="section2div2div2div1div">
						<div class="section2div2div2div1divdiv1">
							<img src="resources/images/hot7.jpg" alt="HOT7" width="100%" height="100%" />
						</div>
						<div class="section2div2div2div1divdiv2">
							<span>이름 / 가격</span>
						</div>
					</div>
					<div class="section2div2div2div1div">
						<div class="section2div2div2div1divdiv1">
							<img src="resources/images/hot8.jpg" alt="HOT8" width="100%" height="100%" />
						</div>
						<div class="section2div2div2div1divdiv2">
							<span>이름 / 가격</span>
						</div>
					</div>
					<div class="section2div2div2div1div">
						<div class="section2div2div2div1divdiv1">
							<img src="resources/images/hot9.jpg" alt="HOT9" width="100%" height="100%" />
						</div>
						<div class="section2div2div2div1divdiv2">
							<span>이름 / 가격</span>
						</div>
					</div>
					<div class="section2div2div2div1div">
						<div class="section2div2div2div1divdiv1">
							<img src="resources/images/hot10.jpg" alt="HOT10" width="100%" height="100%" />
						</div>
						<div class="section2div2div2div1divdiv2">
							<span>이름 / 가격</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<input id="throwmusic" type="hidden" value="123" />
	<%@ include file="/form/footer.jsp"%>
	
	<input type="text" id="message" />
	<input type="button" id="sendBtn" value="전송" />
	<div id="data" style="overflow:auto;"></div>
	
</body>
</html>
</body>
</html>