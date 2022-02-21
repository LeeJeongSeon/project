<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script src="${path}/include/common.js"></script>
<script src="${path}/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
function notice_qna_write(){
	var subject=$("#subject").val();
	var content=$("#content").val();
	if(subject==""){
		alert("제목을 입력하세요");
		$("#subject").focus();
		return;
	}
/* 	if(content==""){
		alert("내용을 입력하세요");
		$("#content").focus();
		return;
	} */
	document.form1.action="${path}/notice_qna/insert.do";
	document.form1.submit();
	
}


</script>
<style type="text/css">

#btn{text-align: right; padding: 5px;}
</style>
<link rel="stylesheet" href="../include/event.css">
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<h2>${map.cate}</h2>
<div id="body">
<form id="form1" name="form1" method="post">
	제목 <input name="subject" id="subject" size="80" placeholder="제목을 입력하세요">
	<input type="hidden" name="category" id="category" value="${map.tab}">
	
	<div style="width:100%;">
		내용 <textarea id="content" name="content"
rows="3" cols="80" placeholder="내용을 입력하세요"></textarea>
<script>
// ckeditor 적용
CKEDITOR.replace("content",{
	filebrowserUploadUrl: "${path}/imageUpload.do"
});// ImageUploadController.java 에서 처리
</script>
	</div>
</form>
<div id="btn">
	<button type="button" onclick="notice_qna_write()">등록</button>
	</div>
</div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>