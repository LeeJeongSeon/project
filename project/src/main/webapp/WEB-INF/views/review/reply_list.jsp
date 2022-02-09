<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 리스트</title>
<%@ include file="../include/header.jsp" %>
</head>
<body>
<% pageContext.setAttribute("newLineChar", "\n"); %>
<table style="width:700px">
<!-- fn: header.jsp의 jstl -->
<c:forEach var="row" items="${list}">   
	<c:set var="str" value="${fn:replace(row.review_replytext,'<','&lt;') }" />
	<c:set var="str" value="${fn:replace(str,'>','&gt;') }" />	
	<c:set var="str" value="${fn:replace(str,'  ','&nbsp;&nbsp;')}" />
	<c:set var="str" value="${fn:replace(str,newLineChar,'<br>') }" />

	<tr>
		<td>
			${row.review_replyer}
			( <fmt:formatDate value="${row.review_regdate}" pattern="yyyy-MM-dd a HH:mm:ss" /> )<br>
			${str}
		</td>
	</tr>
</c:forEach>	
</table>

</body>
</html>
