<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Insert title here</title>


<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<%@ include file="../include/header.jsp"%>

<style type="text/css">
#find_id{
 width: 500px;
 margin: auto;
}



</style>

</head>
<body>
	<%@ include file="../include/menu.jsp"%>
	<div class="w3-content w3-container w3-margin-top" id="find_id">
		<div class="w3-container w3-card-4">
			<form name="form1" action="${path}/member/find_id.do" method="post">
				<div class="w3-center w3-large w3-margin-top">
					<h3>아이디 찾기</h3>
				</div>
				<div>
					<p>
						<label>이름</label> <input class="w3-input" type="text"
							id="name" name="name" required>
					</p>

					<p>
						<label>Email</label> <input class="w3-input" type="text"
							id="email" name="email" required>
					</p>
					<p class="w3-center">
						<button type="submit" id=findBtn
							class="btn btn-lg btn-success btn-block">아이디 찾기</button>
						<button type="button" onclick="history.go(-1);"
							class="btn btn-lg btn-success btn-block">로그인</button>
					</p>
				</div>
			</form>
		</div>
	</div>


<%@ include file="../include/footer.jsp" %>
</body>
</html>