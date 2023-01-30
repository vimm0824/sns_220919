<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container" id="info">
	<div id="user-top" class="d-flex pt-3">
		<div id="profileImg" class="col-4 d-flex align-items-center">
			<c:if test="${infoView.user.profileUrl eq null}">
			<img src="https://e7.pngegg.com/pngimages/798/436/png-clipart-computer-icons-user-profile-avatar-profile-heroes-black-thumbnail.png"
			 alt="프로필사진" class="img-thumbnail ml-3" height="300" width="300">
			</c:if>
			<c:if test="${infoView.user.profileUrl ne null}">
			<img src="${infoView.user.profileUrl}" alt="프로필사진" class="img-thumbnail">
			</c:if>
		</div>
		<div class="col-8">
			<div class="d-flex justify-content-between">
				<h1 class="mt-3 ml-4">${infoView.user.loginId}</h1>
				<c:if test="${userId eq infoView.user.id}">
				<a href="#" class="mt-4 mr-4 btn btn-primary">프로필 수정</a>
				</c:if>
			</div>
			<div class="h-25"></div>
			<div class="userInfo d-flex align-items-center justify-content-center">
				<div class="col-3">
					<div class="ml-1">${infoView.postCount}</div>
					<small>게시물</small>
				</div>
				<div class="col-3">
					<div class="ml-1">${infoView.followCount}</div>
					<small>팔로우</small>
				</div>
				<div class="col-3">
					<div class="ml-1">${infoView.followingCount}</div>
					<small>팔로잉</small>
				</div>
				<a href="/follow/${infoView.user.id}" class="btn btn-info block" data-follow-id="${infoView.user.id}">팔로우</a>
			</div>
		</div>
	</div>
	<hr>
	<div id="user-bottom" class="d-flex flex-wrap justify-content-around">
		<c:forEach var="post" items="${infoView.postList}">
		<div class="card" style="width: 18rem; height: 25rem;">
		  <img src="${post.imagePath}" class="card-img-top" alt="게시물" height="300" width="150">
		  <div class="card-body">
		  <strong>${infoView.user.loginId}</strong>
		  <span class="card-text">${post.content}</span>
		  </div>
		</div>
		</c:forEach>
	</div>
</div>

<script>
	$(document).ready(function() {
		$('#follow-btn').on('click', function(e) {
			e.preventDefault();
			let followId = $(this).data('follow-id');
			//alert(followId);
			
			$.ajax({
				type:"get"
				, url:"/follow/" + followId
				
				, success:function(data) {
					if (data.code == 1) {
						alert("팔로우 성공!");
						location.reload();
					} else {
						alert(data.errorMessage);
					} 
				}
			
				, error:function(e) {
					alert("ajax error");
				}
			});
		})
	})
</script>