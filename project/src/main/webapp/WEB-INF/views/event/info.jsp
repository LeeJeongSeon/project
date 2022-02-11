<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
</head>
<body>
<%@ include file="../include/eventMenu.jsp" %>
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
			<th>행사 시작일</th>
			<td>${dto.e_start_d}</td>
			<th>행사 마감일</th>
			<td>${dto.e_finish_d}</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td colspan="3">${dto.e_email}</td>
		</tr>
		<tr align="center">
			<td colspan="4">
				<input type="button" value="수정">
				<input type="button" value="삭제">
			</td>
		</tr>
	</table>
</body>
</html>