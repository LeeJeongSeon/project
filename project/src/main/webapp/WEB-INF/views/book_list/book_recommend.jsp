<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="../include/event.css">
<script type="text/javascript">
$(function(){
	var userid="userid="+$("#userid").val();
	
	$.ajax({
		url: "${path}/book/book_random_recommend.do",
		type: "post",
		async: false, 
		success: function(result){
			$("#result").html(result);
		}
	});
	
	$.ajax({
		url: "${path}/book/book_other_recommend.do",
		type: "post",
		async: false, 
		success: function(result){
			$("#result2").html(result);
		}
	});
});
</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>

<h2>오늘의 도서추천</h2>
<div id="result"></div>
<h2>다른사람의 도서추천</h2>
<div id="result2"></div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>