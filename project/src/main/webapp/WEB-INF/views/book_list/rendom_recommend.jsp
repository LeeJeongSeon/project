<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<style type="text/css">
table{
	table-layout: fixed;
}
.book{
	text-decoration: none;
	color: black;
}
.book:hover{
	text-decoration: underline;
}
</style>
<link rel="stylesheet" href="../include/event.css">
</head>
<body>
<table border="1">
 <tr>
  <th>제목</th>
  <th>&nbsp;</th>
  <th>지은이</th>
  <th>설명</th>
  <th>출판사</th>
 </tr>
 <c:forEach var="row" items="${map.list}">
 <tr>
  <td><a href="${path}/book/view.do?book_id=${row.book_id}" class="book">${row.book_name}</a></td>
  <td>
   <c:choose>
  <c:when test="${row.book_img==null}">
  <img src="../images/etc.jpg" width="100px" height="100px">
  </c:when>
  
  <c:when test="${fn:contains(row.book_img,'http')}">
  <img src="${row.book_img}" width="100px" height="100px">
  </c:when>
  <c:otherwise>
  <img src="../images/${row.book_img}" width="100px" height="100px">
  </c:otherwise>
  </c:choose>
  </td>
  <td>${row.book_author}</td>
  <c:choose>
  <c:when test="${fn:length(row.book_content)>100}">
  <td>${fn:substring(row.book_content,0,100)}... </td>
  </c:when>
  <c:otherwise>
  <td>${row.book_content}</td>
  </c:otherwise>
  </c:choose>
  <td>${row.book_publisher}</td>
 </tr>
 </c:forEach>
 </table>
</body>
</html>