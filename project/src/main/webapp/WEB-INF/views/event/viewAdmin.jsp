<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript">
function result (e_num, r_num) {
	location.href="${path}/event/result.do?e_num="+e_num+"&e_result="+r_num;
}
</script>
<style type="text/css">
fieldset {
	margin: 10px;
}
</style>
</head>
<body>
<%@ include file="../include/eventMenu.jsp" %>
	행사 관리 상세보기 페이지
	<table> 
		<tr>
			<th>행사명</th>
			<td colspan="3">${dto.e_name}</td>
		</tr>
		<tr>
			<th>주최 기관</th>
			<td>${dto.e_agency}</td>
			<th>강사</th>
			<td>${dto.e_instr}</td>
		</tr>
		<tr>
			<td colspan="4">${dto.e_intro}</td>
		</tr>
		<tr>
			<th>희망 행사장소</th>
			<td>${dto.e_place}</td>
			<th>시작 시간</th>
			<td>${dto.e_start_t}</td>
		</tr>
		<tr>
			<th>행사시작일</th>
			<td>${dto.e_start_d}</td>
			<th>행사마감일</th>
			<td>${dto.e_finish_d}</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td colspan="3">${dto.e_email}</td>
		</tr>
		<tr align="center">
			<td colspan="4">
				<input type="button" value="승인" onclick="result(${dto.e_num}, 1)">
				<input type="button" value="반려" onclick="result(${dto.e_num}, 2)">
			</td>
		</tr>
	</table>
	<fieldset>
	<div>
	이메일 보내기
	<textarea rows="5">안녕하세요 OO도서관입니다.
신청하신 행사는...</textarea> <br>
	<input type="button" onclick="send()" value="보내기">
	</div>
	</fieldset>
</body>
</html>
