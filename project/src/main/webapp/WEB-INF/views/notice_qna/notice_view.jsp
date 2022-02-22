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
<style type="text/css">
button{margin: 5px;}
table{ border-collapse:collapse; }
th,td{border-bottom: 1px solid gray;}
#main{width: 100%; }
#side{
float:left;
padding-left:6%;
 width: 13%;
 height: 200px;
}
#sidemenu1{list-style: none;
padding: 0px;
}
.noticemenu,.qnamenu{padding: 0.7em;
 border-bottom: 1px solid gray;
}
#content{

float:right;
width: 80%;
}
a{text-decoration: none;}
.qnamenu:hover {
	background: #ff8533;
	color: white;
}
#footer{clear:both;}
#btn{text-align: right;}
</style>
<link rel="stylesheet" href="../include/event.css">
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<div id="main">
<div id="side">
<h3>이용자게시판</h3>
 <ul id="sidemenu1">
  <li class="noticemenu" style="background: #ff8533; "><a class="noticemenu" style="color: white;" href="${path}/notice_qna/list.do?category=notice">공지사항</a></li>
  <li class="qnamenu" ><a class="qnamenu" href="${path}/notice_qna/list.do?category=qna">묻고답하기</a></li>
 </ul>
</div>
<div id="content">
<h2>공지사항</h2>
<table style="border-top: 3px solid black;">
 <tr>
  <th colspan="3">${dto.subject}</th>
 </tr>
 <tr>
  <td>작성일 <fmt:formatDate value="${dto.reg_date}" pattern="yyyy-MM-dd HH:mm:ss"/> | 작성자 ${dto.id} 조회 ${dto.readcount}</td>
 
 </tr>
 <tr>
  <td >${dto.content}</td>
 </tr>
</table>
<div id="btn">
 <c:if test="${adminCk == 1 }">
 <button type="button" id="noticeY" onclick="noticeY()" >헤제</button>
 <button type="button" id="noticeN" onclick="noticeN()" >고정</button>
 <button type="button" id="btnDelete">삭제</button>
 <button type="button" id="btnUpdate">수정</button>
 </c:if>
 <!-- 위에는 관리자만  -->
 <button type="button" id="btnList">목록</button>
 </div>
</div>
</div>
 <%@ include file="../include/footer.jsp" %>

</body>
</html>