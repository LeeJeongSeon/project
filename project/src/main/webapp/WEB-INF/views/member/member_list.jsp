<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<title>회원 리스트</title>


<style type="text/css">
@charset "UTF-8";

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
select{
 width: 100px;
 text-align: center;
}

table{
 width: 80%;
 margin: auto;
 text-align: center;
}


</style>



</head>
<body>
<%@ include file="../include/menu.jsp" %>
<h2>회원 리스트</h2>
<!-- 검색폼 -->
<form name="form1" method="post" action="${path}/member/list.do">
	<select name="search_option">
		<option value="userid" <c:if test="${map.search_option == 'userid'}">selected</c:if>>아이디</option>
		<option value="name" <c:if test="${map.search_option == 'name'}">selected</c:if>>이름</option>
		<option value="phone" <c:if test="${map.search_option == 'phone'}">selected</c:if>>핸드폰 번호</option>
		<option value="email" <c:if test="${map.search_option == 'email'}">selected</c:if>>이메일</option>
		
		<!-- 여기 좀 이상함 -->
		<option value="all" <c:if test="${map.search_option == 'all'}">selected</c:if>>아이디+이름+핸드폰 번호+이메일</option>
	
		
	</select>
	<input name="keyword" value="${map.keyword}">
	<input type="submit" value="조회">
</form>

<hr>

${map.count}명의 회원들이 있습니다.

<hr>
<table border="1" >
 <tr> <th>아이디</th> <th>이름</th> <th>핸드폰 번호</th> <th>우편번호</th> <th>이메일</th></tr>

 <!-- for 반복문 -->
 <c:forEach var="row" items="${map.list}">
 <tr>
  <td>${row.userid}</td>
  <td><a href="${path}/member/admin_view.do?userid=${row.userid}">${row.name}</a></td>
  <td>${row.phone}</td>
  <td>${row.zipcode}</td>
  <td>${row.email}</td>
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
	

 
</table>
<br>
	<div align="center">
	<a href="${path}"><button type="button"
								class="btn btn-lg btn-success btn-block">메인</button></a>
	
	</div>

<%@ include file="../include/footer.jsp" %>
</body>
</html>
