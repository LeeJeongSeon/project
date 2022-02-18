<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript">
$(function () {
	$("#btnUpdate").click(function () {
		if($("#er_content").val()=="") {
			if(confirm("댓글에 내용을 입력하지 않고 수정하면 삭제됩니다. \n삭제하시겠습니까?")) {
				location.href="${path}/event_reply/delete.do?er_num="+${map.dto2.er_num}+"&er_e_num="+${map.dto.e_num};
			}
		} else {
			document.form1.submit();
		}
	});
});
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
</style>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<div id="body">
	<header>
		문화행사 세부사항
	</header>
	<div id="table">
		<table class="tb2"> 
			<tr>
				<th id="title">${map.dto.e_name}</th>
				<td align="right" style="width: 8%;">				
					조회수 ${map.dto.e_read_cnt}<br>
					댓글수 ${map.dto.e_reply_cnt}
				</td>
			</tr>
		</table>
		<table class="tb2">
			<tr align="left">
				<td>
					<b>강 사</b> | ${map.dto.e_instr} <br><br>
					<b>주최 기관</b> | ${map.dto.e_agency} <br><br>
					<b>참여 인원</b> | ${map.dto.e_join_p} 명 <br><br>
					<b>행사 분야</b> | 
						<c:choose>
							<c:when test="${map.dto.e_genre==1}">소설 시 희곡</c:when>
							<c:when test="${map.dto.e_genre==2}">사회 정치</c:when>
							<c:when test="${map.dto.e_genre==3}">인문</c:when>
							<c:when test="${map.dto.e_genre==4}">경제 경영</c:when>
							<c:when test="${map.dto.e_genre==5}">자연과학</c:when>
						</c:choose>
				</td>
				<td>
					<b>행사 장소</b> | ${map.dto.e_place} <br><br>
					<b>시작 시간</b> | ${map.dto.e_start_t} <br><br>
					<b>최대 인원</b> | ${map.dto.e_max_p} 명 <br><br>
					<b>진행일</b> | ${map.dto.e_days} 일
				</td>
			</tr>
			<tr>
				<td colspan="2" style="padding: 30px;">${map.dto.e_intro}</td>
			</tr>
		</table>
		<table class="tb2">
			<tr>
				<th>행사시작일</th>
				<td>${map.dto.e_start_d}</td>
				<th>행사마감일</th>
				<td>${map.dto.e_finish_d}</td>
			</tr>
		</table>
	</div>
	<form name="form1" method="post" action="${path}/event_reply/update.do">
		<fieldset>
			<legend>
				<b>댓글 수정</b>
			</legend>
			<div align="center">
				<input type="hidden" name="er_num" value="${map.dto2.er_num}">
				<input type="hidden" name="er_e_num" value="${map.dto2.er_e_num}">
				${sessionScope.userid}
				<textarea style="width: 92%; height: 20px; vertical-align: bottom;" name="er_content" id="er_content">${map.dto2.er_content}</textarea>
				<button type="button" id="btnUpdate">수정</button>
			</div>
		</fieldset>
	</form>
	<div id="replyList"></div>
	<footer align="center">
	이미 신청한 행사의 내용을 수정하거나, 신청 취소를 희망하실 경우 클릭하세요 
	<button type="button" onclick="checkEmail()">확인</button>
	</footer><br>
	<div align="center">
		목록으로 돌아가시겠습니까?
		<button type="button" onclick="location.href='${path}/event/list.do'">확인</button>
	</div>
</div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>