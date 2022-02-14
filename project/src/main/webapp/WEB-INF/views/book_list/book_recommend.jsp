<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript">
$(function(){
	var userid="userid="+$("#userid").val();
	
	$.ajax({
		url: "${path}/book/book_random_recommend.do",
		type: "post",
		async: false, 
		data: userid,
		success: function(result){
			$("#result").html(result);
		}
	});
});
</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<h2>오늘의 도서추천</h2>
<input type="hidden" value="${sessionScope.userid}" name="userid" id="userid">

<div id="result"></div>
</body>
</html>