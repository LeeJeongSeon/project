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
    function daumZipCode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("address1").value = extraAddr;
                } else {
                    document.getElementById("address2").value = '';
                }
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode;
                document.getElementById("address1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("address2").focus();
            }
        }).open();
    }
    
$(function(){
	$("#btnUpdate").click(function(){
		
		document.form1.action="${path}/member/update.do";
		document.form1.submit();
	});
	$("#btnDelete").click(function(){
		if(confirm("삭제하시겠습니까?")){
			document.form1.action="${path}/member/delete.do";
			document.form1.submit();
		}
	});

});    
</script>
<style type="text/css">
table{
 width: 70%;
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
  <td>아이디</td>
  <td><input name="userid" value="${dto.userid}" readonly class="form-control"> </td>
 </tr>
 <tr>
  <td>비밀번호</td>
  <td><input type="password" name="passwd" id="passwd" class="form-control"> </td>
 </tr>
 <tr>
  <td>이름</td>
  <td><input name="name" value="${dto.name}" class="form-control"> </td>
 </tr>
 <tr>
  <td>핸드폰번호</td>
  <td><input name="phone" value="${dto.phone}" class="form-control"> </td>
 </tr>
 <tr>
  <td>이메일</td>
  <td><input name="email" value="${dto.email}" class="form-control"> </td>
 </tr>
 <tr>
  <td>우편번호</td>
  <td id="zipcode"><input name="zipcode" id="zipcode" value="${dto.zipcode}" readonly class="form-control" style="width: 40%; display: inline;">
  <input type="text" onclick="daumZipCode()" value="우편번호 찾기" class="btn btn-success">
  </td>
 </tr>
 <tr>
  <td>도로명주소</td>
  <td><input name="address1" id="address1" value="${dto.address1}" class="form-control">   </td>
 </tr>
 <tr>
  <td>상세주소</td>
  <td><input name="address2" id="address2" value="${dto.address2}" class="form-control"> </td>
 </tr>
 <tr>
  <td>회원가입일자</td>
  <td id="join_date">
   
    <fmt:formatDate value="${join_date}" 
    pattern="yyyy-MM-dd"/>
  
   
  </td>
 </tr>
 <tr>
 <td colspan="2"><div style="color: red;">${message}</div><br></td>
 </tr>
 
 <tr>
  <td colspan="2" align="center">
  <a href="${path}/member/pwUpdateView.do"> <button type="button" class="btn btn-lg btn-success btn-block">비밀번호 수정</button></a>
   <input type="button" value="회원정보 수정" id="btnUpdate" class="btn btn-lg btn-success btn-block" >
   <input type="button" value="회원탈퇴" id="btnDelete" class="btn btn-lg btn-success btn-block" >
  
  </td>
 </tr>
</table>
</form>

<%@ include file="../include/footer.jsp" %>
</body>
</html>
                    