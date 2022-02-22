<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/header.jsp" %>
<link rel="shortcut icon" href="#">
<link rel="stylesheet" href="../include/event.css">
<style type="text/css">
button{
	width:100px;
}
</style>
<script type="text/javascript">
$(function(){
	$(".checkBtn").click(function(){
		var str = ""
		//var tdArr = new Array();	
		var checkBtn = $(this);
		
		var tr = checkBtn.parent().parent();
		var td = tr.children();
		
		//console.log("클릭한 Row의 모든 데이터 : "+tr.text());
		
		var book_name = td.eq(0).text();
		var book_img = td.eq(1).text();
		var book_genre= td.eq(2).text();
		var book_author = td.eq(3).text();
		var book_content = td.eq(4).text();
		var book_publisher = td.eq(5).text();		
		
		//td.each(function(i){	
		//	tdArr.push(td.eq(i).text());
		//});
		
		//console.log("배열에 담긴 값 : "+tdArr);
		//console.log("내용 : "+book_content);
		
		var param="book_name="+book_name
		+"&book_img="+book_img
		+"&book_author="+book_author
		+"&book_content="+book_content
		+"&book_publisher="+book_publisher
		+"&book_genre="+book_genre;
		
		//$("#ex2_Result1").html(tr.text());		
		//$("#ex2_Result2").html(param);	
		
		
		$.ajax({
			url: "${path}/crawling/book_insert_search_result.do",
			type: "post",
			data: param,
			success: function(result){
				$("#result").html(result);
			}
		});
			
		
	});
});
</script>
<style type="text/css">
#button{
	width:100px;
}
</style>
</head>
<body>
<section>
<table border="1">
 <tr>
  <th>제목</th>
  <th>&nbsp;</th>
  <th>장르</th>
  <th>지은이</th>
  <th>설명</th>
  <th>출판사</th>
  <th>&nbsp;</th>
 </tr>
 <c:forEach var="row" items="${list}">
 <tr>
  <td>${row.book_name}</td>
  <td>${row.book_img}
  <c:choose>
  <c:when test="${row.book_img==null}">
  <img src="../images/etc.jpg" width="100px" height="100px">
  </c:when>
  <c:when test="${fn:contains(row.book_img,'http')}">
  <img src="${row.book_img}" width="100px" height="100px">
  </c:when>
  <c:otherwise>
  <img src="../images/${row.book_img}" width="100px" height="100px">
  </c:otherwise>
  </c:choose>
  </td>
  <td>${row.book_genre}</td>
  <td>${row.book_author}</td>
  <td>${row.book_content}</td>
  <%-- <c:choose>
  <c:when test="${fn:length(row.book_content)>100}">
  <td>${fn:substring(row.book_content,0,100)}... </td>
  </c:when>
  <c:otherwise>
  <td>${row.book_content}</td>
  </c:otherwise>
  </c:choose> --%>
  <td>${row.book_publisher}</td>
  <td><input type="hidden" value="<c:out value="${row.book_content}" escapeXml="true" />" name="example"> </td>
  <td><button type="button" class="checkBtn">도서추가</button></td>
 </tr>
 </c:forEach>
 </table>
 <div class="col-lg-12" id="ex2_Result1" ></div> 
 <div class="col-lg-12" id="ex2_Result2" ></div>
<div id="result"></div>
</section>
</body>
</html>