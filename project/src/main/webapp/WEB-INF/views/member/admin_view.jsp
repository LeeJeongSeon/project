<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 보기</title>
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

</body>
</html>