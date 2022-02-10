<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 게시판</title>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript">
$(function(){
	$("#btnWrite").click(function() {
		location.href="${path}/review/write.do";
	});
});
function list(page){
	location.href="${path}/review/list.do?curPage="+page;
}


</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<h2>게시판</h2>
<!-- 검색폼 -->
<form name="form1" method="post" action="${path}/review/list.do">
	<select name="search_option">
		<option value="review_writer" <c:if test="${map.search_option == 'review_writer'}">selected</c:if>>아이디</option>
		<option value="review_title" <c:if test="${map.search_option == 'review_title'}">selected</c:if>>제목</option>
		<option value="review_content" <c:if test="${map.search_option == 'review_content'}">selected</c:if>>내용</option>
		
		<!-- 여기 좀 이상함 -->
		<option value="all" <c:if test="${map.search_option == 'all'}">selected</c:if>>아이디+내용+제목</option>
		
		
	</select>
	<input name="keyword" value="${map.keyword}">
	<input type="submit" value="조회">
</form>
<button type="button" id="btnWrite">글쓰기</button>

${map.count}개의 게시물이 있습니다.

<table border="1">
 <tr> <th>번호</th> <th>제목</th> <th>아이디</th> <th>내용</th> <th>날짜</th> <th>조회수</th> </tr>

 <!-- for 반복문 -->
 <c:forEach var="row" items="${map.list}">
 <tr>
  <td>${row.review_bno}</td>
  <td><a href="${path}/review/view.do?review_bno=${row.review_bno}">${row.review_title}</a>
   <c:if test="${row.review_cnt > 0}"> <span style="color: red;">(${row.review_cnt})</span> </c:if>
  </td>
  <td>${row.review_writer}</td>
  <td>${row.review_content}</td>
  <td><fmt:formatDate value="${row.review_regdate}" 
  pattern="yyyy-MM-dd HH:mm:ss" /> </td>
  <td>${row.review_viewcnt}</td>
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