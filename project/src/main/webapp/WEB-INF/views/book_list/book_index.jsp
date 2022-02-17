<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.book{
	text-decoration: none;
	color: black;
}
.book:hover{
	text-decoration: underline;
}
</style>
<%@ include file="../include/header.jsp" %>
</head>
<body>
<div style="text-align: center;">
<h2>신작도서</h2>
<table style="text-align: center; width:100%;">
<tr>
 <c:forEach var="row" items="${list}">
 <td>
  <c:choose>
  <c:when test="${row.book_img==null}">
  <img src="images/etc.jpg" width="200px" height="200px">
  </c:when>
  <c:when test="${fn:contains(row.book_img,'http')}">
  <img src="${row.book_img}" width="200px" height="200px">
  </c:when>
  <c:otherwise>
  <img src="images/${row.book_img}" width="200px" height="200px">
  </c:otherwise>
  </c:choose>
 </td> 
 </c:forEach>
 </tr>
 <tr>
  <c:forEach var="row" items="${list}">
  <c:choose>
  <c:when test="${fn:length(row.book_name)>15}">
  
  <td><a class="book" href="${path}/book/view.do?book_id=${row.book_id}">${fn:substring(row.book_name,0,14)}</a>... </td>
  </c:when>
  <c:otherwise>
  <td><a class="book" href="${path}/book/view.do?book_id=${row.book_id}">${row.book_name}</a></td>
  </c:otherwise>
  </c:choose>
 </c:forEach>
 </tr>
 </table>
</div>
</body>
</html>