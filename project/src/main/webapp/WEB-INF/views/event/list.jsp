<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript">
function list(page) {
	location.href="${path}/event/list.do?curPage="+page;
} 

function checkEmail() {
	var e_email=prompt("행사 신청하실 때 입력한 이메일을 입력해주세요", "");
	location.href="${path}/event/checkEmail.do?e_email="+e_email;
}

if(${param.message=='no'}) {
	alert("잘못 입력된 이메일이거나 신청하신 행사가 없습니다.");
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
<fieldset> 검색하기
	<form name="form1" method="post" action="${path}/event/list.do">
		<select name="search_option">
			<option value="e_name" <c:if test="${map.search_option == 'e_name'}">selected</c:if>>이름</option>
			<option value="e_agency" <c:if test="${map.search_option == 'e_agency'}">selected</c:if>>기관</option>
			<option value="e_place" <c:if test="${map.search_option == 'e_place'}">selected</c:if>>장소</option>
			<option value="all" <c:if test="${map.search_option == 'all'}">selected</c:if>>전체</option>
		</select>
		<input name="keyword" value="${map.keyword}">
		<input type="submit" value="조회">
	</form>
</fieldset>
행사 페이지
<table>
	<tr>
		<th>기관명</th>
		<th>강사</th>
		<th>행사명</th>
		<th>시작일</th>
		<th>마감일</th>
		<th>장소</th>
		<th>조회수</th>
	</tr>
	<c:forEach var="dto" items="${map.list}">
		<c:if test="${dto.e_result==1}">
			<tr>
				<td>${dto.e_agency}</td>
				<td>${dto.e_instr}</td>
				<td>${dto.e_name}</td>
				<td>${dto.e_start_d}</td>
				<td>${dto.e_finish_d}</td>
				<td>${dto.e_place}</td>
				<td>${dto.e_read_cnt}</td>
				<td><input type="button" onclick="location.href='${path}/event/view.do?e_num=${dto.e_num}'" value="이동"></td>
			</tr>
		</c:if>
	</c:forEach>
	<tr>
		<td colspan="7" align="center">
			<c:if test="${map.pager.curBlock > 1}">
				<a href="#" onclick="list('1')">[처음]</a>
			</c:if>
			<c:if test="${map.pager.curBlock > 1}">
				<a href="#" onclick="list('${map.pager.prevPage}')">
				[이전]</a>
			</c:if>
			<c:forEach var="num" 
				begin="${map.pager.blockStart}"
				end="${map.pager.blockEnd}">
				<c:choose>
					<c:when test="${num == map.pager.curPage}">
						<span style="color:red;">${num}</span>
					</c:when>
					<c:otherwise>
						<a href="#" onclick="list('${num}')">${num}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${map.pager.curBlock < map.pager.totBlock}">
				<a href="#" 
				onclick="list('${map.pager.nextPage}')">[다음]</a>
			</c:if>
			<c:if test="${map.pager.curPage < map.pager.totPage}">
				<a href="#" 
				onclick="list('${map.pager.totPage}')">[끝]</a>
			</c:if>
		</td>
	</tr>
</table>
<footer align="center">
이미 신청한 행사의 내용을 수정하거나, 신청 취소를 희망하실 경우 클릭하세요! 
<input type="button" onclick="checkEmail()" value="확인">
</footer>
</body>
</html>
