<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<link rel="shortcut icon" href="#">
<link rel="stylesheet" href="../include/event.css">
<script type="text/javascript">
$(function(){
	$("#exbtn").click(function(){
		$.ajax({
			url: "${path}/crawling/example.do",
			type: "post"
		});
	});
	
	$("#searchbtn").click(function(){
		var param="name_book="+$("#name_book").val();
		
		$.ajax({
			url:"${path}/crawling/example2.do",  
			type: "post",
			data: param,
			success: function(result){
				$("#result").html(result);
			}
		});
	});
	
});
</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<input name="name_book" id="name_book"> <button id="searchbtn">검색</button>
<!-- <button type="button" id="exbtn">확인</button> -->
<div id="result"></div>
</body>
</html>