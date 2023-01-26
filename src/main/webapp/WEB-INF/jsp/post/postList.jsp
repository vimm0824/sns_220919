<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="d-flex justify-content-center">
	<div class="contents-box">
		<%-- 글쓰기 영역 --%>
		<c:if test="${not empty userId}">
		<div class="write-box border rounded m-3">
			<textarea id="writeTextArea" placeholder="내용을 입력해주세요" class="w-100 border-0"></textarea>
				
			<%-- 이미지 업로드를 위한 아이콘과 업로드 버튼을 한 행에 멀리 떨어뜨리기 위한 div --%>
			<div class="d-flex justify-content-between">
				<div class="file-upload d-flex">
					<%-- file 태그는 숨겨두고 이미지를 클릭하면 file 태그를 클릭한 것처럼 이벤트를 줄 것이다. --%>
					<input type="file" id="file" class="d-none" accept=".gif, .jpg, .png, .jpeg">
					<%-- 이미지에 마우스 올리면 마우스커서가 링크 커서가 변하도록 a 태그 사용 --%>
					<a href="#" id="fileUploadBtn"><img width="35" src="https://cdn4.iconfinder.com/data/icons/ionicons/512/icon-image-512.png"></a>

					<%-- 업로드 된 임시 파일 이름 저장될 곳 --%>
					<div id="fileName" class="ml-2">
					</div>
				</div>
				<button id="writeBtn" class="btn btn-info">게시</button>
			</div>
		</div>
		</c:if>
		<%--// 글쓰기 영역 끝 --%>
		
		<%-- 타임라인 영역 --%>
		<c:forEach var="card" items="${cardResult}">
		<div class="timeline-box my-5">
			<%-- 카드1 --%>
			<div class="card border rounded mt-3 container">
				<%-- 글쓴이, 더보기(삭제) --%>
				<div class="p-2 d-flex justify-content-between">
					<span class="font-weight-bold">${card.user.loginId}</span>
					
					<%-- 더보기 --%>
					<%-- 내가 쓴 글일때만 노출 --%>
					<c:if test="${userId eq card.user.id}">
					<a href="#" class="more-btn" data-toggle="modal" data-target="#modal" data-post-id="${card.post.id}">
						<img src="https://www.iconninja.com/files/860/824/939/more-icon.png" width="30">
					</a>
					</c:if>
				</div>
				
				<%-- 카드 이미지 --%>
				<div class="card-img">
					<img src="${card.post.imagePath}" class="" alt="본문 이미지" width="500">
				</div>
				
				<%-- 좋아요 --%>
				<div class="card-like m-3">
					<a href="/like/${card.post.id}" class="like-btn" data-post-id="${card.post.id}">
					<c:choose>
						<%-- 좋아요가 되어 있을때 --%>
						<c:when test="${card.filedLike eq true}">
							<img src="https://www.iconninja.com/files/527/809/128/heart-icon.png" width="18" height="18" alt="heart">
						</c:when>
						<%-- 좋아요가 해제되어 있을때 --%>
						<c:otherwise>
							<img src="https://www.iconninja.com/files/214/518/441/heart-icon.png" width="18" height="18" alt="empty heart">
						</c:otherwise>
					</c:choose>
					</a>
					좋아요 ${card.countLike}개
				</div>
				
				<%-- 글 --%>
				<div class="card-post m-3">
					<span class="font-weight-bold">${card.user.loginId}</span>
					<span>${card.post.content}</span>
				</div>
				
				<%-- 댓글 --%>
				<div class="card-comment-desc border-bottom">
					<div class="ml-3 mb-1 font-weight-bold">댓글</div>
				</div>
				
				<%-- 댓글 목록 --%>
				<div class="card-comment-list m-2">
					<c:forEach var="commentView" items="${card.commentList}">
					<div class="card-comment m-1">
						<span class="font-weight-bold">${commentView.user.loginId}:</span>
						<span>${commentView.comment.content}</span>
						
						<%-- 댓글 삭제 버튼 --%>
						<c:if test="${userId eq commentView.user.id}">
						<a href="#" class="commentDelBtn" data-comment-id="${commentView.comment.id}">
							<img src="https://www.iconninja.com/files/603/22/506/x-icon.png" width="10px" height="10px">
						</a>
						</c:if>
					</div>
					</c:forEach>
					<%-- 댓글 쓰기 --%>
					<c:if test="${not empty userId}">
					<div class="comment-write d-flex border-top mt-2">
						<input type="text" class="form-control border-0 mr-2" placeholder="댓글 달기"/> 
						<button type="button" class="comment-btn btn btn-light" data-post-id="${card.post.id}">게시</button>
					</div>
					</c:if>
				</div>
				<%--// 댓글 목록 끝 --%>
			</div>
			<%--// 카드1 끝 --%>
		</div>
		<%--// 타임라인 영역 끝  --%>
		</c:forEach>
	</div>
</div>

<!-- Modal -->
<div class="modal fade" id="modal">
	<%-- modal-sm: 작은 모달창 --%>
	<%-- modal-dialog-centered: 모달창 수직 가운데 정렬 --%>
	<div class="modal-dialog modal-sm modal-dialog-centered">
		<div class="modal-content text-center">
    		<div class="py-3 border-bottom">
    			<a href="#" id="deletePostBtn" class="btn btn-warning">삭제</a>
    		</div>
    		<div class="py-3">
    			<%-- data-dismiss="modal" 모달창 닫힘 --%>
    			<a href="#" class="btn btn-secondary" data-dismiss="modal">취소</a>
    		</div>
		</div>
	</div>
</div>


<script>
	$(document).ready(function() {
		
		// 댓글 삭제
		$('.commentDelBtn').on('click',function(e) {
			e.preventDefault();
			let id = $(this).data('comment-id');
			
			$.ajax({
				type:"delete"
				, url:"/comment/delete"
				, data:{"id":id}
			
				, success:function(data) {
					if (data.code == 1) {
						alert("댓글삭제 성공!!");
						location.reload();
					} else {
						alert("삭제 실패 관리자에게 문의해주세요.");
					}
				}
				, error:function(e) {
					alert("ajax error!!!" + e);
				}
			});
		})
		
		// 더보기 버튼 (...) 클릭 (글 삭제를 위해)
		$('.more-btn').on('click', function(e) {
			e.preventDefault();
			
			let postId = $(this).data('post-id');	// getting
			
			$('#modal').data('post-id', postId);	// setting 모달 태그에 data-post-id를 심어 넣어줌
			
		})

		// 모달 안에 있는 삭제하기 버튼 클릭
		$('#modal #deletePostBtn').on('click', function(e) {
			e.preventDefault();
			
			let postId = $('#modal').data('post-id');
			
			$.ajax({
				type:"delete"
				, url:"/post/delete"
				, data:{"postId":postId}
			
				, success:function(data) {
					if (data.code == 1) {
						alert("삭제 성공!!");
						location.reload();
					} else {
						alert("삭제 실패 관리자에게 문의하세요.");
					}
				}
				, error:function(e) {
					alert("ajax error" + e);
				}
				
			});
		});
		
		$('.like-btn').on('click', function(e) {
			e.preventDefault();
			
			let path = $(this).attr('href');
			
			$.ajax({
				type:"get"
				, url:path
				
				, success:function(data) {
					if (data.code == 1) {
						location.reload();
					} else {
						alert(data.errorMassage);
					}
				}
			
				, error:function(e) {
					alert("ajax error");
				}
			}); 
			
		});
		
		// 댓글
		$('.comment-btn').on('click', function() {
			let postId = $(this).data('post-id');
			let content = $(this).siblings('input').val(); 
			// alert(postId + "++" + content);
			if (content.length < 1) {
				alert("댓글을 입력하세요!!!");
				return;
			}
			
			$.ajax({
				type:"post"
				, url:"/comment/create"
				, data:{"postId":postId, "content":content}
			
				, success:function(data) {
					if (data.code == 1) {
						alert("댓글 성공!!!");
						location.reload();
					} else {
						alert("댓글 실패");
					}
				}
				, error:function(e) {
					alert("ajax error!!!");
				}
			});
			
		});
		
		// 파일업로드 이미지 클릭 => 숨겨져있는 file을 동작시킴
		$('#fileUploadBtn').on('click', function(e) {
			e.preventDefault(); // a태그의 올라가는 현상 방지
			$('#file').click();
		});
		
		// 사용자가 이미지를 선택했을때 유효성 확인 및 업로드 된 파일 이름 노출
		$('#file').on('change', function(e) {
			// alert(11111);
			let fileName = e.target.files[0].name;	//4.png
			//alert(fileName);
			
			// 확장자 유효성 확인
			let ext = fileName.split(".").pop().toLowerCase();
			if (ext != "png" && ext != "jpeg" && ext != "jpg" && ext != "png") {
				alert("이미지 파일만 업로드 할수 있습니다.");
				$('#file').val('');
				$('#fileName').text('');
				return;
			}
			
			// 유효성 통과한 이미지
			$('#fileName').text(fileName);
		});
		
		$('#writeBtn').on('click', function() {
			let content = $('#writeTextArea').val();
			
			if (content < 1) {
				alert("게시글 내용을 작성해 주세요.");
				return;
			}
			
			let formData = new FormData();
			formData.append("content", content);
			formData.append("file", $('#file')[0].files[0]);
			
			$.ajax({
				type: "post"
				, url: "/post/create"
				, data:formData
				
				, enctype:"multipart/form-data" 
				, processData:false 
				, contentType:false 
				
				,success:function(data) {
					if (data.code == 1) {
						alert("게시물이 저장되었습니다.");
						location.href = "/timeline/timeline_view";
					}
				}
				, error:function(e) {
					alert("ajax error!!!");
				}
			});
			
			
		});
	});
</script>