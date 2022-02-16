<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript">
function checkEmail() {
	var e_email=prompt("행사 신청하실 때 입력한 이메일을 입력해주세요", "");
	location.href="${path}/event/checkEmail.do?e_email="+e_email;
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
		문화 행사
	</header>
	<div id="table">
		<table class="tb2"> 
			<tr>
				<th style="font-size: 20px;">${dto.e_name}</th>
				<td align="right" style="width: 8%;">				
					<span>조회수 ${dto.e_read_cnt}</span>
				</td>
			</tr>
		</table>
		<table class="tb2">
			<tr align="right">
				<td colspan="2"></td>
			</tr>
			<tr align="left">
				<td>
					<b>강 사</b> | ${dto.e_instr} <br><br>
					<b>주최 기관</b> | ${dto.e_agency}
				</td>
				<td>
					<b>행사 장소</b> | ${dto.e_place} <br><br>
					<b>시작 시간</b> | ${dto.e_start_t}
				</td>
			</tr>
			<tr>
				<td colspan="2" style="padding: 30px;">${dto.e_intro}</td>
			</tr>
		</table>
		<table class="tb2">
			<tr>
				<th>행사시작일</th>
				<td>${dto.e_start_d}</td>
				<th>행사마감일</th>
				<td>${dto.e_finish_d}</td>
			</tr>
		</table>
	</div>
	<footer align="center">
	이미 신청한 행사의 내용을 수정하거나, 신청 취소를 희망하실 경우 클릭하세요 
	<button type="button" onclick="checkEmail()">확인</button>
	</footer><br>
	<div align="center">
		목록으로 돌아가시겠습니까?
		<button type="button" onclick="location.href='${path}/event/list.do'">확인</button>
	</div>
</div>
</body>
</html>
