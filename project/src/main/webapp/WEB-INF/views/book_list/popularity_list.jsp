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
	location.href="${path}/book/popularity_list.do.do?curPage="+page;
}

</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<h2>대출이 많은 도서 top 10</h2>

<!-- 검색폼 -->
<form name="form1" method="post" action="${path}/book/popularity_list.do">
  <input type="checkbox"  name="check" value="소설/시/희곡">소설/시/희곡
  <input type="checkbox"  name="check" value="사회/정치">사회/정치
  <input type="checkbox"  name="check" value="인문">인문
  <input type="checkbox"  name="check" value="경제/경영">경제/경영
  <input type="checkbox"  name="check" value="자연과학">자연과학
  <input type="submit" value="검색">
 </form>

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
  <td>
  <c:choose>
  <c:when test="${row.book_img==null}">
  <img src="../images/etc.jpg" width="100px" height="100px">
  </c:when>
  <c:when test="${fn:contains(row.book_img,'http')}">
  <img src="${row.book_img}" width="100px" height="100px">
  </c:when>
  <c:otherwise>
  <img src="../images/${row.book_img}" width="100px" height="100px">
  </c:otherwise>
  </c:choose>
  </td>
  <td>${row.book_author}</td>
  <c:choose>
  <c:when test="${fn:length(row.book_content)>100}">
  <td>${fn:substring(row.book_content,0,100)}... </td>
  </c:when>
  <c:otherwise>
  <td>${row.book_content}</td>
  </c:otherwise>
  </c:choose>
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
				begin="${map.pager.blockBegin}"
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
<%@ include file="../include/footer.jsp" %>
</body>
</html>