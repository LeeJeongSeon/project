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
<header>
	참여회원 명단
</header>
<div id="table">
	<table>
		<tr>
			<th>이름</th>
			<th>번호</th>
			<th>주소</th>
			<th>이메일</th>
		</tr>
		<c:forEach var="dto" items="${list}">
			<tr>
				<td>${dto.name}</td>
				<td>${dto.phone}</td>
				<td>
					<c:choose>
						<c:when test="${dto.address1==null}">
							-
						</c:when>
						<c:otherwise>
							${dto.address1}
						</c:otherwise>
					</c:choose>
				</td>
				<td>${dto.email}</td>
			</tr>
		</c:forEach>
	</table>
</div>
</body>
</html>