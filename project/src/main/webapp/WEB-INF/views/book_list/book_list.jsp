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
<style type="text/css">
.input {
	margin: 0px 10px;
	width: 82%; 
	height: 20px;
}
body {
	color: #444; 
	width: 1260px;
	margin-left: 5px;
}

@media screen and (min-width: 1270px) {
	body {
		position: absolute;
		left: 50%;
		transform: translateX(-50%);
	}
}
fieldset {
	margin: 10px 20px 0 20px;
	border: 2px solid #666;
	padding-right: 40px; 
	vertical-align: middle;
}
.search{
	width: 50px;
	height: 25px;
	background-color: #fff;
	color: #666;
	border: 1px solid #999;
	font-weight: bold;
}
select {
	margin-left: 30px;
	width: 80px;
	height: 25px;
}
table {
	background-color: #fff;
	width: 100%;
	border-top: 1px solid #aaa;
	border-bottom: 1px solid #aaa;
	text-align: center;
}
th, td {
	padding: 1px 2px;
}
.book{
	text-decoration: none;
	color: black;
}
.book:hover{
	text-decoration: underline;
}
</style>
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
<section style="text-align: center;">
<!-- 검색폼 -->
<fieldset>
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
  <input name="keyword" value="${map.keyword}" class="input"> <br>
  <input type="checkbox"  name="check" value="소설/시/희곡">소설/시/희곡
  <input type="checkbox"  name="check" value="사회/정치">사회/정치
  <input type="checkbox"  name="check" value="인문">인문
  <input type="checkbox"  name="check" value="경제/경영">경제/경영
  <input type="checkbox"  name="check" value="자연과학">자연과학
  <input type="submit" value="검색" class="search">
</form>
</fieldset>
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
  <td><a href="${path}/book/view.do?book_id=${row.book_id}" class="book">${row.book_name}</a></td>
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
<input type="hidden" value="${map.keyword}" id="keyword">
<input type="hidden" value="${map.search_option}" id="search_option">
</section>
<%@ include file="../include/footer.jsp" %>
</body>
</html>