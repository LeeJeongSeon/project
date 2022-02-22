<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>


<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>

<script type="text/javascript">
$(function(){
$("#btnLogin").click(function(){
 var userid=$("#userid").val();
 var passwd=$("#passwd").val(); 
 if(userid == ""){
  alert("아이디를 입력하세요");
  $("#userid").focus(); //입력포커스 이동

  return; //함수 종료
}
if(passwd==""){
 alert("비밀번호를 입력하세요"); 
 $("#passwd").focus();
  return;
}
//폼 내부의 데이터를 전송할 주소
 document.form1.action= "${path}/member/login_check.do";
 document.form1.submit(); //제출
 });
});


</script>

<style type="text/css">

table{
 width: 300px;
 margin: auto;
 border: solid;
 border-color: green;
 border-width: 2px;
 
}

tr,td{
border: none;
text-align: center;
}


</style>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<h2 align="center">로그인</h2>
<form name="form1" method="post">
<table border="none" width="400px">
<tr>
 <td>ID</td>
 <td><input id="userid" name="userid" class="form-control" placeholder="아이디"></td>
</tr>
<tr>
 <td>pw</td>
 <td><input type="password" id="passwd" name="passwd" class="form-control" placeholder="비밀번호"></td>
</tr>
<tr>
 <td colspan="2">
 <button type="button" id="btnLogin" class="btn btn-lg btn-success btn-block" style="width: 100;">로그인 </button>
 <c:if test="${message == 'error'}">
 <div style="color:red;"> 아이디 또는 비밀번호가 일치하지 않습니다.
 </div>
</c:if>
<c:if test="${message == 'logout'}">
 <div style="color:red;"> 로그아웃되었습니다.
 </div>
</c:if>
<c:if test="${message == 'pwUpdate'}">
 <div style="color:red;"> 비밀번호가 변경되었습니다. 다시 로그인해주세요.
 </div>
</c:if>
</td>
</tr>
</table>
<br>
<div align="center">
<a href="${path}/member/find_id_form.do">아이디찾기</a> |
<a href="${path}/member/findpw.do">비밀번호찾기</a> |
<a href="${path}/member/write.do">회원가입</a> |


</div>


</form>




<%@ include file="../include/footer.jsp" %>

</body>
</html>