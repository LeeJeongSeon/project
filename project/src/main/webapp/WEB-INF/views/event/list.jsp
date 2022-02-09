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
행사 페이지
<table>
	<tr>
		<th>번호</th>
		<th>기관명</th>
		<th>강사</th>
		<th>행사명</th>
		<th>시작일</th>
		<th>마감일</th>
		<th>장소</th>
		<th>조회수</th>
	</tr>
	<c:forEach var="dto" items="${list}">
		<c:if test="${dto.e_result==1}">
			<tr>
				<td>${dto.e_num}</td>
				<td>${dto.e_agency}</td>
				<td>${dto.e_instr}</td>
				<td>${dto.e_name}</td>
				<td>${dto.e_start_d}</td>
				<td>${dto.e_finish_d}</td>
				<td>${dto.e_place }</td>
				<td>${dto.e_read_cnt}</td>
				<td><input type="button" onclick="location.href='${path}/event/view.do?e_num=${dto.e_num}'" value="이동"></td>
			</tr>
		</c:if>
	</c:forEach>
</table>
</body>
</html>
