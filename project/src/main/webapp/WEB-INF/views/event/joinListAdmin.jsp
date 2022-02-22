<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript">
function showMem(e_num) {
	$.ajax({
		url: "${path}/event_join/joinMember.do",
		type: "post",
		data: "ej_num="+e_num,
		success: function(result) {
			$("#memberDiv").html(result);
		}
	});
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
				<th>회원 명단</th>
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
					<td><button type="button" onclick="showMem(${dto.e_num})">열람</button></td>
				</tr>
			</c:forEach>
		</table><br>
		<span>참여인원이 뜨지 않는 행사는 참여한 인원이 아직 없는 행사입니다.</span>
	</div>
	<div id="memberDiv"></div>
</div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>