<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<script>

$(function(){
	$("#btnUpdate").click(function(){
		//비밀번호 확인 체크
		var passwd1 = $("#passwd1").val();
		var passwd2 = $("#passwd2").val();
		if (passwd1 != passwd2) {
			alert("비밀번호가 맞는지 확인해주세요.");
			$("#passwd1").focus();
			return;
		}
		
		document.form1.action="${path}/member/pwUpdate.do";
		document.form1.submit();
	});

});    


</script>



<style type="text/css">
table{
 width: 50%;
 margin:auto;
 border: solid;
 border-color: green;
 border-width: 2px;
 
}

tr,td{
border: none;
text-align: center;
}

#zipcode{
 text-align: left;
}

#join_date{
 text-align: left;
}

</style>
</head>
<body>
<%@ include file="../include/menu.jsp" %>

<h2 align="center">회원정보 수정</h2>
<form name="form1" method="post">
<table>
 <tr>
  
  <td colspan="2"><input name="userid" value="${sessionScope.userid}"  class="form-control" hidden="hidden"> </td>
 </tr>
 <tr>
  <td>현재 비밀번호</td>
  <td><input type="password" name="passwd" id="passwd" class="form-control"> </td>
 </tr>
 <tr>
  <td>새로운 비밀번호</td>
  <td><input type="password" name="passwd1" id="passwd1" class="form-control"> </td>
 </tr>
 <tr>
  <td>새로운 비밀번호 확인</td>
  <td><input type="password" name="passwd2" id="passwd2" class="form-control"> </td>
 </tr>
 <tr>
  <td colspan="2">
  <c:if test="${message == 'error'}">
 <div style="color:red;"> 현재 비밀번호를 확인하세요.
 </div>
</c:if>
  </td>
 </tr>
 <tr>
  <td colspan="2" align="center">
   <input type="button" value="비밀번호 수정" id="btnUpdate" class="btn btn-lg btn-success btn-block" >
   
  </td>
 </tr>
</table>
</form>

<%@ include file="../include/footer.jsp" %>
</body>
</html>