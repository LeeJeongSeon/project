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
	$("#btnEnter").click(function() {
		alert("ㅇㅇ");
		if($("#e_agency").val()==null) {
			alert("주최하는 기관명을 입력해주세요.");
			$("#e_agency").focus();
		}
		if($("#e_name").val()==null) {
			alert("행사명을 입력해주세요.");
			$("#e_name").focus();
		}
		if($("#e_intro").val()==null) {
			alert("행사 소개글을 입력해주세요.");
			$("#e_intro").focus();
		}
		document.form1.commit();
		alert("신청이 완료되었습니다.\n이메일을 확인해주세요!");
	});
});
</script>
</head>
<body>
행사신청 페이지
<form method="post" name="form1" action="${path}/event/insert.do">
	<table>
		<tr>
			<th>주최 기관명</th>
			<td colspan="3"><input name="e_agency" id="e_agency"></td>
		</tr>
		<tr>
			<th>강사</th>
			<td colspan="3"><input name="e_instr" id="e_instr"></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td colspan="3"><input name="e_email" id="e_email"></td>
		</tr>
		<tr>
			<th>행사명</th>
			<td colspan="3"><input name="e_name" id="e_name"></td>
		</tr>
		<tr>
			<td colspan="4">
				<textarea name="e_intro" id="e_intro" placeholder="행사에 대해 소개해주세요!"></textarea>
			</td>
		</tr>
		<tr>
			<td>행사 시작일</td>
			<td><input type="date" name="e_start_d" id="e_start_d"></td>
			<td>행사 마감일</td>
			<td><input type="date" name="e_finish_d" id="e_finish_d"></td>
		</tr>
		<tr>
			<td colspan="4">
				<input type="button" id="btnEnter" value="신청하기">
			</td>
		</tr>
	</table>
</form>
</body>
</html>
