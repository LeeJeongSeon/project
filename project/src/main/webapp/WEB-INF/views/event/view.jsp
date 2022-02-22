<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript">
$(function() {
	comment_list();
	$("#btnSave").click(function() {
		var param = "er_e_num=${dto.e_num}&userid=${sessionScope.userid}"
			+"&content=" + $("#content").val();
		$.ajax({
			type : "post",
			url : "${path}/event_reply/insert.do",
			data : param,
			success : function() {
				$("#content").val("");
				comment_list();
			}
		});
	});
});

function comment_list() {
	$.ajax({
		type : "post",
		url : "${path}/event_reply/list.do",
		data : "er_e_num=${dto.e_num}",
		success : function(result) {
			$("#replyList").html(result);
		}
	});
}

function checkEmail() {
	var e_email=prompt("행사 신청하실 때 입력한 이메일을 입력해주세요", "");
	location.href="${path}/event/checkEmail.do?e_email="+e_email;
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
				<th id="title">${dto.e_name}</th>
				<td align="right" style="width: 8%;">				
					조회수 ${dto.e_read_cnt}<br>
					댓글수 ${dto.e_reply_cnt}
				</td>
			</tr>
		</table>
		<table class="tb2">
			<tr align="left">
				<td>
					<b>강 사</b> | ${dto.e_instr} <br><br>
					<b>주최 기관</b> | ${dto.e_agency} <br><br>
					<b>참여 인원</b> | ${dto.e_join_p} 명 <br><br>
					<b>행사 분야</b> | 
						<c:choose>
							<c:when test="${dto.e_genre==1}">소설 시 희곡</c:when>
							<c:when test="${dto.e_genre==2}">사회 정치</c:when>
							<c:when test="${dto.e_genre==3}">인문</c:when>
							<c:when test="${dto.e_genre==4}">경제 경영</c:when>
							<c:when test="${dto.e_genre==5}">자연과학</c:when>
						</c:choose>
				</td>
				<td>
					<b>행사 장소</b> | ${dto.e_place} <br><br>
					<b>시작 시간</b> | ${dto.e_start_t} <br><br>
					<b>최대 인원</b> | ${dto.e_max_p} 명 <br><br>
					<b>진행일</b> | ${dto.e_days} 일
				</td>
			</tr>
			<tr>
				<td colspan="2" style="padding: 30px;">${dto.e_intro}</td>
			</tr>
		</table>
		<table class="tb2">
			<tr>
				<th>행사시작일</th>
				<td>${dto.e_start_d}</td>
				<th>행사마감일</th>
				<td>${dto.e_finish_d}</td>
			</tr>
		</table>
	</div>
	<div align="center">
		해당 행사에 참여하시겠습니까? 
		<button type="button" onclick="location.href='${path}/event/joinEvent.do?e_num=${dto.e_num}'">이동</button>
	</div>
	<fieldset>
		<legend>
			<b>댓글 달기</b>
		</legend>
		<c:choose>
			<c:when test="${sessionScope.userid==null}">
				로그인 후 이용 가능한 서비스입니다. 
			</c:when>
			<c:otherwise>
				<div align="center">
					${sessionScope.userid}
					<textarea style="width: 92%; height: 20px; vertical-align: bottom;" id="content"></textarea>
					<button type="button" id="btnSave">등록</button>
				</div>
			</c:otherwise>
		</c:choose>
	</fieldset>
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
