<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript">
function r_delete(er_num, er_e_num) {
	if(confirm("정말 삭제하시겠습니까?")) {
		location.href="${path}/event_reply/delete.do?er_num="+er_num+"&er_e_num="+er_e_num;
	}
}
</script>
</head>
<body>
<div id="table">
	<header style="font-size: 18px;">
		댓글 목록
	</header><br>
	<table>
		<tr>
			<td>댓글을 작성해보세요!</td>
		</tr>
	</table>
	<c:forEach var="dto" items="${list2}">
		<table>
			<tr>
				<td> </td>
				<td align="left">
					${dto.er_userid} | 
					<a id="content${dto.er_num}">${dto.er_content}</a>
					<c:if test="${dto.er_change==1}">(수정)</c:if>
				</td>
				<td align="right">${dto.er_date}</td>
				<td> </td>
			</tr>
			<c:if test="${sessionScope.userid==dto.er_userid}">
				<tr>
					<td colspan="4">
						<button type="button" onclick="location.href='${path}/event_reply/change.do?target=${dto.er_num}&er_e_num=${dto.er_e_num}'">수정</button>
						<button type="button" onclick="r_delete(${dto.er_num}, ${dto.er_e_num})">삭제</button>
					</td>
				</tr>
			</c:if>
		</table>
	</c:forEach>
</div>
</body>
</html>
