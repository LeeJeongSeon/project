<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript">
function r_delete(er_num) {
	if(confirm("정말 삭제하시겠습니까?")) {
		location.href="${path}/event_reply/delete.do?er_num="+er_num;
	}
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
		관리자용 문화행사 전체댓글 목록
	</header>
	<div id="table">
		<table>
			<tr>
				<th>댓글번호</th>
				<th>행사번호</th>
				<th>아이디</th>
				<th>내용</th>
				<th>수정</th>
				<th>등록 일자/시간</th>
				<th> </th>
			</tr>
			<c:forEach var="dto" items="${list2}">
				<tr>
					<td>${dto.er_num}</td>
					<td>${dto.er_e_num}</td>
					<td>${dto.er_userid}</td>
					<td>${dto.er_content}</td>
					<td>
						<c:if test="${dto.er_change==0}">N</c:if>
						<c:if test="${dto.er_change==1}">Y</c:if>
					</td>
					<td>${dto.er_date}</td>
					<td><button onclick="r_delete(${dto.er_num})">삭제</button></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>