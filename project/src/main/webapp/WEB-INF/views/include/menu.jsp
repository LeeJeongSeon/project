<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<c:set var="path" value="${pageContext.request.contextPath}" />
<div style="text-align: center;"> 
<a href="${path}">Home</a> |
<a href="${path}/book/list.do">책목록</a> | 
<a href="${path}/book/popularity_list.do">책목록(인기순)</a> | 
<c:if test="${sessionScope.userid eq 'admin'}">
 <a href="${path}/book/book_write.do">도서 추가</a> |
</c:if>
<a href="${path}/HopeBook/list.do">희망도서신청</a> |
<a href="${path}/book/book_recommend.do">도서추천</a> |
<a href="${path}/event/list.do">행사</a> | 
<a href="${path}/review/list.do">리뷰 게시판으로 이동</a> |
<a href="${path}/member/login.do">로그인</a> |
<a href="${path}/index.html">임시</a>
</div>
