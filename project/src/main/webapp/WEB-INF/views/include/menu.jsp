<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<c:set var="path" value="${pageContext.request.contextPath}" />
<div style="text-align: center;">
 <a href="${path}">Home</a> |
<a href="${path}/book/list.do">책목록</a> | 
<a href="${path}/book/popularity_list.do">책목록(인기순)</a> | 
 
</div>  
