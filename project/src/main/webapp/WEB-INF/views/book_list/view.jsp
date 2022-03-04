<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>
<link rel="stylesheet" href="../include/event.css">
<script type="text/javascript">
$(function(){
	$("#updatebtn").click(function(){
		location.href="${path}/book/book_edit.do?id="+$("#book_id").val();
	});
	
	$("#back_btn").click(function(){
		history.go(-1);
	});
	
	$("#rent_btn").click(function(){
 		var param="book_id="+$("#book_id").val(); 
 		
 		if(${sessionScope.userid==null}){
 			if(confirm("로그인 후 대출가능합니다.")) {
 				location.href="${path}/member/login.do";
 			}
 		}else if(${dto.book_check!=0}){
 			alert("대출불가능한 도서입니다.");
 		}else{
 			$.ajax({
			type: "post",
			url: "${path}/rent/insert.do",
			data: param,
			success : function(){
				alert("대출되었습니다");
				location.href="${path}/rent/list.do";
				}
			}); 
 		}
	});
});
</script>
</head>
<body>
	<%@ include file="../include/menu.jsp"%>
	<section style="width: 100%; text-align: center;">
	<h2>책 상세정보</h2>
	<table>
		<tr height="50">
		<td rowspan="7" width="30%;">
			<c:choose>
			<c:when test="${dto.book_img==null}">
			<img src="../images/etc.jpg" style="width:300px;">
			</c:when>
			<c:when test="${fn:contains(dto.book_img,'http')}">
			<img src="${dto.book_img}" style="width:300px;">
			</c:when>
			<c:otherwise>
			<img src="../images/${dto.book_img}" style="width:300px;">
			</c:otherwise>
			</c:choose>
		</td>
			<td width="20%;"></td>
			<td width="50%;"><b>${dto.book_name}</b></td>
		</tr>
		<tr height="50" >
			<td>장르</td>
			<td>${dto.book_genre}</td>
		</tr>
		<tr height="50">
			<td >저자</td>
			<td>${dto.book_author}</td>
		</tr>
		<tr height="50">
			<td>출판사</td>
			<td>${dto.book_publisher}</td>
		</tr>
		<tr>
			<td>청구기호</td>
			<td>${dto.book_callName}</td>
		</tr>
		<tr >
				<td>대출가능여부</td>
				<td>
				<c:choose>
						<c:when test="${dto.book_check==0}">
					      <p style="color: blue;">대출가능</p>
					     </c:when>
						<c:when test="${dto.book_check==-1}">
					      분실
					     </c:when>
						<c:otherwise>
					      <p style="color: red;">대출불가</p> 
					     </c:otherwise>
					</c:choose>
					</td>
		</tr>
		<tr>
		 <td>반납예정일</td>
		 <c:if test="${dto.bday!=null}">
		 <td><fmt:formatDate value="${dto.bday}" pattern="yyyy-MM-dd HH시 mm분"/></td>
		 </c:if>
		</tr>
		<tr>
			<td  colspan="3">${dto.book_content}</td>
		</tr>	
		</table>

	<input type="hidden" id="book_id" name="book_id" value="${dto.book_id}">
	
	<button type="button" id="rent_btn">대출</button>
	<button type="button" id="back_btn">목록</button>
	
	<c:if test="${sessionScope.userid eq 'admin'}">
		<button type="button" id="updatebtn">수정</button>
	</c:if>
	</section>
<%@ include file="../include/footer.jsp" %>
</body>
</html>