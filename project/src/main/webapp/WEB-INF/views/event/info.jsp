<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript">
function show(e_num) {
	$.ajax({
		type: "post",
		url: "${path}/event/details.do?e_num="+e_num,
		success: function(result){
			$("#div1").html(result);
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
</style>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<div id="body">
	<header>
		문화행사 내용 수정/삭제
	</header>
	<div id="table">
		<table>
			<tr>
				<th>번호</th>
				<th>행사명</th>
				<th>주최기관</th>
				<th>신청상태</th>
			</tr>
			<c:forEach var="dto" items="${list}">
				<tr>
					<td style="width: 5%">${dto.e_num}</td>
					<td>${dto.e_name}</td>
					<td>${dto.e_agency}</td>
					<td>
						<c:if test="${dto.e_result==0}">대기</c:if>
						<c:if test="${dto.e_result==1}">승인</c:if>
						<c:if test="${dto.e_result==2}">반려</c:if>
						<c:if test="${dto.e_result==3}">취소</c:if>
					</td>
					<td style="width: 5%">
						<button type="button" onclick="show(${dto.e_num})">보기</button>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<marquee style="color: red;">※ 대기, 승인, 반려, 취소 상태의 행사는 신청자가 변경 가능하며 관리자가 삭제 처리한 행사는 열람/변경이 불가능합니다.</marquee>
	<hr>
	<div style="width: 100%;" id="div1"></div>
</div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>