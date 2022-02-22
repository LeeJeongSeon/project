<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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

fieldset {
	margin: 10px 20px 10px 20px;
	border: 2px solid #666;
	padding-right: 40px; 
	vertical-align: middle;
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

.tb1_col1 {
	width: 280px;
}

.tb1_col2 {
	width: 260px;
}

.tb1_col3 {
	width: 258px;
}

.tb1_col4 {
	width: 86px;
}

.tb1_col5 {
	width: 86px;
}

.tb1_col6 {
	width: 176px;
}

.tb1_col7 {
	width: 60px;
}

.tb2 td {
	padding: 10px;
}

#table {
	background-color: #fff2e6;
	border-radius: 30px;
	padding: 2% 2% 3% 2%;
	margin-top: 30px;
	margin-bottom: 30px;
}

select {
	margin-left: 30px;
	width: 60px;
	height: 25px;
}


textarea {
	height: 200px;
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
<table border="1">
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
	</tr>

 
</table>

<%@ include file="../include/footer.jsp" %>
</body>
</html>
