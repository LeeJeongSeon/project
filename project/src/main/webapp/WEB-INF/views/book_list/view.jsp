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
<%@ include file="../include/menu.jsp" %>
<h2>책 상세페이지</h2>
<table>
 <tr>
  <td><img src="${path}/images/${dto.book_img}" width="300px" height="300px"> </td>
  <td align="center">
   <table>
    <tr>
     <td width="width:30%;">제목</td>
     <td>${dto.book_name}</td>
    </tr>
    <tr>
     <td>장르</td>
     <td>${dto.book_genre}</td>
    </tr>
    <tr>
     <td>저자</td>
     <td>${dto.book_author}</td>
    </tr>
     <tr>
     <td>출판사</td>
     <td>${dto.book_publisher} </td>
    </tr>
    <tr>
     <td>내용</td>
     <td>${dto.book_content} </td>
    </tr>
    <tr>
     <td>대출가능여부</td>
     <td>
     <c:choose>
     <c:when test="${dto.book_check==0}">
      대출가능
     </c:when>
     <c:otherwise>
      대출불가능 
     </c:otherwise>
     </c:choose>
    </tr>
   </table>
  </td>
 </tr>
</table>
</body>
</html>