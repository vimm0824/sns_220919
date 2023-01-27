<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container" id="info">
	<div id="user-top" class="d-flex pt-3">
		<div id="profileImg" class="col-4 d-flex align-items-center">
			<c:if test="${user.profileUrl eq null}">
			<img src="https://cdn.pixabay.com/photo/2016/01/26/18/35/dog-1163076_1280.jpg" alt="프로필사진" class="img-thumbnail">
			</c:if>
			<c:if test="${user.profileUrl ne null}">
			<img src="${user.profileUrl}" alt="프로필사진" class="img-thumbnail">
			</c:if>
		</div>
		<div class="col-8">
			<h1 class="mt-3 ml-4">${user.loginId}</h1>
			<div class="h-25"></div>
			<div class="userInfo d-flex align-items-center justify-content-center">
				<div class="col-3">
					<div class="ml-1">100</div>
					<small>게시물</small>
				</div>
				<div class="col-3">
					<div class="ml-1">100</div>
					<small>팔로우</small>
				</div>
				<div class="col-3">
					<div class="ml-1">100</div>
					<small>팔로잉</small>
				</div>
				<button type="button" class="btn btn-info block" data-follow-id="">팔로우</button>
			</div>
		</div>
	</div>
	<hr>
</div>