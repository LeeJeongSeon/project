<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="include/header.jsp" %>	
<script type="text/javascript">
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
</script>
<style type="text/css">
#result{
 	border: 1px solid black;
}
</style>
<title>Home</title>

</head>
<body>
<%@ include file="include/menu.jsp" %>
<h1>Hello world!</h1>
<P>The time on the server is ${serverTime}. </P>
<div id="result"></div>
<div></div>
<%@ include file="include/footer.jsp" %>
</body>
</html>