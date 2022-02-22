<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="../include/event.css">
<style type="text/css">
.button{
	width:100px;
	height:40px;
}
</style>
<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#btnList").click(function() {
		location.href="/project/HopeBook/list.do";
	});
 	$("#btnReply").click(function() {
 		document.form1.action="${path}/HopeBook/reply.do";
		document.form1.submit(); 
	}); 
	
});
</script>
<style type="text/css">
.input{
	border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;
}
*{
	font-size: 20px;
}
</style>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<h2>희망도서 페이지</h2>
<div style="text-align: center;">
   <c:forEach var="row" items="${list}" varStatus="status">
   <p><b>============================================================================</b></p>
   <p><b>${status.count}번째</b></p>
   <table style="width:100%; text-align: center;">
    <tr>
     <td width="width:30%;">제목</td>
     <td><input id="hopeBook_title" name="hopeBook_title" class="input" value="${row.hopeBook_title}" readonly></td>
    </tr>
    <c:if test="${status.first}"> <c:set var="userid" value="${row.hopeBook_userid}"></c:set>
    <tr>
     <td>신청자</td>
     <td><input id="name" name="name" class="input" value="${row.name}" readonly></td>
    </tr>
    <tr>
     <td>신청도서 제목</td>
     <td><input id="hopeBook_bookname" name="hopeBook_bookname" class="input" value="${row.hopeBook_bookname}" readonly></td>
    </tr>
     <tr>
     <td>신청도서 저자</td>
     <td><input id="hopeBook_author" name="hopeBook_author" class="input" value="${row.hopeBook_author}" readonly></td>
    </tr>
    <tr>
     <td>신청사유</td>
     <td>${row.hopeBook_content}
     <c:if test="${row.filename!=null}">
		<img src="../images/${row.filename}">
	 </c:if>
	 </td>
    </tr>
   </c:if>
   <c:if test="${!status.first}">
   <tr>
     <td>답변</td>
     <td>${row.hopeBook_content}</td>
    </tr>
   </c:if>
   </table>
   </c:forEach>
   
   <form id="form1" name="form1" method="post" action="${path}/HopeBook/replay.do">
			<c:forEach var="list" items="${list}" varStatus="status">
				<c:if test="${status.last}">
					<input type="hidden" id="hopeBook_title" name="hopeBook_title" value="${list.hopeBook_title}">
					<input type="hidden" id="name" name="name" value="${list.name}">
					<input type="hidden" id="hopeBook_bookname" name="hopeBook_bookname" value="${list.hopeBook_bookname}">
					<input type="hidden" id="hopeBook_author" name="hopeBook_author" value="${list.hopeBook_author}">
					<input type="hidden" id="hopeBook_content" name="hopeBook_content" value="${list.hopeBook_content}">
				    <input type="hidden" id="hopeBook_id" name="hopeBook_id" value="${list.hopeBook_id}">
				    <input type="hidden" id="hopeBook_userid" name="hopeBook_userid" value="${sessionScope.userid}"> 
				    <input type="hidden" name="ref" id="ref" value="${list.ref}">
				    <input type="hidden" name="re_level" id="re_level" value="${list.re_level}">
				    <input type="hidden" name="hopeBook_id" id="hopeBook_id" value="${list.hopeBook_id}">
				</c:if>
			</c:forEach>
   <c:if test="${sessionScope.userid eq 'admin'}">
    <input type="button" value="답변" id="btnReply" class="button">
   </c:if>
   
<%--     <c:if test="${sessionScope.userid eq userid}">
    <input type="button" value="답변" id="btnReply" class="button">
   </c:if> --%>
   
   <input type="button" value="목록" id="btnList" class="button">  
   </form>
</div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>