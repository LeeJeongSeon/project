<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<style type="text/css">
fieldset {
	margin: 10px;
}
</style>
</head>
<body>
<%@ include file="../include/eventMenu.jsp" %>
행사 관리 페이지 <br>
<fieldset>
	<form name="form1" method="post" action="${path}/event/listAdmin.do">
		신청상태 <select name="search_option">
			<option value="waiting" <c:if test="${map.search_option == 'waiting'}">selected</c:if>>대기</option>
			<option value="reject" <c:if test="${map.search_option == ''}">selected</c:if>>반려</option>
			<option value="approve" <c:if test="${map.search_option == 'approve'}">selected</c:if>>승인</option>
			<option value="all" <c:if test="${map.search_option == 'all'}">selected</c:if>>전체</option>
		</select> 
		이미 끝난 행사도 포함하시겠습니까? <input type="checkbox" name="past">
		<input type="submit" value="확인">
	</form>
</fieldset>
<table>
	<tr>
		<th>번호</th>
		<th>기관명</th>
		<th>행사명</th>
		<th>신청상태</th>
	</tr>
	<c:forEach var="dto" items="${list}">
		<tr>
			<td>${dto.e_num}</td>
			<td>${dto.e_agency}</td>
			<td>${dto.e_name}</td>
			<td>
				<c:if test="${dto.e_result==0}">대기</c:if>
				<c:if test="${dto.e_result==1}">승인</c:if>
				<c:if test="${dto.e_result==2}">반려</c:if>
			</td>
			<td><input type="button" onclick="location.href='${path}/event/viewAdmin.do?e_num=${dto.e_num}'" value="이동"></td>
		</tr>
	</c:forEach>
</table>
</body>
</html>