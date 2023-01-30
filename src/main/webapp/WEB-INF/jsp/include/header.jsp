<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="d-flex">	
	<div class="p-4">
		<a href="/timeline/timeline_view" class="logo display-3">SNS</a>
	</div>
	
	<c:if test="${not empty userId}">
	<div class="col-10 d-flex justify-content-end align-items-center">
		<span>${userName}님 안녕하세요.</span>
		<a href="/user/sign_out" class="font-weight-bold">로그아웃</a>
		<a href="/info/info_user?userId=${userId}" class="btn btn-success ml-3">내 프로필</a>
	</div>
	</c:if>
	<c:if test="${empty userId}">
		<div class="col-10 d-flex justify-content-end align-items-center">
			<a href="/user/sign_in_view" class="btn btn-info">로그인</a>
			<a href="/user/sign_up_view" class="btn btn-secondary">회원가입</a>
			<a href="#"></a>
		</div>
	</c:if>
</div>