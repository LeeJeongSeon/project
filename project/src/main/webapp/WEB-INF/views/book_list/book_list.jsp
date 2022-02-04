<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript">
function list(page){
	location.href="${path}/book/list.do?curPage="+page;
}

</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<h2>게시판</h2>

<table border="1">
 <tr>
  <th>제목</th>
  <th>&nbsp;</th>
  <th>지은이</th>
  <th>설명</th>
  <th>출판사</th>
 </tr>
 <c:forEach var="row" items="${map.list}">
 <tr>
  <td><a href="${path}/book/view.do?book_id=${row.book_id}">${row.book_name}</a></td>
  <td><img src="../images/${row.book_img}" width="100px" height="100px">${row.book_img}</td>
  <td>${row.book_author}</td>
  <td>${row.book_content}</td>
  <td>${row.book_publisher}</td>
 </tr>
 </c:forEach>
	<!-- 페이지 네비게이션 출력 -->	
	<tr>
		<td colspan="6" align="center">
			<c:if test="${map.pager.curBlock > 1}">
				<a href="#" onclick="list('1')">[처음]</a>
			</c:if>
			<c:if test="${map.pager.curBlock > 1}">
				<a href="#" onclick="list('${map.pager.prevPage}')">
				[이전]</a>
			</c:if>
			<c:forEach var="num" 
				begin="${map.pager.blockStart}"
				end="${map.pager.blockEnd}">
				<c:choose>
					<c:when test="${num == map.pager.curPage}">
					<!-- 현재 페이지인 경우 하이퍼링크 제거 -->
						<span style="color:red;">${num}</span>
					</c:when>
					<c:otherwise>
						<a href="#" onclick="list('${num}')">${num}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${map.pager.curBlock < map.pager.totBlock}">
				<a href="#" 
				onclick="list('${map.pager.nextPage}')">[다음]</a>
			</c:if>
			<c:if test="${map.pager.curPage < map.pager.totPage}">
				<a href="#" 
				onclick="list('${map.pager.totPage}')">[끝]</a>
			</c:if>
		</td>
	</tr>

 
</table>
</body>
</html>