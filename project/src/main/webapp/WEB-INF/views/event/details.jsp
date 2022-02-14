<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
</head>
<script type="text/javascript">
	function update() {
		if ($("#e_agency").val() == "") {
			alert("주최하는 기관명을 입력해주세요.");
			$("#e_agency").focus();

		} else if ($("#e_instr").val() == "") {
			alert("강사명을 입력해주세요.");
			$("#e_instr").focus();

		} else if ($("#e_email").val() == "") {
			alert("이메일이 입력되지 않았거나 올바른 형식이 아닙니다.");
			$("#e_email").focus();

		} else if ($("#e_name").val() == "") {
			alert("행사명을 입력해주세요.");
			$("#e_name").focus();

		} else if ($("#e_place").val() == "") {
			alert("희망 행사 장소을 입력해주세요.");
			$("#e_place").focus();

		} else if ($("#e_intro").val() == "") {
			alert("행사 소개글을 입력해주세요.");
			$("#e_intro").focus();

		} else if ($("#e_start_d").val() == "") {
			alert("행사 시작일을 입력해주세요.");
			$("#e_start_d").focus();

		} else if ($("#e_finish_d").val() == "") {
			alert("행사 마감일을 입력해주세요.");
			$("#e_finish_d").focus();

		} else {
			if (checkDate()) {
				if(${dto.e_result!=0}) {
					var result="";
					switch (${dto.e_result}) {
					case 1:
						result="승인";
						break;
					case 2:
						result="반려";
						break;
					case 3:
						result="취소";
						break;
					}
					if(${dto.e_result>0}) {
						if(confirm("해당 행사는 [ "+result+" ] 상태입니다. \n변경하실 경우 [ 대기 ] 상태로 변경됩니다. 동의하십니까?")) {
							document.form1.submit();
							alert("변경이 완료되었습니다.\n이메일을 확인해주세요!");						
						}	
					} else {
						document.form1.submit();
						alert("변경이 완료되었습니다.\n이메일을 확인해주세요!");
					}
				}
			}
		}
	}

	function checkDate() {
		/* 현재년월일 */
		var currentDate = new Date();

		/* 시작년월일 */
		var start = $("#e_start_d").val();
		var s_Year = start.substr(0, 4);
		var s_Month = start.substr(5, 2);
		var s_Date = start.substr(8);
		var startDate = new Date(s_Year, s_Month - 1, s_Date);

		/* 마감년월일 */
		var finish = $("#e_finish_d").val();
		var f_Year = finish.substr(0, 4);
		var f_Month = finish.substr(5, 2);
		var f_Date = finish.substr(8);
		var finishDate = new Date(f_Year, f_Month - 1, f_Date);

		if (currentDate > startDate) {
			alert("시작일이 잘못 입력되었습니다.");
		} else if (currentDate < startDate) {
			if (confirm(s_Year + "년 " + s_Month + "월 " + s_Date + "일 "
					+ $('#e_start_t').val() + "에 시작하는 행사가 맞습니까?")) {
				if (startDate > finishDate) {
					alert("행사 마감일을 행사 시작일보다 늦게 입력할 수 없습니다.");
				} else {
					if (confirm(f_Year + "년 " + f_Month + "월 " + f_Date
							+ "일에 마감하는 행사가 맞습니까?")) {
						return true;
					}
				}
			}
		}
	}
	
	function cancel() {
		if(confirm("정말 행사 신청을 취소하시겠습니까? \n취소 후에는 되돌릴 수 없습니다. ")) {
			location.href="${path}/event/cancel.do?e_num=${dto.e_num}&e_name=${dto.e_name}&e_email=${dto.e_email}";
			alert("취소가 완료되었습니다. 이전 페이지로 이동합니다.");
		}
	}
</script>
<body>
	<form action="${path}/event/update.do" name="form1" >
		<table>
			<tr>
				<th>행사명</th>
				<td colspan="3"><input name="e_name" id="e_name" value="${dto.e_name}"></td>
			</tr>
			<tr>
				<th>주최기관</th>
				<td><input name="e_agency" id="e_agency" value="${dto.e_agency}"></td>
				<th>강사</th>
				<td><input name="e_instr" id="e_instr" value="${dto.e_instr}"></td>
			</tr>
			<tr>
				<td colspan="4"><textarea name="e_intro" id="e_intro"
						placeholder="행사에 대해 소개해주세요!">${dto.e_intro}</textarea></td>
			</tr>
			<tr>
				<th>희망 행사장소</th>
				<td><input name="e_place" id="e_place" value="${dto.e_place}"></td>
				<th>시작 시간</th>
				<td><select name="e_start_t" id="e_start_t">
						<%
						for (int i = 8; i < 20; i++) {
						%>
						<option value="<%=i%>:00" 
							<c:if test="${dto.e_start_t}==i+':00'">
							selected</c:if>
						><%=i%>:00</option>
						<%
						}
						%>
				</select></td>
			</tr>
			<tr>
				<th>행사 시작일</th>
				<td><input type="date" name="e_start_d" id="e_start_d" value="${dto.e_start_d}"></td>
				<th>행사 마감일</th>
				<td><input type="date" name="e_finish_d" id="e_finish_d" value="${dto.e_finish_d}"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td colspan="3"><input type="email" name="e_email" id="e_email" value="${dto.e_email}"></td>
			</tr>
			<tr align="center">
				<td colspan="4">
				<input type="hidden" value="${dto.e_num}" name="e_num">
					<input type="button" onclick="update()" value="변경">
					<input type="button" onclick="cancel()" value="취소">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>