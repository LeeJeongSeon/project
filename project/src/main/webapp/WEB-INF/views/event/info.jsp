<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript">
if(${message=='no'}) {
	alert("잘못 입력된 이메일이거나 신청하신 행사가 없습니다.");
}
</script>
</head>
<body>
<%@ include file="../include/eventMenu.jsp" %>

</body>
</html>