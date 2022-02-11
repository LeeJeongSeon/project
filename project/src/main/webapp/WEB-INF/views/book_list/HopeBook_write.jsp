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
<script>
var book_check=0;

$(function(){
	
	$("#hopeBook_content").summernote({ //서머노트
		width: 500,
		height: 200
	});
	
	$("#btn").click(function(){
		if($("#hopeBook_title").val()=="") {
			alert("게시물 제목을 입력해주세요.");
			$("#hopeBook_title").focus();	
		}
		if($("#hopeBook_bookname").val()=="") {
			alert("책 이름을 입력해주세요.");
			$("#hopeBook_bookname").focus();
			
		}
		if($("#hopeBook_author").val()=="") {
			alert("책 저자를 입력해주세요.");
			$("#hopeBook_author").focus();
			
		}
		if($("#hopeBook_content").val()=="") {
			alert("신청사유를 입력해주세요.");
			$("#hopeBook_content").focus();
		}
		
		
		hopeBook_check()

		console.log("임시:"+book_check);
		if(book_check==1){
			document.form1.submit();
		}
		
	});
});

function hopeBook_check(){
	var param="hopeBook_bookname="+$("#hopeBook_bookname").val()
	 +"&hopeBook_author="+$("#hopeBook_author").val();
	
	$.ajax({
		url: "${path}/HopeBook/hopeBook_check.do",
		type: "post",
		data: param,
		success: function(check){
			if(check==1){
				alert("이미 있는 도서이기때문에 신청이 불가능합니다");
			}else{
				console.log("실행?");
				book_check=1;
			}
		}
	});
}
</script>

<style>
.fileDrop {
	width: 600px;
	height: 100px;
	border: 1px dotted gray;
	background-color: gray;
}
</style>

</head>
<body>
<%@ include file="../include/menu.jsp" %>
<h2>글쓰기</h2>
<form id="form1" name="form1" method="post" action="${path}/HopeBook/insert.do">
<table>
<tr>
<td>제목</td>
<td><input name="hopeBook_title" id="hopeBook_title" size="80"placeholder="제목을 입력하세요"></td>
</tr>
<tr>
<td>도서신청 제목</td>
<td><input name="hopeBook_bookname" id="hopeBook_bookname"></td>
</tr>
<tr>
<td>도서신청 저자</td>
<td><input name="hopeBook_author" id="hopeBook_author"></td>
</tr>
<tr>
<td>도서신청 사유</td>
<td><textarea rows="5" cols="60"  name="hopeBook_content" id="hopeBook_content"></textarea>
</td>
</tr>
<!-- <tr>
<td>첨부파일등록<div class="fileDrop"></div></td>
<td><div id="uploadedList"></div></td>
</tr> -->
</table>
	<div style="width:700px; text-align:center;">
	<input type="hidden" name="hopeBook_userid" id="hopeBook_userid" value="${sessionScope.userid}"> 
	<!-- <input type="submit" value="글쓰기"> -->
	<button type="button" id="btn">글쓰기</button>
	<button type="button" onclick="hopeBook_check()">값 확인</button>
	</div>
</form>
</body>
</html>