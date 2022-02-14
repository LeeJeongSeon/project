<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

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
	
	/* $("#hopeBook_content").summernote({
		width: 500,
		height: 200
	}); */
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
<h2>희망도서 상세페이지</h2>
<div style="text-align: center;">
   <c:forEach var="row" items="${list}" varStatus="status">
   <p><b>============================================================================</b></p>
   <p><b>${status.count}번째</b></p>
   <table style="width:100%; text-align: center;">
    <tr>
     <td width="width:30%;">제목</td>
     <td><input id="hopeBook_title" name="hopeBook_title" class="input" value="${row.hopeBook_title}" readonly></td>
    </tr>
    <c:if test="${status.first}">
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
     <td>${row.hopeBook_content}</td>
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
				    <input type="hidden" id="hopeBook_userid" name="hopeBook_userid" value="admin"> 
				    <input type="hidden" name="ref" id="ref" value="${list.ref}">
				    <input type="hidden" name="re_level" id="re_level" value="${list.re_level}">
				    <input type="hidden" name="hopeBook_id" id="hopeBook_id" value="${list.hopeBook_id}">
				</c:if>
			</c:forEach>
   <c:if test="${sessionScope.userid eq 'admin'}">
    <input type="button" value="답변" id="btnReply">
   </c:if>
   <input type="button" value="목록" id="btnList">  
   </form>
</div>
<%-- 
임시2: ${list[0].hopeBook_title} <br>
임시3: ${list[0]} --%>
</body>
</html>