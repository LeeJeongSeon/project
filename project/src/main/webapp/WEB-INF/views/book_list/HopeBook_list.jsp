<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="../include/event.css">
<style type="text/css">
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
button{
	width: 70px;
}
</style>
<script type="text/javascript">
$(function(){
	$("#btnWrite").click(function(){
		location.href="${path}/HopeBook/write.do";
	});
});

function list(page){
	if($("#keyword").val()){
		location.href="${path}/HopeBook/list.do?curPage="+page
		+"&keyword="+$("#keyword").val()
		+"&search_option="+$("#search_option").val();
	}else{
	location.href="${path}/HopeBook/list.do?curPage="+page;
	}
}

</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<h2>희망도서신청 게시판</h2>

<section id="body">
<!-- 검색폼 -->
<fieldset>
<form name="form1" method="post" action="${path}/HopeBook/list.do">
	<select name="search_option">
		<option value="hopeBook_title"
			<c:if test="${map.search_option == 'hopeBook_title'}">selected</c:if>
		>제목</option>
		<option value="hopeBook_userid" 
		<c:if test="${map.search_option == 'hopeBook_userid'}">selected</c:if>
		>작성자</option>
		<option value="hopeBook_bookname" 
		<c:if test="${map.search_option == 'hopeBook_bookname'}">selected</c:if>
		>신청도서</option>
		<option value="all" 
		<c:if test="${map.search_option == 'all'}">selected</c:if>
		>제목+도서이름+작성자</option> <!-- 통합검색 -->
	</select>
	<input name="keyword" value="${map.keyword}">
	<input type="submit" value="검색" class="search">
 </form>
</fieldset>
 
<c:choose>
<c:when test="${sessionScope.userid!=null}">
<button type="button" id="btnWrite">글쓰기</button>
</c:when>
<c:otherwise>
글쓰기기능은 로그인이 필요한 기능입니다. <br>
</c:otherwise>
</c:choose>

${map.count}개의 게시물이 있습니다.

<table border="1">
 <tr>
  <th>제목</th>
  <th>작성자</th>
  <th>닉네임</th>
  <th>신청도서</th>
 </tr>
 <c:forEach var="row" items="${map.list}">
 <tr>
  <td><a href="${path}/HopeBook/view.do?hopeBook_id=${row.hopeBook_id}">${row.hopeBook_title}</a></td>
  <td>${row.hopeBook_userid}</td>
  <td>${row.name}</td>
  <td>${row.hopeBook_bookname}</td>
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
</section>
<input type="hidden" value="${map.keyword}" id="keyword">
<input type="hidden" value="${map.search_option}" id="search_option">
<%@ include file="../include/footer.jsp" %>
</body>
</html>