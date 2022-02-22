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
		location.href="${path}/notice_qna/list.do?category=notice";
	});
	$("#btnWrite").click(function(){
		location.href="${path}/notice_qna/write.do?category=notice";
	});
});
function list(page){
	location.href="${path}/notice_qna/list.do?curPage="+page
			+"&category=notice";
}
</script>
<style type="text/css">
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

table{ border-collapse:collapse; 
    background-color: #fff;
	width: 100%;
	border-top: 1px solid #aaa;
	border-bottom: 1px solid #aaa;}
th,td{border-bottom: 1px solid gray;
padding: 5px;}
#pageNv{
 display: inline;
 margin-left: 430px;
}
#btn{ text-align: right;}
#search{margin-left: 300px;}
#main{width: 100%; }
#side{
float:left;
padding-left:6%;
 width: 13%;
 height: 200px;
}
#sidemenu1{list-style: none;
padding: 0px;
}
.noticemenu,.qnamenu{padding: 0.7em;
 border-bottom: 1px solid gray;
}
#content{
float:right;
width: 80%;
}
a{text-decoration: none;}
.qnamenu:hover {
	background: #ff8533;
	color: white;
}
#footer{clear:both;}
button {
	width: 50px;
	height: 25px;
	background-color: #fff;
	color: #666;
	border: 1px solid #999;
	font-weight: bold;
	margin: 5px;
}
#th_1{width: 7%;}
#th_2{width: 70%;}
#th_3{width: 6%;}
#th_4{width: 10%;}
#th_5{width: 5%; }


</style>

</head>
<body>
<%@ include file="../include/menu.jsp" %>
<div id="main">
<div id="side">
<h3>이용자게시판</h3>
 <ul id="sidemenu1">
  <li class="noticemenu" style="background: #ff8533; "><a class="noticemenu" style="color: white;" href="${path}/notice_qna/list.do?category=notice">공지사항</a></li>
  <li class="qnamenu" ><a class="qnamenu" href="${path}/notice_qna/list.do?category=qna">묻고답하기</a></li>
 </ul>
</div>
<div id="content" >
<div id="article" >
<h2>공지사항</h2 >
전체<strong>${map.count}</strong> 개
<table style="border-top: 3px solid black;">
<tr >
 <th id="th_1">번호</th>
 <th id="th_2">제목</th>
 <th id="th_3">글쓴이</th>
 <th id="th_4">등록일</th>
 <th id="th_5">조회</th>
</tr>
<c:forEach var="row2" items="${map.noticeList}">
<tr>
 <td id="td_1">[공지]</td>
 <td id="td_2"><a href="${path}/notice_qna/view.do?num=${row2.num}&category=${row2.category}">${row2.subject}</a></td>
 <td id="td_3">${row2.id }</td>
  <td id="td_4"><fmt:formatDate value="${row2.reg_date }" pattern="yyyy.MM.dd"/></td>
  <td id="td_1" style="text-align: center;">${row2.readcount}</td>
</tr>
</c:forEach>

 <c:forEach var="row" items="${map.list}">
 <tr >
  <td>${row.num}</td>
  <td>
  <a href="${path}/notice_qna/view.do?num=${row.num}&category=${row.category}"> ${row.subject}</a></td>
  <td>${row.id }</td>
  <td><fmt:formatDate value="${row.reg_date }" pattern="yyyy.MM.dd"/></td>
  <td style="text-align: center;">${row.readcount}</td>
 </tr>
 </c:forEach >
</table >
</div>

<div id="btn">
<!-- 관리자일때만 -->
<c:if test="${adminCk==1 }">
<button type="button" id="btnWrite">공지</button>
 </c:if>
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
<div id="search">
<form name="form1" method="post"
	action="${path}/notice_qna/list.do">
		<select name="search_option">
		<option value="subject" 
<c:if test="${map.search_option == 'subject'}">selected</c:if>
		>제목</option>
		<option value="content" 
<c:if test="${map.search_option == 'content'}">selected</c:if>
		>내용</option>
		
	</select>
	<input type="hidden" name="category" id="category" value="notice">
	<input name="keyword" value="${map.keyword}">
	<button>검색</button>
</form>
</div>
</div>
</div>
<%@ include file="../include/footer.jsp" %>


</body>
</html>