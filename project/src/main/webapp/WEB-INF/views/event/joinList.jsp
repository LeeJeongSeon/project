<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript">
if(${sessionScope.userid==null}) {
	if(confirm("로그인 후 사용할 수 있는 서비스입니다. \n로그인 페이지로 이동하시겠습니까?")) {
		location.href="${path}/member/login.do";
	}
}

if(location.href.indexOf("event_join/insert.do")!=-1) {
	location.replace("${path}/event/joinList.do");
}

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
				<th>번호</th>
				<th>행사명</th>
				<th>강사</th>
				<th>참여 인원</th>
				<th>최대 인원</th>
				<th>행사 분야</th>
				<th>신청</th>
			</tr>
			<c:forEach var="dto" items="${map.list}">
				<tr>
					<td>${dto.e_num}</td>
					<td>${dto.e_name}</td>
					<td>${dto.e_instr}</td>
					<td>
						<c:forEach var="dto2" items="${map.list2}">
							<c:if test="${dto.e_num==dto2.ej_num}">${dto2.ej_join_p}명</c:if>
						</c:forEach>
					</td>
					<td>${dto.e_max_p}명</td>
					<td>
						<c:choose>
							<c:when test="${dto.e_genre==1}">소설 / 시 / 희곡</c:when>
							<c:when test="${dto.e_genre==2}">사회 / 정치</c:when>
							<c:when test="${dto.e_genre==3}">인문</c:when>
							<c:when test="${dto.e_genre==4}">경제 / 경영</c:when>
							<c:when test="${dto.e_genre==5}">자연과학</c:when>
						</c:choose>
					</td>
					<td><button type="button" onclick="location.href='${path}/event/joinEvent.do?e_num=${dto.e_num}'">이동</button></td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="8" align="center">
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
		</table><br>
		<span>참여인원이 뜨지 않는 행사는 참여한 인원이 아직 없는 행사입니다.</span>
	</div>
</div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>