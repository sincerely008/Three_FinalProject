<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>

<title>Home</title>

<style type="text/css">	
	/* banner */
	.banner {position: relative; width: 700px; height: 500px; top: 50px;  margin:0 auto; padding:0; overflow: hidden;}
	.banner ul {position: absolute; margin: 0px; padding:0; list-style: none; }
	.banner ul li {float: left; width: 700px; height: 500px; margin:0; padding:0;}
	
	.fc-sat, .fc-sat > span {color: Blue;} /* 토요일 글자 blue */
	.fc-sun, .fc-sun > span{color: red;}	/* 일요일 글자 red  */
   
   body{
   	background-color: #f3f1ec;
   }
   td.fc-day.fc-today{
 	background: khaki;
   }
   .fc-content{
 	text-align: center;
   }
   
   
   .chart{
			display: inline-block;
			width: 25px;
			height: 75px;
			margin-right: 2px;
			background-color: red;
	} 
	
		#data{
border: 1px solid gray;
width: 250px; 
height: 300px;
background-color: white;
}
	
	#chat{
	position: fixed;
    bottom: 250;
    left: 10;
    width: 250px;

	}
	

 </style>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 <script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
 <script language="JavaScript">

 var ws = new SockJS("<c:url value="/echo" />");

	ws.onmessage = onMessage;

	ws.onclose = onClose;

	$(document).ready(function() {
		$("#sendBtn").click(function() {
			sendMessage();
			moveScroll();
		});
	});
	
	function moveScroll() {
		var divdiv = document.getElementById("data");
		divdiv.scrollTop=divdiv.scrollHeight;
	}
	
	function sendMessage() {
		ws.send($("#message").val());
	}

	function onMessage(evt) {
		var data = evt.data;
		$("#data").append(data + "<br/>");
	}

	function onClose(evt) {
		$("#data").append("서버가 닫혀 있습니다.");
	}

 
 
	$(document).ready(function() {
		var $banner = $(".banner").find("ul");

		var $bannerWidth = $banner.children().outerWidth();//이미지의 폭
		var $bannerHeight = $banner.children().outerHeight(); // 높이
		var $length = $banner.children().length;//이미지의 갯수
		var rollingId;

		//정해진 초마다 함수 실행
		rollingId = setInterval(function() { rollingStart(); }, 3000);//다음 이미지로 롤링 애니메이션 할 시간차
    
		function rollingStart() {
			$banner.css("width", $bannerWidth * $length + "px");
			$banner.css("height", $bannerHeight + "px");
			//alert(bannerHeight);
			//배너의 좌측 위치를 옮겨 준다.
			$banner.animate({left: - $bannerWidth + "px"}, 1500, function() { //숫자는 롤링 진행되는 시간이다.
				//첫번째 이미지를 마지막 끝에 복사(이동이 아니라 복사)해서 추가한다.
				$(this).append("<li>" + $(this).find("li:first").html() + "</li>");
				//뒤로 복사된 첫번재 이미지는 필요 없으니 삭제한다.
				$(this).find("li:first").remove();
				//다음 움직임을 위해서 배너 좌측의 위치값을 초기화 한다.
				$(this).css("left", 0);
				//이 과정을 반복하면서 계속 롤링하는 배너를 만들 수 있다.
			});
		}
	}); 

</script>
<script src="js/jquery-3.4.1.js"></script>
<link rel='stylesheet'  href='resources/css/fullcalendar.css'  />  
	<script src='https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/moment.min.js'></script>
	<script src='js/fullcalendar.js'></script>
	<script type="text/javascript" src="js/locale/ko.js"></script>

	
	<script type="text/javascript">
		
	
	$(function () {
		
		$('#calendar').fullCalendar({
			
			
		header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,listMonth'
        }
		,
		defaultDate: moment().format('YYYY-MM-DD')	
		,
		locale: 'ko'								
		,
		editable: true								
		,
		eventDurationEditable: true					
		,
		navLinks: true								
		,
		eventLimit: true							
		,
		allDaySlot: false							
		,
		contentHeight: 'auto'						
		,
		dayClick: function() {						
			
			window.open("uploadform.go","","left=600px,top=50px,width=600px,height=300px");
			
   		}
		,
		eventClick: function(event) {				
			window.open("fullDetail.go?id="+event.id,"","left=600px,top=50px,width=600px,height=300px");
		}
		,
		eventDrop: function(event , delta , revertFunc , jsEvent , ui , view){		
			if(event.end == null){				
				event.end = event.start;		
			}
			$.ajax({
				url:"fullDropUpdate.go",
				data:"id="+event.id+"&start="+event.start.format()+"&end="+event.end.format(),		
				dataType:"text",
				success:function(dropDate){
						alert(dropDate);
				}
			});
		}
		,
		eventResize: function(event , delta , revertFunc , jsEvent , ui , view){			
			$.ajax({
				url:"fullDropUpdate.go",
				data:"id="+event.id+"&start="+event.start.format()+"&end="+event.end.format(),
				dataType:"text",
				success:function(dropDate){
						alert(dropDate);
				}
			});
		}
		,
		events: function(start, end, timezone, callback) {		
		    $.ajax({
		    	url: 'full.go',
		    	dataType:'text',								
		    	success: function(data){						
		    		var parse = JSON.parse(data);				
		    		var events = [];							
		    		
		    		$(parse).each(function(){
		    			
		    			events.push({							
		    				id: $(this).attr('id'),				
		    				title: $(this).attr('title'),		
 		    				start: $(this).attr('start'),
		    				end: $(this).attr('end'),
 		    				description: $(this).attr('description')
		    			});
		    		});
		    		callback(events);
		    	}	//success end
		    });
		  }
		,
		loading: function(bool) {					
            $('#loading').toggle(bool);				
        }
		,
		eventColor:'chocolate'
		
		});	//fullcalendar end
		
		lineGraph.data = [122,1299,124,2];
		lineGraph.chartname = ['A제품','B제품','C제품','D제품'];
	    lineGraph.width = 500;
	    lineGraph.height = 300;
	    lineGraph.display();

		
	});	//$(function) end
	

	
	
	</script>
	
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
	height: 2000px;
}

.section2div1 {
	width: 70%;
	height: 100px;
	margin: -200 auto;
	background-image: url("images/braodcastpicture1.jpg");
	background-repeat: no-repeat;
	position: relative;
	overflow: hidden;
}

.section2div1div {
	width: 70%;
	height: 100px;
	color: white;
	font-size: 30px;
	text-align: center;
	padding-top: 0px;
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

}
.btn-ctrl {
	margin-left: 10px;
	padding: 0 4px;
	border: 1px solid #b6b6b6;
	border-radius: 4px;
	background-color: #dadada;
	line-height: 20px;
}

.section3 {
	width: 100%;
	height: 1500px;
}

.section3div2 {
	width: 70%;
	height: 600px;
	margin: 20px auto;
}

.section3div2div1 {
	width: 100%;
	height: 50px;
	color: red;
	font-size: 30px;
	text-align: center;
	padding-top: 10px;
	font-weight: bold;
	display: table;
}

.section3div2div1div {
	display: table-cell;
	vertical-align: middle;
	border-top: 2px groove gray;
	border-bottom: 2px double gray;
	
}

.section3div2div2 {
	width: 100%;
	height: 500px;
	margin: 20px auto;
}

.section3div2div2div1 {
	display: flex;
}

.section3div2div2div1div {
	display: flex-basis;
	width: calc(20% - 2px);;
	border: solid 1px;
}

.section3div2div2div1divdiv1 {
	width: 100%;
	height: 300px;
	margin: 0 auto;
	border: solid 1px;
}

.section3div2div2div1divdiv2 {
	width: 100%;
	height: 100px;
	text-align: center;
	magin-top: 5px;
	background-image: linear-gradient(-225deg, #E3FDF5 0%, #FFE6FA 100%);
	background-image: linear-gradient(to top, #a8edea 0%, #fed6e3 100%);	
	border: solid 1px;
}

.section3div2div2div1divdiv3 {
	width: 100%;
	height: 160px;
	margin: 0 auto;
	text-align: center;
	overflow: hidden;
}

.section3{
	width: 100%;
	height: 2000px;
background-color: silver;
	background-image: linear-gradient(335deg, #eee 23px, transparent 23px),
	linear-gradient(155deg, #f2f2f2 23px, transparent 23px),
	linear-gradient(335deg, #eee 23px, transparent 23px),
	linear-gradient(155deg, #f2f2f2 23px, transparent 23px);
	background-size: 58px 58px;background-position: 0px 2px, 4px 35px, 29px 31px, 34px 6px}

}





</style>
</head>
<body>
<header>
 <%@ include file="/form/header.jsp"%> 

</header>
	

<section class="section3">

	<div id="chat">
		<input type="text" id="message" />
		<input type="button" id="sendBtn" value="전송" /><br>
		<div id="data" style="overflow:auto;"></div>
	</div>

		<div class="banner">

	
			<ul>
				<li><img src="http://replic.godohosting.com/makeshop/IMG/201910DIY_MAIN.jpg" width="700" height="500px"></li>
				<li><img src="http://replic.godohosting.com/makeshop/IMG/20190425_Main_39.jpg" width="700" height="500px"></li>
				<li><img src="http://replic.godohosting.com/makeshop/IMG/20190326_main.jpg" width="700" height="500px"></li>
				<li><img src="http://replic.godohosting.com/makeshop/IMG/20190801_Main.jpg" width="700" height="500px"></li>
				<li><img src="http://replic.godohosting.com/makeshop/IMG/20190425_Main_40_1.jpg" width="700" height="500px"></li>
			</ul>

		</div>
		
			
            <div id="main_img_6">
<table width="700" height="500px" border="0" cellspacing="123" cellpadding="0">
  <tr>
    <td><a href="/shop/shopbrand.html?type=N&xcode=126&mcode=007"><img src="http://replic.godohosting.com/makeshop/IMG/190328_Main_Sub_1.jpg" /></a></td>
    <td><a href="/shop/shopbrand.html?xcode=126&type=N&mcode=014"><img src="http://replic.godohosting.com/makeshop/IMG/190328_Main_Sub_2.jpg" /></a></td>
    <td><a href="/shop/shopbrand.html?xcode=126&type=N&mcode=013"><img src="http://replic.godohosting.com/makeshop/IMG/190328_Main_Sub_3.jpg" /></a></td>
    <td><a href="/shop/shopbrand.html?type=N&xcode=126&mcode=010"><img src="http://replic.godohosting.com/makeshop/IMG/171122_Main_Sub_4.jpg" /></a></td>
  </tr>
</table>
</div>
		<div class="section3div1">
	</div>
		<div class="section3div2">
			<div class="section2div2div1">
				<div class="section3div2div1div">
					<span> 인기 아이템 Top10 </span>
				</div>
			</div>
			<div class="section3div2div2">
				<div class="section3div2div2div1">
					<div class="section3div2div2div1div">
						<div class="section3div2div2div1divdiv1">
							<img src="resources/images/hot1.jpg" alt="HOT1" width="100%" height="100%" />
						</div>
						<div class="section3div2div2div1divdiv2">
							<span>이름 / 가격</span>
						</div>
					</div>
					<div class="section3div2div2div1div">
						<div class="section3div2div2div1divdiv1">
							<img src="resources/images/hot2.jpg" alt="HOT2" width="100%" height="100%" />
						</div>
						<div class="section3div2div2div1divdiv2">
							<span>이름 / 가격</span>
						</div>
					</div>
					<div class="section3div2div2div1div">
						<div class="section3div2div2div1divdiv1">
							<img src="resources/images/hot3.jpg" alt="HOT3" width="100%" height="100%" />
						</div>
						<div class="section3div2div2div1divdiv2">
							<span>이름 / 가격</span>
						</div>
					</div>
					<div class="section3div2div2div1div">
						<div class="section3div2div2div1divdiv1">
							<img src="resources/images/hot4.jpg" alt="HOT4" width="100%" height="100%" />
						</div>
						<div class="section3div2div2div1divdiv2">
							<span>이름 / 가격</span>
						</div>
					</div>
					<div class="section3div2div2div1div">
						<div class="section3div2div2div1divdiv1">
							<img src="resources/images/hot5.jpg" alt="HOT5" width="100%" height="100%" />
						</div>
						<div class="section3div2div2div1divdiv2">
							<span>이름 / 가격</span>
						</div>
					</div>
				</div>
				<div class="section3div2div2div1">
					<div class="section3div2div2div1div">
						<div class="section3div2div2div1divdiv1">
							<img src="resources/images/hot6.jpg" alt="HOT6" width="100%" height="100%" />
						</div>
						<div class="section3div2div2div1divdiv2">
							<span>이름 / 가격</span>
						</div>
					</div>
					<div class="section3div2div2div1div">
						<div class="section3div2div2div1divdiv1">
							<img src="resources/images/hot7.jpg" alt="HOT7" width="100%" height="100%" />
						</div>
						<div class="section3div2div2div1divdiv2">
							<span>이름 / 가격</span>
						</div>
					</div>
					<div class="section3div2div2div1div">
						<div class="section3div2div2div1divdiv1">
							<img src="resources/images/hot8.jpg" alt="HOT8" width="100%" height="100%" />
						</div>
						<div class="section3div2div2div1divdiv2">
							<span>이름 / 가격</span>
						</div>
					</div>
					<div class="section3div2div2div1div">
						<div class="section3div2div2div1divdiv1">
							<img src="resources/images/hot9.jpg" alt="HOT9" width="100%" height="100%" />
						</div>
						<div class="section3div2div2div1divdiv2">
							<span>이름 / 가격</span>
						</div>
					</div>
					<div class="section3div2div2div1div">
						<div class="section3div2div2div1divdiv1">
							<img src="resources/images/hot10.jpg" alt="HOT10" width="100%" height="100%" />
						</div>
						<div class="section3div2div2div1divdiv2">
							<span>이름 / 가격</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="section2">
		
			<div class="section2div1div">
				<span> </span>
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
		<section class="section222">
		
		<div class="section2div2div2div1div"></div>
		
		<!-- fullCalendar -->
		<div id="divCalendar">
			<div id="loading">loading...</div>
			<div id="calendar"></div>
		</div>

		
	</section>

	<%@ include file="/form/footer.jsp"%>
</body>
</html>
</body>
</html>