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
			<td>${dto.e_email}</td>
		</tr>
	</table>
	<div>
	이메일 보내기
	<textarea>안녕하세요 OO도서관입니다.
신청하신 행사는...</textarea> <br>
	<input type="button" onclick="send()" value="보내기">
	</div>
	<div>
		<input type="button" value="행사 승인처리" onclick="location.href='${path}/event/approve.do?e_num=${dto.e_num}'">
	</div>
</body>
</html>
