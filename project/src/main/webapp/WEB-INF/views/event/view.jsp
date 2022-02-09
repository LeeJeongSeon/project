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
	행사 상세보기 페이지
	<table> 
		<tr>
			<th>행사명</th>
			<td>${dto.e_name}</td>
			<th>조회수</th>
			<td>${dto.e_read_cnt}</td>
		</tr>
	</table>
	<table>
		<tr>
			<th>강사</th>
			<td>${dto.e_instr}</td>
			<th>주최 기관</th>
			<td>${dto.e_agency}</td>
		</tr>
		<tr>
			<td colspan="4">${dto.e_intro}</td>
		</tr>
		<tr>
			<th>행사 장소</th>
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
	</table>
</body>
</html>
