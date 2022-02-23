<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<title>회원정보 보기</title>
<%@include file="../include/header.jsp"%>
<script type="text/javascript">
	$(function() {
		$.ajax({
			url : "${path}/member/adminList.do?userid=${dto.userid}",
			type : "post",

			success : function(result) {
				$("#result1").html(result);
			}
		});

	});
</script>

<style type="text/css">
@charset "UTF-8";

body {
	color: #444;
	width: 1260px;
	margin-left: 5px;
}

@media screen and (min-width: 1270px) {
	body {
		position: absolute;
		left: 50%;
		transform: translateX(-50%);
	}
}

table {
	background-color: #fff;
	width: 70%;
	margin: auto;
	text-align: center;
}
</style>

</head>
<body>
	<%@ include file="../include/menu.jsp"%>
	<h2>회원정보 보기</h2>
	<form name="form1" method="post">
		<table border="1px;">
			<tr>
				<td>아이디</td>
				<td>${dto.userid}</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>${dto.name}</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>${dto.email}</td>
			</tr>
			<tr>
				<td>우편번호</td>
				<td>${dto.zipcode}</td>
			</tr>
			<tr>
				<td>도로명주소</td>
				<td>${dto.address1}</td>
			</tr>
			<tr>
				<td>상세주소</td>
				<td>${dto.address2}</td>
			</tr>
			<tr>
				<td>회원가입일자</td>
				<td id="join_date"><fmt:formatDate value="${join_date}"
						pattern="yyyy-MM-dd" /></td>
			</tr>

		</table>
	</form>
	<br>

	<div align="center">
		<a href="${path}"><button type="button"
				class="btn btn-lg btn-success btn-block">메인</button></a> <a
			href="${path}/member/admin_view.do"><button type="button"
				class="btn btn-lg btn-success btn-block">회원 리스트</button></a>


	</div>

	<h2>도서 대출 정보</h2>
	<div id="result1"></div>

</body>
</html>
