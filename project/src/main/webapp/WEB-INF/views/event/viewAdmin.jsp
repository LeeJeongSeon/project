<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript">
function result (r_num) {
	if(r_num==2) {
		if(!confirm("해당 행사를 반려하실 경우 사유를 이메일을 통해 알려야합니다.\n이메일 전송이 완료되었습니까?")) {
			alert("이메일로 행사 반려 사유를 알려주세요!");
			$("#subject").focus();
			return;
		}
	}
	location.href="${path}/event/result.do?e_num=${dto.e_num}&e_result="+r_num;
}

function send() {
	var message=$("#message").val();
	while(message.indexOf("\n")!=-1) {
		message=message.replace("\n"," ");
	}
	var data="?senderName="+${dto.e_num}+"&receiveMail=${dto.e_email}"
			+"&subject="+$("#subject").val()+"&message="+message;
	location.href="${path}/email/sendEventResult.do"+data;
	alert("이메일 발송에 성공했습니다.");
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

td {
	text-align: left;
}
</style>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<div id="body">
	<header>
		관리자용 문화행사 상세보기
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
		<c:if test="${dto.e_result==0}">
			<div align="center" style="margin-top: 20px;">
				<button type="button" onclick="result(1)">승인</button>
				<button type="button" onclick="result(2)">반려</button>
			</div>
		</c:if>
		<c:if test="${dto.e_result!=0}">
			<div align="center" style="margin-top: 20px;">
				해당 행사는 [
				<c:choose>
					<c:when test="${dto.e_result==1}">승인</c:when>
					<c:when test="${dto.e_result==2}">반려</c:when>
					<c:when test="${dto.e_result==3}">취소</c:when>
				</c:choose>
				] 상태입니다. 
				<c:if test="${dto.e_result>1}">
					신청 내역을 삭제하시겠습니까? 
					<button type="button" onclick="location.href='${path}/event/delete.do?e_num=${dto.e_num}&e_name=${dto.e_name}&e_email=${dto.e_email}'">확인</button>
				</c:if>
			</div>
		</c:if>
	</div>
	<c:if test="${dto.e_result==0}">
		<fieldset>
			<legend>이메일 작성 폼</legend>
			<div align="center" style="padding: 2% 5%;">
				<input style="width: 100%; margin: 0;" id="subject" value="안녕하세요 도서관입니다."><br><br>
				<textarea rows="15" style="width: 100%;" id="message">행사 신청 결과를 안내해드립니다.

신청하신 행사가 불가피하게 하단의 사유로 인해 반려되었습니다.

첫 번째 사유 : 
두 번째 사유 : 

신청에 감사드리며 다른 시간대 혹은 장소로 재 신청하시길 바랍니다.

더불어 반려 상태의 행사는 관리자가 무통보 삭제 처리할 수 있음을 알려드립니다.

감사합니다. 좋은 하루 되세요 :)</textarea><br><br>
				<button type="button" onclick="send()">전송</button>
			</div>
		</fieldset>
		<div align="center" style="margin: 20px;">
			반려 사유를 상세히 적어주세요!
		</div>
	</c:if>
</div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>
