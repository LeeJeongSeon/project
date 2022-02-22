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
function btnReply(){
	document.form1.action="${path}/notice_qna/insertReply.do";
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
<h2>답하기</h2>
<div id="body">
<form id="form1" name="form1" method="post">
	<div>제목 <input name="subject" id="subject" size="80" value="RE:${dto.subject}">
	<input type="hidden" name="num" id="num" value="${dto.num} ">
	<input type="hidden" name="category" id="category" value="${dto.category}">
	</div>
	<div style="width:100%;">
		내용 <textarea id="content" name="content"
rows="3" cols="80" ><br><br><br><br>-------원문------<br>${dto.content}</textarea>
<script>
// ckeditor 적용
CKEDITOR.replace("content",{
	filebrowserUploadUrl: "${path}/imageUpload.do"
});// ImageUploadController.java 에서 처리
</script>
	</div>
</form>
<div id="btn">
	<button type="button"  onclick="btnReply()">답글</button>
	</div>
	</div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>