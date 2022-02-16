<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript">
$(function(){
	$("#btnList").click(function(){
		location.href="${path}/notice_qna/list.do?category=qna";
	});
	$("#btnDelete").click(function(){
		if(confirm("정말 삭제하시겠습니까?")){
		location.href="${path}/notice_qna/delete.do?num="+${dto.num}
		+"&category=qna";
		}else{
			return;
		}
		});
	$("#btnUpdate").click(function(){
		location.href="${path}/notice_qna/updateView.do?num="+${dto.num};
	});
	$("#btnReply").click(function(){
		location.href="${path}/notice_qna/replyView.do?num="+${dto.num};
	});
});

</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<h2>묻고답하기</h2>
<form name="form1" method="post" >
<table>
 <tr>
  <th>${dto.subject}</th>
 </tr>
 <tr>
  <td>작성일 <fmt:formatDate value="${dto.reg_date}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
  <td>작성자 ${dto.id}</td>
  <td>조회 ${dto.readcount}</td>
 </tr>
 <tr>
  <td>${dto.content}</td>
 </tr>
</table>
</form>
<div>
 <button type="button" id="btnReply">답하기</button>
 <!--위 관리자만  -->
 <button type="button" id="btnDelete">삭제</button>
 <button type="button" id="btnUpdate">수정</button>
 <!-- 위에는 작성자만  -->
 <button type="button" id="btnList">목록</button>
</div>
 <%@ include file="../include/footer.jsp" %>
</body>
</html>