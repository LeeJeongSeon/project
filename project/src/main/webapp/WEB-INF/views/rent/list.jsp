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
	$("#btnList").click(function() {
		location.href="${path}/book/list.do";
	});
});
</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<h2>도서대여</h2>
<c:choose>
 <c:when test="${map.count == 0}">
  대여목록이 없습니다.
 </c:when>
<c:otherwise>
 <form name="form1" action="post" action="${path}/rent/update.do">
 <table border="1" style="width: 100%">
 <tr>
  <th>제목</th>
  <th>대출일</th>
  <th>반납일</th>
  <th>반납여부</th>
 </tr>
 <c:forEach var="row" items="${map.list}">
 <tr>
  <td>${row.book_name}</td>
  <td><fmt:formatDate value="${row.aday}" 
  pattern="yyyy-MM-dd HH시 mm분"/></td>
  <td><fmt:formatDate value="${row.bday}" 
  pattern="yyyy-MM-dd HH시 mm분"/></td>
  <td>
  <c:choose>
   <c:when test="${row.rent_check==1}">
   	대출중
   </c:when>
   <c:otherwise>
    반납
   </c:otherwise>
  </c:choose>
  </td>
  <td>
    <c:if test="${sessionScope.userid != null}">
     <a href="${path}/rent/delete.do?bnum=${row.bnum}">반납</a>
    </c:if>
  </td>
 </tr>
 </c:forEach>
 </table>
 </form>
</c:otherwise>
</c:choose>
<button type="button" id="btnList">도서목록</button>
</body>
</html>