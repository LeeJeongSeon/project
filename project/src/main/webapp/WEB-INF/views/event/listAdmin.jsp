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
	location.href="${path}/event/listAdmin.do?curPage="+page;
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
		관리자용 문화행사 목록
	</header>
	<fieldset>
		<legend>선택 조회</legend>
		<form name="form1" method="post" action="${path}/event/listAdmin.do">
			<select name="list_option">
				<option value="waiting" <c:if test="${map.list_option == 'waiting'}">selected</c:if>>대기</option>
				<option value="reject" <c:if test="${map.list_option == 'reject'}">selected</c:if>>반려</option>
				<option value="approve" <c:if test="${map.list_option == 'approve'}">selected</c:if>>승인</option>
				<option value="cancel" <c:if test="${map.list_option == 'cancel'}">selected</c:if>>취소</option>
				<option value="all" <c:if test="${map.list_option == 'all'}">selected</c:if>>전체</option>
			</select> 
			이미 끝난 행사는 제외하시겠습니까? <input type="checkbox" name="past" style="width: 30px; vertical-align: middle;"
			<c:if test="${map.past == 'on'}">checked</c:if>>
			<button>확인</button>
		</form>
	</fieldset>
	<div id="table">
		<table>
			<tr>
				<th>번호</th>
				<th>기관명</th>
				<th>행사명</th>
				<th>신청상태</th>
			</tr>
			<c:forEach var="dto" items="${map.list}">
				<tr>
					<td>${dto.e_num}</td>
					<td>${dto.e_agency}</td>
					<td>${dto.e_name}</td>
					<td>
						<c:if test="${dto.e_result==0}">대기</c:if>
						<c:if test="${dto.e_result==1}">승인</c:if>
						<c:if test="${dto.e_result==2}">반려</c:if>
						<c:if test="${dto.e_result==3}">취소</c:if>
					</td>
					<td><button type="button" onclick="location.href='${path}/event/viewAdmin.do?e_num=${dto.e_num}'">이동</button></td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="5" align="center">
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