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
	$("#btnList").click(function() {
		location.href="${path}/book/list.do";
	});
});
$(function(){
	$("#btnList1").click(function() {
		location.href="${path}/book/list.do";
	});
});


$(function(){
	$("#show").click(function() {
		if("${map.show}"=="n") {
			location.href="${path}/rent/list.do";
		} else {
			location.href="${path}/rent/nlist.do"
		}
	});
});
$(function(){
	if("${map.show}"=="n") {
		$("#show").text("대여목록보기");
	} else {
		$("#show").text("숨김목록보기");
	}
});

$(function(){
	$("#btndelete").click(function() {
		var num=$("#num").val();
		if(confirm("삭제시 서비스 제공에 어려움이 있을 수 있습니다.\n정말 삭제하시겠습니까?")){
			location.href="${path}/rent/delete.do?bnum="+num;
			}else{
				return;
			}
			});
});
</script>
<link rel="stylesheet" href="../include/event.css">

<style type="text/css">
button {
	width: 100px;
	height: 25px;
	background-color: #fff;
	color: #666;
	border: 1px solid #999;
	font-weight: bold;
}
</style>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<h2 align="center">도서대여</h2>
<button type="button" id="btnList">도서목록</button>
<button type="button" id="show"></button>
<br>
<c:choose>
 <c:when test="${map.count == 0}">
 <c:if test="${map.show==y}">
  <h2 align="center">대출중인 항목이 없습니다.</h2>
  </c:if>
  <c:if test="${map.show=='n'}">
  <h2 align="center">숨겨둔 기록이 없습니다.</h2>
  </c:if>
 </c:when>
<c:otherwise>
 <form name="form1" action="post" action="${path}/rent/update.do">
 <table border="1" style="width: 100%">
 <tr>
  <th>제목</th>
  <th>대출일</th>
  <th>반납일</th>
  <th>반납여부</th>
  <c:choose>
  <c:when test="${map.show==y}">
  <th>반납/숨김</th>
  <th>대출 연장</th>
  </c:when>
  <c:otherwise>
  <th>삭제</th>
  </c:otherwise>
  </c:choose>
 </tr>
 <c:forEach var="row" items="${map.list}">
 <tr>
  <td>${row.book_name}</td>
  <td><fmt:formatDate value="${row.aday}" 
  pattern="yyyy-MM-dd HH시 mm분"/></td>
  <c:choose>
  <c:when test="${row.rent_check==1}">
  <td><fmt:formatDate value="${row.bday}" 
  pattern="yyyy-MM-dd"/></td>
  </c:when>
  <c:otherwise>
  <td><fmt:formatDate value="${row.bday}" 
  pattern="yyyy-MM-dd HH시 mm분"/></td>
  </c:otherwise>
  </c:choose>
  <td>
  <c:choose>
   <c:when test="${row.rent_check==1}">
   	대출중
   </c:when>
   <c:otherwise>
    반납
   </c:otherwise>
  </c:choose>
  </td>
  <td>
    <c:if test="${sessionScope.userid != null}">
     <c:if test="${row.rent_check==1}">
     <a href="${path}/rent/re.do?bnum=${row.bnum}">반납</a>
     </c:if>
     <c:if test="${row.rent_check=='0' and map.show==y}">
     <a href="${path}/rent/show.do?bnum=${row.bnum}">숨김</a>
     </c:if>
    <%-- <c:if test="${map.show=='n'}">
     <a href="${path}/rent/delete.do?bnum=${row.bnum}">삭제</a>
     </c:if> --%>
     <c:if test="${map.show=='n'}">
     <input type="hidden" value="${row.bnum}" id="num">
     <button type="button" id="btndelete">삭제</button>
     </c:if>
    </c:if>
  </td>
   <c:if test="${sessionScope.userid != null}">
    <c:if test="${row.rent_check==1}">
    <td>
    <a href="${path}/rent/extend.do?bnum=${row.bnum}">연장</a>
    </td>
    </c:if>
   </c:if>
 </tr>
 </c:forEach>
 </table>
 </form>
</c:otherwise>
</c:choose>
<br>
<button type="button" id="btnList1">도서목록</button>
<%@ include file="../include/footer.jsp" %>
</body>
</html>
