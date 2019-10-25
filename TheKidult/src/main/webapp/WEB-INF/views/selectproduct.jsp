<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.three.kidult.dto.MemberDto"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
	MemberDto mdto = (MemberDto)session.getAttribute("memberDto");
%>
<script src="js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>


<title>Insert title here</title>
</head>
<body>
	<div>
		<form action="payment.do" method="post">
		<table>
			<tr>
				<td><span>상품명 : </span><a>${pdto.product_name }</a></td>
			</tr>
			<tr>
				<td><span>가격 : </span><a>${pdto.product_price }</a><span>원</span></td>
			</tr>
			<tr>
				<td>
					<input type="hidden" id="product_no" name="product_no" value="${pdto.product_no }">
					<input type="submit" value="구입하기">
					<input type="button" value="장바구니" onclick="location.href=''">
				</td>
			</tr>
		</table>
		</form>
	</div>
	<div>
		<img alt="" src="${pdto.product_details }">
	</div>
	
</body>
</html>