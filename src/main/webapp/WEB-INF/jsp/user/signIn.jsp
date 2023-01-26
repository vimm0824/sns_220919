<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form method="post" action="/user/sign_in" id="signInForm">
	<div class="container col-4 border p-3">
                <div>
                    <input type="text" id="loginId" name="loginId" class="form-control" placeholder="아이디를 입력하세요.">
                </div>
                <div class="mt-2">
                    <input type="password" id="password" name="password" class="form-control" placeholder="비밀번호를 입력하세요.">
                </div>
                <div class="mt-2">
                    <button type="submit" id="signIn" class="btn btn-primary col-12">로그인</button>
                </div>
                <div class="mt-2">
                	<a href="/user/sign_up_view" type="button" id="signUp" class="btn btn-secondary col-12">회원가입</a>
                </div>
	</div>
</form>

<script>
	$(document).ready(function() {
		$('#signInForm').on('submit', function(e) {
			e.preventDefault();
			
			let loginId = $('#loginId').val().trim();
			let password = $('#password').val();
			
			if (loginId.length < 1) {
				alert("아이디를 입력하세요.");
				return false;
			}
			if (password.length < 1) {
				alert("비밀번호를 입력하세요.");
				return false;
			}
			
			let url = $(this).attr('action');
			let params = $(this).serialize();
			//console.log(url);
			//console.log(params);
			
			$.post(url, params)
			.done(function(data) {
				if (data.code == 1) {
					location.href = "/timeline/timeline_view";
				} else {
					alert(data.errorMessage);
				}
			});
		})
	});
</script>