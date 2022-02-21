<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript">
function list(page) {
	location.href="${path}/event/joinList.do?curPage="+page;
} 
</script>
<link rel="stylesheet" href="../include/event.css">
<style type="text/css">
#body {
	font-family: HYKANM;
}

header {
	font-size: 25px;
	font-weight: bold;
	padding-left: 30px;
}

a:link, a:visited {
	text-decoration: none;
	color: black;
}
</style>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<div id="body">
	<header>
		문화행사 참여신청
	</header>
	<div id="table">
		<table>
			<tr>
				<th>행사명</th>
				<th>강사</th>
				<th>참여인원</th>
				<th>최대인원</th>
				<th>신청</th>
				<th> </th>
			</tr>
			<c:forEach var="dto" items="${map.list}">
				<tr>
					<td>${dto.e_name}</td>
					<td>${dto.e_instr}</td>
					
					<td>${dto.e_max_p}</td>
					<td><button type="button" onclick="location.href='${path}/event/viewJoin.do?e_num=${dto.e_num}'">이동</button></td>
				</tr>
			</c:forEach>
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
								<a style="color:red;">${num}</a>
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
	</div>
	<span style="color: red;">※ 관리자가 행사 삭제 처리 시 데이터가 완전히 지워지게 됩니다.</span>
</div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>