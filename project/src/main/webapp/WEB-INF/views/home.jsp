<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="include/header.jsp" %>	
<script type="text/javascript">
if(location.href.indexOf("member/login_check.do")!=-1) {
	location.replace("${path}");
}

$(function(){
	$.ajax({
		url: "${path}/book/book_index.do",
		type: "post",
		async: false, 
		success: function(result){
			$("#result").html(result);
		}
	});
	
});
$(function(){
	$.ajax({
		url: "${path}/notice_qna/index.do",
		type: "post",
		 
		success: function(result){
			$("#result1").html(result);
		}
	});
	
});

$(function(){
	$.ajax({
		url: "${path}/review/index.do",
		type: "post",
		 
		success: function(result){
			$("#result2").html(result);
		}
	});
	
});


</script>
<style type="text/css">
#result{
 	border: 1px solid black;
}
#result1{width: 50%;  }
#result2{width: 50%; }
#result3{display: flex;}

</style>
<title>Home</title>
<link rel="stylesheet" href="include/event.css">
</head>
<body>
<%@ include file="include/menu.jsp" %>
<div id="result"></div>
<div id="result3">
<div id="result1"></div>
<div id="result2"></div>
</div>
<div></div>
<%@ include file="include/footer.jsp" %>
</body>
</html>
