<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<style type="text/css">
.review{
	color: black;
}

a {
	text-decoration-line: none;
}

.review:hover {
	text-decoration: underline;
}
</style>
</head>
<body>
<h3 style="text-align: right"><a href="${path}/review/list.do">리뷰 게시판</a></h3>
<table style="width: 100%; text-align: left;">
 <c:forEach var="row2" items="${reviewList}">
<tr>
   <c:choose>
    <c:when test="${fn:length(row2.review_title) > 20}">
      <td>[리뷰] <a class="review" href="${path}/review/view.do?review_bno=${row2.review_bno}&review_writer=${row2.review_writer}">
      ${fn:substring(row2.review_title,0,19)}</a>...</td>
     </c:when>
     <c:otherwise>
       <td>[리뷰]<a class="review" href="${path}/review/view.do?review_bno=${row2.review_bno}&review_writer=${row2.review_writer}">
       ${row2.review_title}</a></td>
     </c:otherwise> 
    </c:choose>
      <td><fmt:formatDate value="${row2.review_regdate }" pattern="yyyy-MM-dd"/></td>
</tr>
</c:forEach>
</table >
</body>
</html>
