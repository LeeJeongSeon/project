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
	location.href="${path}/event/list.do";
}
</script>
<link rel="stylesheet" href="../include/event.css">
<style type="text/css">
#body {
	font-family: HYKANM;
}

header {
	font-size: 25px;
	font-weight: bold;
	padding-left: 30px;
}

a:link, a:visited {
	text-decoration: none;
	color: black;
}
</style>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<div id="body">
	<header>
		문화행사 목록
	</header>
	<fieldset> 
		<legend>Search Zone</legend>
		<form name="form1" method="post" action="${path}/event/list.do">
			<select name="search_option">
				<option value="e_name" <c:if test="${map.search_option == 'e_name'}">selected</c:if>>이름</option>
				<option value="e_agency" <c:if test="${map.search_option == 'e_agency'}">selected</c:if>>기관</option>
				<option value="e_place" <c:if test="${map.search_option == 'e_place'}">selected</c:if>>장소</option>
				<option value="all" <c:if test="${map.search_option == 'all'}">selected</c:if>>전체</option>
			</select>
			<input name="keyword" value="${map.keyword}" placeholder="검색어를 이곳에 입력해주세요! ex) OO도서관 / OOO 교수">
			<button>조회</button>
		</form>
	</fieldset>
	<div id="table">
		<table>
			<tr>
				<th class="tb1_col1">기관명</th>
				<th class="tb1_col2">멘토</th>
				<th class="tb1_col3">행사명</th>
				<th class="tb1_col4">시작일</th>
				<th class="tb1_col5">마감일</th>
				<th class="tb1_col6">장소</th>
				<th class="tb1_col7"> </th>
			</tr>
		</table>
		<table>
			<c:forEach var="dto" items="${map.list}">
				<tr>
					<td class="tb1_col1">${dto.e_agency}</td>
					<td class="tb1_col2">${dto.e_instr}</td>
					<td class="tb1_col3">${dto.e_name}</td>
					<td class="tb1_col4">${dto.e_start_d}</td>
					<td class="tb1_col5">${dto.e_finish_d}</td>
					<td class="tb1_col6">${dto.e_place}</td>
					<td class="tb1_col7"><button type="button" onclick="location.href='${path}/event/view.do?e_num=${dto.e_num}'">이동</button></td>
				</tr>
			</c:forEach>
		</table>
		<table>
			<tr>
				<td colspan="8" align="center">
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
								<a style="color:red;">${num}</a>
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
	</div>
	<div align="center">
		이미 신청한 행사의 내용을 수정하거나, 신청 취소를 희망하실 경우 클릭하세요 
		<button type="button" onclick="checkEmail()">확인</button>
	</div>
</div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>
