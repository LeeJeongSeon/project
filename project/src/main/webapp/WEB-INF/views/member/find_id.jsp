<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>

<script>
	$(function(){
		$("#loginBtn").click(function(){
			location.href='${path}/member/login.do';
		})
	})
	
	$(function(){
		$("#pwBtn").click(function(){
			location.href='${path}/member/findpw.do';
		})
	})
</script>

<style type="text/css">
#find_id{
 width: 500px;
 margin: auto;
}

</style>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<div class="w3-content w3-container w3-margin-top" id="find_id">
		<div class="w3-container w3-card-4">
			<div class="w3-center w3-large w3-margin-top">
				<h3>아이디 찾기</h3>
			</div>
			<div>
			    <h4>고객님의 아이디는</h4>
				<input name="userid" value="${dto.userid} 입니다." readonly class="form-control">
				<br>
				<p class="w3-center">
					<button type="button" id="pwBtn" class="btn btn-lg btn-success btn-block">비밀번호 찾기 </button>
					<button type="button" id="loginBtn" class="btn btn-lg btn-success btn-block">로그인</button>
			        
				</p>
			</div>
		</div>
	</div>

<%@ include file="../include/footer.jsp" %>
</body>
</html>