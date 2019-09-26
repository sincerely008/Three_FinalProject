<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
			 

</body>
</html>