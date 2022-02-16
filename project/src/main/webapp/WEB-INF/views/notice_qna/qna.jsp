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
	$("#btnList").click(function(){
		location.href="${path}/notice_qna/list.do?category=qna";
	});
	$("#btnWrite").click(function(){
		location.href="${path}/notice_qna/write.do?category=qna";
	});
});
function list(page){
	location.href="${path}/notice_qna/list.do?curPage="+page
			+"&category=qna";
}
</script>
<style type="text/css">
#pageNv{
 display: inline;
}
#side{
 position: absolute;
 top:150px;
 left : 100px;
 width: 200px;
 height: 200px;
}
#sidemenu1{list-style: none;
padding: 0px;
}
.noticemenu,.qnamenu{padding: 0.7em;
 border-bottom: 1px solid gray;
}
#content{
position: absolute;
left: 300px;
top: 150px;
width: 1200px;
}
a{text-decoration: none;}
.noticemenu:hover {
	background: orange;
	color: white;
}

</style>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<div id="side">
<h3>이용자게시판</h3>
 <ul id="sidemenu1">
  <li class="noticemenu" ><a class="noticemenu"  href="${path}/notice_qna/list.do?category=notice">공지사항</a></li>
  <li class="qnamenu" style="background: orange;"><a class="qnamenu" style="color: white;" href="${path}/notice_qna/list.do?category=qna">묻고답하기</a></li>
 </ul>
</div>

<div id="content">
<div id="article" >
<h2>묻고답하기</h2>
전체<strong>${map.count}</strong> 개

<table>
 <tr>
  <th>번호</th>
  <th>제목</th>
  <th>글쓴이</th>
  <th>등록일</th>
  <th>조회</th>
 </tr>
 <c:forEach var="row2" items="${map.noticeList}">
<tr>
 <td>[공지]</td>
 <td><a href="${path}/notice_qna/view.do?num=${row2.num}&category=${row2.category}">${row2.subject}</a></td>
 <td>${row2.id }</td>
  <td><fmt:formatDate value="${row2.reg_date }" pattern="yyyy.MM.dd"/></td>
  <td>${row2.readcount}</td>
</tr>
</c:forEach>

 <c:forEach var="row" items="${map.list}">
 <tr>
  <td>${row.num}</td>
  <td>
  <c:forEach var="i" begin="1" end="${row.re_level }" >
   &nbsp;
  </c:forEach>
  <a href="${path}/notice_qna/view.do?num=${row.num}&category=${row.category}"> ${row.subject}</a></td>
  <td>${row.id }</td>
  <td><fmt:formatDate value="${row.reg_date }" pattern="yyyy.MM.dd"/></td>
  <td>${row.readcount}</td>
 </tr>
 </c:forEach>
</table>
</div>

<div>
<button type="button" id="btnWrite">글쓰기</button>
 <button type="button" id="btnList">목록</button>
</div>

<div id="pageNv">
<c:if test="${map.pager.curBlock > 1}">
				<a href="#" onclick="list('1')">[처음]</a>&nbsp;
			</c:if>
			<c:if test="${map.pager.curBlock > 1}">
				<a href="#" onclick="list('${map.pager.prevPage}')">
				[이전]</a>&nbsp;
			</c:if>
			<c:forEach var="num" 
				begin="${map.pager.blockStart}"
				end="${map.pager.blockEnd}">
				<c:choose>
					<c:when test="${num == map.pager.curPage}">
					<!-- 현재 페이지인 경우 하이퍼링크 제거 -->
						<span style="color:red;">${num}</span>&nbsp;
					</c:when>
					<c:otherwise>
						<a href="#" onclick="list('${num}')">${num}</a>&nbsp;
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${map.pager.curBlock < map.pager.totBlock}">
				<a href="#" 
				onclick="list('${map.pager.nextPage}')">[다음]</a>&nbsp;
			</c:if>
			<c:if test="${map.pager.curPage < map.pager.totPage}">
				<a href="#" 
				onclick="list('${map.pager.totPage}')">[끝]</a>
			</c:if>
</div>

<div >
<form name="form1" method="post"
	action="${path}/notice_qna/list.do">
		<select name="search_option">
		<option value="subject" 
<c:if test="${map.search_option == 'subject'}">selected</c:if>
		>제목</option>
		<option value="content" 
<c:if test="${map.search_option == 'content'}">selected</c:if>
		>내용</option>
		<option value="id" 
<c:if test="${map.search_option == 'id'}">selected</c:if>
		>작성자</option>
		
	</select>
	<input type="hidden" name="category" id="category" value="qna">
	<input name="keyword" value="${map.keyword}">
	<input type="submit" value="조회">
</form>
</div>
</div>
 
</body>
</html>