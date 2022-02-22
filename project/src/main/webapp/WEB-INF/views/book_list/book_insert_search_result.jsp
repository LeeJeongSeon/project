<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="../include/event.css">
<style type="text/css">
#button{
	width:100px;
}
</style>
</head>
<body>
<form id="form1" name="form1" method="post" action="${path}/crawling/insert.do" >
<table>
 <tr>
  <td>도서 이름</td>
  <td><input name="book_name" id="book_name" value="${map.name}" size="100px"></td>
 </tr>
 <tr>
  <td>저자</td>
  <td><input name="book_author" id="book_author" value="${map.author}" size="100px"></td>
 </tr>
 <tr>
  <td>출판사</td>
  <td><input name="book_publisher" id="book_publisher" value="${map.publisher}" size="100px"></td>
 </tr>
 <tr>
  <td>장르</td>
  <td><input name="book_genre" id="book_genre" value="${map.genre}" size="100px"></td>
 </tr>
 <tr>
  <td>이미지</td>
  <td><input name="book_img" id="book_img" value="${map.img}" size="100px"></td>
 </tr>
 <tr>
  <td>소개</td>
  <td>
  <textarea rows="100" cols="150" name="book_content" id="book_content">${map.content}</textarea>
  </td>
 </tr>
</table>
<button id="button">도서추가</button>
</form>
</body>
</html>