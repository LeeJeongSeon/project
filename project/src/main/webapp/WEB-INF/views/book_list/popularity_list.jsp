<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
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
	location.href="${path}/book/popularity_list.do.do?curPage="+page;
}

</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<h2>대출이 많은 도서 top 100</h2>

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
  <th>순위</th>
  <th>제목</th>
  <th>&nbsp;</th>
  <th>지은이</th>
  <th>설명</th>
  <th>출판사</th>
  <th>대출횟수</th>
 </tr>
 <c:forEach var="row" items="${map.list}" varStatus="status">
 <tr>
  <td>${status.count}</td>
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
  <td>${row.book_counter}</td>
 </tr>
 </c:forEach>
</table>
<%@ include file="../include/footer.jsp" %>
</body>
</html>