<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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


<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	function check() {
		//아이디 체크
		var userid = $("#userid").val();
		if (userid == "") {
			alert("아이디는 필수 입력입니다.");
			$("#userid").focus();
			return;
		}
		//이메일 체크
		var email = $("#email").val();
		if (email == "") {
			alert("이메일을 입력하세요.");
			$("#email").focus();
			return;
		}
		document.form1.submit();
	}
</script>
<style type="text/css">
.mybtn {
	width: 150px;
	height: 40px;
	padding: 0;
	display: inline;
	border-radius: 4px;
	background: #212529;
	color: #fff;
	margin-top: 20px;
	border: solid 2px #212529;
	transition: all 0.5s ease-in-out 0s;
}

.mybtn:hover .mybtn:focus {
	background: white;
	color: #212529;
	text-decoration: none;
}
</style>
</head>
<body>
	<%@ include file="../include/menu.jsp"%>
	<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4 w3-auto"
			style="width: 382px; height: 456.3px;">
			<div class="w3-center w3-large w3-margin-top">
				<h3>비밀번호 찾기</h3>
			</div>
			<div>
				<form name="form1" id="form1" method="post"
					action="${path}/member/passwd.do">
					<p>
						<label>아이디</label> <input class="w3-input" type="text" id="userid"
							name="userid" placeholder="아이디를 입력하세요" required>
					<p>
						<label>이메일</label> <input class="w3-input" type="text" id="email"
							name="email" placeholder="이메일주소를 입력하세요" required>
					</p>
					<c:if test="${message == 'ok'}">
						<div style="color: blue;">이메일로 비밀번호를 보냈습니다. 이메일을 확인해주세요.</div>
					</c:if>
					<c:if test="${message == 'error'}">
						<div style="color: red;">아이디, 이메일을 잘못입력 하셨습니다.</div>
					</c:if>
					<br>
					<p class="w3-center">
						<button type="button" onclick="check()"
							class="btn btn-lg btn-success btn-block">비밀번호
							찾기</button>
						<a href="${path}/member/login.do"><button type="button"
								class="btn btn-lg btn-success btn-block">로그인</button></a>
					</p>
				</form>
			</div>
		</div>
	</div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>