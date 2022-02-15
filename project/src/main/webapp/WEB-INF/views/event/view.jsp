<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="../include/event.css">
</head>
<body>
<%@ include file="../include/menu.jsp" %>
	<div id="table">
		<table> 
			<tr>
				<th class="tb2_col1">행사명</th>
				<td class="tb2_col2">${dto.e_name}</td>
				<th class="tb2_col3">조회수</th>
				<td class="tb2_col4">${dto.e_read_cnt}</td>
			</tr>
			<tr>
				<th class="tb2_col1">강사</th>
				<td class="tb2_col2">${dto.e_instr}</td>
				<th class="tb2_col3">주최 기관</th>
				<td class="tb2_col4">${dto.e_agency}</td>
			</tr>
			<tr>
				<td colspan="4">${dto.e_intro}</td>
			</tr>
			<tr>
				<th class="tb2_col1">행사 장소</th>
				<td class="tb2_col2">${dto.e_place}</td>
				<th class="tb2_col3">시작 시간</th>
				<td class="tb2_col4">${dto.e_start_t}</td>
			</tr>
			<tr>
				<th class="tb2_col1">행사시작일</th>
				<td class="tb2_col2">${dto.e_start_d}</td>
				<th class="tb2_col3">행사마감일</th>
				<td class="tb2_col4">${dto.e_finish_d}</td>
			</tr>
		</table>
	</div>
</body>
</html>
