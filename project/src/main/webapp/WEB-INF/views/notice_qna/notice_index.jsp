<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<style type="text/css">
.notice{
 text-decoration: none;
 color: black;
}
.notice:hover {
	text-decoration: underline;
}
</style>
</head>
<body>
<h3>공지사항</h3>
<table style="width: 50%; text-align: left;">
 <c:forEach var="row2" items="${noticeList}">
<tr>
   <c:choose>
    <c:when test="${fn:length(row2.subject) > 20}">
      <td>[공지] <a class="notice" href="${path}/notice_qna/view.do?num=${row2.num}&category=${row2.category}">
      ${fn:substring(row2.subject,0,19)}</a>...</td>
     </c:when>
     <c:otherwise>
       <td>[공지]<a class="notice" href="${path}/notice_qna/view.do?num=${row2.num}&category=${row2.category}">
       ${row2.subject}</a></td>
     </c:otherwise> 
    </c:choose>
      <td><fmt:formatDate value="${row2.reg_date }" pattern="yyyy-MM-dd"/></td>
</tr>
</c:forEach>
</table >
</body>
</html>