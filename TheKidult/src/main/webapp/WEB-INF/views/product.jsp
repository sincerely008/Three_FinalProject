<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' href='resources/css/all.css' />
</head>
<%@ include file="/form/header.jsp"%>
<body>

	<div class="main-item">
		<c:choose>
			<c:when test="${empty list }">
				<td colspan="3">작성된 글이 없습니다.</td>
			</c:when>
			<c:otherwise>
				<div class="con">
					<div class="main-item-box">
						<ul class="row">
							<c:forEach items="${list}" var="dto">
								<li class="cell">
									<div class="img-box">
										<img alt="" src="${dto.product_img }"
											onclick="location.href='selectpage.do?product_no=${dto.product_no}'">
									</div>

									<div class="product-name">
										<a href="selectpage.do?product_no=${dto.product_no}">${dto.product_name }</a>
									</div>

									<div class="price">가격 : ${dto.product_price }</div>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>

			</c:otherwise>
		</c:choose>
		<c:if test="${mdto.member_role eq 'ADMIN' }">
			<input type="button" value="입력하기" onclick="">
		</c:if>

	</div>
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


	<form action="paging.do">
		<input type="hidden" /> 
			<select name="searchFiled">
				<option value="PRODUCT_NAME" selected="selected">제목</option>
			<!-- <option value="ID">작성자</option>  -->
			</select> 
		<input type="text" name="searchValue" placeholder="내용을 입력하시오" style="width: 200px;" /> 
		<input type="submit" value="검색">
	</form>
<br/><br/><br/>
<%@ include file="/form/footer.jsp"%>
</body>
</html>