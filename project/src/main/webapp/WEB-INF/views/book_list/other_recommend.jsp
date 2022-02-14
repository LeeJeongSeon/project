<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
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
  <td><a href="${path}/book/view.do?book_id=${row.book_id}">${row.book_name}</a></td>
  <td><img src="../images/${row.book_img}" width="100px" height="100px">
  </td>
  <td>${row.book_author}</td>
  <td>${row.book_content}</td>
  <td>${row.book_publisher}</td>
 </tr>
 </c:forEach>
 </table>
</body>
</html>