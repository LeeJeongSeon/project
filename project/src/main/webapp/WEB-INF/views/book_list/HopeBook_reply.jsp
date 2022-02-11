<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src="${path}/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
$(function(){
	$("#hopeBook_content").summernote({ //서머노트
		width: 500,
		height: 200
	});
})

function updateReply(){
	document.form1.submit();
}

</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<h2>답변쓰기</h2>
<form name="form1" method="post" action="${path}/HopeBook/insertReply.do">
<table style="border: 1px solid; width: 100%;">
 <tr>
  <td>관리자</td>
  <td><input name="hopeBook_userid" id="hopeBook_userid" value="admin"> </td>
 </tr>
 <tr>
  <td>제목</td>
  <td><input name="hopeBook_title" id="hopeBook_title" value="Re: ${dto.hopeBook_title}" size="60"> </td>
 </tr>
 <tr>
    <td>신청도서 제목</td>
    <td><input id="hopeBook_bookname" name="hopeBook_bookname" class="input" value="${dto.hopeBook_bookname}"></td>
 </tr>
 <tr>
   <td>신청도서 저자</td>
   <td><input id="hopeBook_author" name="hopeBook_author" class="input" value="${dto.hopeBook_author}"></td>
  </tr>
 <tr>
 <tr>
  <td>본문</td>
  <td><textarea rows="5" cols="60" name="hopeBook_content" id="hopeBook_content">
  <br>${dto.hopeBook_content}<br> 
  ===게시물의 내용=== <br>
  ${dto.name}님 <br> 
  </textarea> </td>
 </tr>
 <tr>
  <td colspan="2" align="center">
	<input type="hidden" name="ref" id="ref" value="${dto.ref}">
   <input type="hidden" name="re_step" id="re_step" value="${dto.re_step}">
   <input type="hidden" name="re_level" id="re_level" value="${dto.re_level}">
   <input type="hidden" name="hopeBook_id" id="hopeBook_id" value="${dto.hopeBook_id}">
   <input type="button" value="답변달기" onclick="updateReply()">
 </tr>
</table>
	단계:${dto.re_level}
</form>
</body>
</html>