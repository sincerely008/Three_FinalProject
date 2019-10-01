<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>footer</title>
<style type="text/css">
	* { margin : 0px; padding : 0px;}
	.footer {		position : relative;
					width: 100%;
					height : 250px;
					background-color: #212226;
					display : table}	
	.footerdiv {width: 1000px;  margin : 0 auto; }			
	.footerdivdiv {	width: 1000px;
					height : 200px;
				    margin : 0 auto;
				    display: table-cell;
				    vertical-align: middle;}
					
	.footerlogo { margin-right : 20px; float : left; }
	.footerul { list-style:none; }
	.footerul li{ font-color :White; font-size : 20px; 
				  float : left; color : White;}	
	.footerul a{ font-color :White; font-size : 15px; padding-left :10px; 
				  padding-bottom : 10px;
				  float : left; color :#949596; 
				  border-left-width : 1px; text-decoration: none;}						  

	.footeraddress { float:left; font-size : 12px; color:#949596;
					margin-left:20px;}
	.footerp { font-size : 15px; color : White; display : block;}
	.footerpdiv {height : 100px; display : table;}
	.footerpdivdiv{ width:1000px; text-align:center; display : table-cell;
					vertical-align: bottom;
					position : relative; top : -10px;}
	
</style>
</head>
<body>
	<footer class = "footer">
			<div class = "footerdiv">
				<div class = "footerdivdiv">
					<img class = "footerlogo" alt="로고1" src="resources/images/kidult.jpg" width="50px" height="50px">
					<img class = "footerlogo" alt="로고2" src="resources/images/kidult.jpg" width="50px" height="50px">
					<div>
						<ul class = "footerul">
							<li style ="padding-left : 15px;">
								<a href="" target="blank">
								 회사소개 
								</a> 
							</li>
							<li>
								<a href="" target="blank">
								 이용약관
								</a> 
							</li>
							<li>
								<a href="" target="blank">
								 운영정책
								</a> 
							</li>
							<li style = "color : hotpink;">
								<a href="" target="blank">
								개인정보 처리방침
								</a> 
							</li>
							<li>
								<a href="login.jsp" target="blank">
								 청소년 보호정책
								</a> 
							</li>
						</ul>
					</div>
					<div>
						<p class = "footeraddress">
							회사명.㈜ILL GANG 대표이사.광현이 사업자등록번호. 012-34-56789 </br>
							css판매업 신고번호. 제 2019-서울강남-0726호 E.pigstar0000@naver.com F.010-9250-9529
							<strong>&copy; KH정보교육원 Q class 오후 3조 & 광현이 All rights reserverd </strong>
						</p>
						<p></p>
					</div>
				</div>
				<div class = "footerpdiv">
					<div class = "footerpdivdiv">
						<span class ="footerp">
							&copy; KH정보교육원 Q class 오후 3조 & 광현이 All rights reserverd
						</span>
					</div>
				</div>
			</div>
		</footer>	

</body>
</html>

