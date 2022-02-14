<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="../resources/assets/css/main.css" />
<script src="../resources/assets/js/jquery.min.js"></script>
<script src="../resources/assets/js/jquery.dropotron.min.js"></script>
<script src="../resources/assets/js/browser.min.js"></script>
<script src="../resources/assets/js/breakpoints.min.js"></script>
<script src="../resources/assets/js/util.js"></script>
<script src="../resources/assets/js/main.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script type="text/javascript">
function list(page){
	if($("#keyword").val()){
		location.href="${path}/book/list.do?curPage="+page
		+"&keyword="+$("#keyword").val()
		+"&search_option="+$("#search_option").val();
	}else{
	location.href="${path}/book/list.do?curPage="+page;
}
}

</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<h2>게시판</h2>
<!-- 
<img src="C:\images\1.jpg" width="100px" height="100px">
절대경로로 이미지출력 안됨 -->


<!-- 검색폼 -->
<form name="form1" method="post" action="${path}/book/list.do">
	<select name="search_option">
		<option value="book_name"
			<c:if test="${map.search_option == 'book_name'}">selected</c:if>
		>제목</option>
		<option value="book_author" 
		<c:if test="${map.search_option == 'book_author'}">selected</c:if>
		>지은이</option>
		<option value="book_content" 
		<c:if test="${map.search_option == 'book_publisher'}">selected</c:if>
		>출판사</option>
		<option value="all" 
		<c:if test="${map.search_option == 'all'}">selected</c:if>
		>제목+지은이+출판사</option> <!-- 통합검색 -->
	</select>
	<!-- <input type="submit" value="검색"> -->
	<input name="keyword" value="${map.keyword}">
	
<%-- </form>

<!-- 체크박스폼 -->
<div>
 <form action="${path}/book/checkbox.do"> --%>
  <input type="checkbox"  name="check" value="소설/시/희곡">소설/시/희곡
  <input type="checkbox"  name="check" value="사회/정치">사회/정치
  <input type="checkbox"  name="check" value="인문">인문
  <input type="checkbox"  name="check" value="경제/경영">경제/경영
  <input type="checkbox"  name="check" value="자연과학">자연과학
  <!-- <input type="submit" value="메뉴분류"> -->
  <input type="submit" value="검색">
 </form>
${map.count}개의 도서가 있습니다.

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
  <td><img src="../images/${row.book_img}" width="100px" height="100px">
  <!-- <td><img src="C:\book_images\${row.book_img}" width="100px" height="100px"> -->
  </td>
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
<input type="hidden" value="${map.keyword}" id="keyword">
<input type="hidden" value="${map.search_option}" id="search_option">

</body>
</html>