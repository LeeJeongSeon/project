<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 보기</title>

<script type="text/javascript">
$(function(){
	$.ajax({
		url: "${path}/member/adminList.do?userid=${dto.userid}",
		type: "post",
		 
		success: function(result){
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

fieldset {
	margin: 10px 20px 10px 20px;
	border: 2px solid #666;
	padding-right: 40px; 
	vertical-align: middle;
}


table {
	background-color: #fff;
	width: 100%;
	border-top: 1px solid #aaa;
	border-bottom: 1px solid #aaa;
	text-align: center;
}

th, td {
	padding: 1px 2px;
}

.tb1_col1 {
	width: 280px;
}

.tb1_col2 {
	width: 260px;
}

.tb1_col3 {
	width: 258px;
}

.tb1_col4 {
	width: 86px;
}

.tb1_col5 {
	width: 86px;
}

.tb1_col6 {
	width: 176px;
}

.tb1_col7 {
	width: 60px;
}

.tb2 td {
	padding: 10px;
}

#table {
	background-color: #fff2e6;
	border-radius: 30px;
	padding: 2% 2% 3% 2%;
	margin-top: 30px;
	margin-bottom: 30px;
}

select {
	margin-left: 30px;
	width: 60px;
	height: 25px;
}


textarea {
	height: 200px;
}

</style>

</head>
<body>
<%@ include file="../include/menu.jsp" %>
<h2>회원정보 보기</h2>
<form name="form1" method="post">
<table border="1" style="width: 100%">
 <tr>
  <td>아이디</td>
  <td><input name="userid" value="${dto.userid}" readonly> </td>
 </tr>
 <tr>
  <td>이름</td>
  <td><input name="name" value="${dto.name}"> </td>
 </tr>
 
 <tr>
  <td>이메일</td>
  <td><input name="email" value="${dto.email}"> </td>
 </tr>
 <tr>
  <td>우편번호</td>
  <td> <input name="zipcode" id="zipcode" value="${dto.zipcode}" readonly>
  </td>
 </tr>
 <tr>
  <td>도로명주소</td>
  <td><input name="address1" id="address1" value="${dto.address1}">   </td>
 </tr>
 <tr>
  <td>상세주소</td>
  <td><input name="address2" id="address2" value="${dto.address2}"> </td>
 </tr>
 <tr>
  <td>회원가입일자</td>
  <td>
   <c:if test="${join_date != null }">
    <fmt:formatDate name="join_date" value="${join_date}" pattern="yyyy-MM-dd HH:mm:ss"/>
   </c:if>
  </td>
 </tr>
  
</table>
</form>

<h2>도서 대출 정보</h2>
<div id="result1"></div>

</body>
</html>
