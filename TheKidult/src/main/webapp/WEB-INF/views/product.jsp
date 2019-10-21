<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="resources/css/page.css" rel="stylesheet" type="text/css">

</head>
<body>

	<table>
		<tr>
			<th>이름</th>
			<th>가격</th>
		</tr>
		
			<c:choose>
			<c:when test="${empty list }">
				<td colspan="3">작성된 글이 없습니다.</td>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list}" var="dto">
					<tr>
						<td><a href="selectpage.do">${dto.product_name }</a></td>
						<td>${dto.product_price }</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		
	</table>
	<jsp:include page="paging.jsp" flush="false">
				<jsp:param name="searchFiled" value="${paging.searchFiled }" />
				<jsp:param name="searchValue" value="${paging.searchValue }" />
				<jsp:param name="recordsPerPage" value="${paging.recordsPerPage}" />
				<jsp:param name="firstPageNo" value="${paging.firstPageNo}" />
				<jsp:param name="prevPageNo" value="${paging.prevPageNo}" />
				<jsp:param name="startPageNo" value="${paging.startPageNo}" />
				<jsp:param name="currentPageNo" value="${paging.currentPageNo}" />
				<jsp:param name="endPageNo" value="${paging.endPageNo}" />
				<jsp:param name="nextPageNo" value="${paging.nextPageNo}" />
				<jsp:param name="finalPageNo" value="${paging.finalPageNo}" />
			</jsp:include>
			
		 
			<form action="paging.do" method="post">
				<input type="hidden"/> 
				<select name="searchFiled">
					<option value="PRODUCT_NAME" selected="selected">제목</option>
					<!-- <option value="ID">작성자</option>  -->
				</select> <input type="text" name="searchValue" placeholder="내용을 입력하시오" style="width: 200px;"/> <input
					type="submit" value="검색">
					
			</form>
			
			<div class="main-item">
    <div class="con">
        <div class="main-item-box">
            <ul class="row">
                <li class="cell">
                    <div class="img-box"><img src="http://www.replicas.co.kr/shopimages/replicas/0460030000043.jpg?1537249548" alt=""></div>
                    <div class="product-name">상품 아이템 1</div>
                    <div class="price"><span>19,800</span> 원</div>
                </li>
                <li class="cell">
                    <div class="img-box"><img src="http://www.replicas.co.kr/shopimages/replicas/0460020000343.jpg?1554693157" alt=""></div>
                    <div class="product-name">상품 아이템 2</div>
                    <div class="price"><span>19,800</span> 원</div>
                </li>
                <li class="cell">
                    <div class="img-box"><img src="http://www.replicas.co.kr/shopimages/replicas/0460020000213.jpg?1527736348" alt=""></div>
                    <div class="product-name">상품 아이템 3</div>
                    <div class="price"><span>19,800</span> 원</div>
                </li>
                <li class="cell">
                    <div class="img-box"><img src="http://www.replicas.co.kr/shopimages/replicas/0840020011303.jpg?1566198280" alt=""></div>
                    <div class="product-name">상품 아이템 4</div>
                    <div class="price"><span>19,800</span> 원</div>
                </li>
                <li class="cell">
                    <div class="img-box"><img src="http://www.replicas.co.kr/shopimages/replicas/0460060001193.jpg?1559875639" alt=""></div>
                    <div class="product-name">상품 아이템 5</div>
                    <div class="price"><span>19,800</span> 원</div>
                </li>
                <li class="cell">
                    <div class="img-box"><img src="http://www.replicas.co.kr/shopimages/replicas/0010030001293.jpg?1566523780" alt=""></div>
                    <div class="product-name">상품 아이템 6</div>
                    <div class="price"><span>19,800</span> 원</div>
                </li>
                <li class="cell">
                    <div class="img-box"><img src="http://www.replicas.co.kr/shopimages/replicas/0460030000133.jpg?1564384126" alt=""></div>
                    <div class="product-name">상품 아이템 7</div>
                    <div class="price"><span>19,800</span> 원</div>
                </li>
                <li class="cell">
                    <div class="img-box"><img src="http://www.replicas.co.kr/shopimages/replicas/0010030001253.jpg?1565770730" alt=""></div>
                    <div class="product-name">상품 아이템 8</div>
                    <div class="price"><span>19,800</span> 원</div>
                </li>
                <li class="cell">
                    <div class="img-box"><img src="http://www.replicas.co.kr/shopimages/replicas/0460030000103.jpg?1552892448" alt=""></div>
                    <div class="product-name">상품 아이템 9</div>
                    <div class="price"><span>19,800</span> 원</div>
                </li>
                <li class="cell">
                    <div class="img-box"><img src="http://www.replicas.co.kr/shopimages/replicas/0180010000503.jpg?1490578074" alt=""></div>
                    <div class="product-name">상품 아이템 10</div>
                    <div class="price"><span>19,800</span> 원</div>
                </li>
                <li class="cell">
                    <div class="img-box"><img src="http://www.replicas.co.kr/shopimages/replicas/0840020011273.jpg?1565931176" alt=""></div>
                    <div class="product-name">상품 아이템 11</div>
                    <div class="price"><span>19,800</span> 원</div>
                </li>
                <li class="cell">
                    <div class="img-box"><img src="http://www.replicas.co.kr/shopimages/replicas/0190010004203.jpg?1548400207" alt=""></div>
                    <div class="product-name">상품 아이템 12</div>
                    <div class="price"><span>19,800</span> 원</div>
                </li>
                <li class="cell">
                    <div class="img-box"><img src="http://www.replicas.co.kr/shopimages/replicas/0190010004203.jpg?1548400207" alt=""></div>
                    <div class="product-name">상품 아이템 12</div>
                    <div class="price"><span>19,800</span> 원</div>
                </li>
                <li class="cell">
                    <div class="img-box"><img src="http://www.replicas.co.kr/shopimages/replicas/0190010004203.jpg?1548400207" alt=""></div>
                    <div class="product-name">상품 아이템 12</div>
                    <div class="price"><span>19,800</span> 원</div>
                </li>
                <li class="cell">
                    <div class="img-box"><img src="http://www.replicas.co.kr/shopimages/replicas/0190010004203.jpg?1548400207" alt=""></div>
                    <div class="product-name">상품 아이템 12</div>
                    <div class="price"><span>19,800</span> 원</div>
                </li>
                
               <li class="cell">
                    <div class="img-box"><img src="http://www.replicas.co.kr/shopimages/replicas/0190010004203.jpg?1548400207" alt=""></div>
                    <div class="product-name">상품 아이템 12</div>
                    <div class="price"><span>19,800</span> 원</div>
                </li>
            </ul>
        </div>

        <div class="main-item-bottom-bar">
            <div class="bottom-btn">
                <a href="#">더보기</a>
                <div class="bottom-ico"><i class="fas fa-caret-down"></i></div>
            </div>
        </div>
        
        <div class="banner-1"><img 
                                   ></div>
        
    </div>
</div>
			 

</body>
</html>