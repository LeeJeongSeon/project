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

function send(address) {
	var message=$("#message").val();
	while(message.indexOf("\n")!=-1) {
		message=message.replace("\n"," ");
	}
	var data="?senderName="+${dto.e_num}+"&receiveMail="+address
			+"&subject="+$("#subject").val()+"&message="+message;
	location.href="${path}/email/sendEventResult.do"+data;
	alert("이메일 발송에 성공했습니다.");
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
			<th>행사 시작일</th>
			<td>${dto.e_start_d}</td>
			<th>행사 마감일</th>
			<td>${dto.e_finish_d}</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td colspan="3">${dto.e_email}</td>
		</tr>
		<c:if test="${dto.e_result==0}">
			<tr align="center">
				<td colspan="4">
					<input type="button" value="승인" onclick="result(1)">
					<input type="button" value="반려" onclick="result(2)">
				</td>
			</tr>
		</c:if>
		<c:if test="${dto.e_result!=0}">
			<tr align="center">
				<td colspan="4">
					해당 행사는 [
					<c:choose>
						<c:when test="${dto.e_result==1}">승인</c:when>
						<c:when test="${dto.e_result==2}">반려</c:when>
						<c:when test="${dto.e_result==3}">취소</c:when>
					</c:choose>
					] 상태입니다. 
					<c:if test="${dto.e_result>1}">
						<br>신청 내역을 삭제하시겠습니까? 
						<input type="button" onclick="location.href='${path}/event/delete.do?e_num=${dto.e_num}'" value="확인">
					</c:if>
				</td>
			</tr>
		</c:if>
	</table>
	<c:if test="${dto.e_result==0}">
		<fieldset>
			<legend>이메일 작성 폼</legend>
			<div style="padding: 2% 5%;">
				<input style="width: 100%" id="subject" value="안녕하세요 도서관입니다."><br><br>
				<textarea rows="15" style="width: 100%;" id="message">행사 신청 결과를 안내해드립니다.

신청하신 행사가 불가피하게 하단의 사유로 인해 반려되었습니다.

첫 번째 사유 : 
두 번째 사유 : 

신청에 감사드리며 다른 시간대 혹은 장소로 재 신청하시길 바랍니다.

더불어 반려 상태의 행사는 관리자가 무통보 삭제 처리할 수 있음을 알려드립니다.

감사합니다. 좋은 하루 되세요 :)</textarea> <br>
				<button type="button" onclick="send('${dto.e_email}')">보내기</button>
			</div>
		</fieldset>
	</c:if>
</body>
</html>
