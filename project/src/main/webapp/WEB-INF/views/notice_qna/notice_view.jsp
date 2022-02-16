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
		location.href="${path}/notice_qna/list.do?category=notice";
	});
	$("#btnDelete").click(function(){
		if(confirm("정말 삭제하시겠습니까?")){
		location.href="${path}/notice_qna/delete.do?num="+${dto.num}
		+"&category=notice";
		}else{
			return;
		}
		});
	$("#btnUpdate").click(function(){
		location.href="${path}/notice_qna/updateView.do?num="+${dto.num};
	});
});
function noticeN(){
	var result="n";
	location.href="${path}/notice_qna/noticeNY.do?notice="+result
			+"&num="+${dto.num};
}
function noticeY(){
	var result="y";
	location.href="${path}/notice_qna/noticeNY.do?notice="+result
			+"&num="+${dto.num};
}
</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<h2>공지사항</h2>
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
<div>
 <input type="button" id="noticeY" onclick="noticeY()" value=" 공지고정헤체">
 <input type="button" id="noticeN" onclick="noticeN()" value="공지고정">
 <button type="button" id="btnDelete">삭제</button>
 <button type="button" id="btnUpdate">수정</button>
 <!-- 위에는 관리자만  -->
 <button type="button" id="btnList">목록</button>
</div>
 <%@ include file="../include/footer.jsp" %>

</body>
</html>