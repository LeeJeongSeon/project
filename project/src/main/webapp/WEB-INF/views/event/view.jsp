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
			<th>행사시작일</th>
			<td><fmt:formatDate value="${dto.e_start_d}" pattern="yyyy-MM-dd"/></td>
			<th>행사마감일</th>
			<td><fmt:formatDate value="${dto.e_finish_d}" pattern="yyyy-MM-dd"/></td>
		</tr>
	</table>
</body>
</html>
