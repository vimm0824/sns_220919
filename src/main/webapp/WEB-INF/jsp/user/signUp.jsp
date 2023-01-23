<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<form method="post" action="/user/sign_up" id="signUpBtn">
	<div class="container col-5">
		<table class="table border text-center mt-4">
			<tr>
				<td class="border">아이디</td>
				<td>
					<div class="d-flex">
						<input type="text" id="loginId" name="loginId" class="form-control mr-1">
						<button type="button" id="idCheckBtn" class="btn btn-success">중복확인</button>
					</div>
					<div class="text-left">
						<small id="idCheckLength" class="text-warning d-none">아이디를 4자 이상 입력하세요.</small>
						<small id="idCheckDuplicated" class="text-danger d-none">중복된 아이디입니다.</small>
						<small id="idCheckOk" class="text-info d-none">사용 가능한 아이디입니다.</small>
					</div>
				</td>
			</tr>
			<tr>
				<td class="border">비밀번호</td>
				<td><input type="password" id="password" name="password" class="form-control"></td>
			</tr>
			<tr>
				<td class="border">비밀번호 확인</td>
				<td><input type="password" id="passwordCol" class="form-control"></td>
			</tr>
			<tr>
				<td class="border">이름</td>
				<td><input type="text" id="name" name="name" class="form-control"></td>
			</tr>
			<tr>
				<td class="border">이메일</td>
				<td><input type="text" id="email" name="email" class="form-control"></td>
			</tr>
		</table>
		<div class="d-flex justify-content-end">
			<button type="submit" id="joinBtn" class="btn btn-primary">회원가입</button>
		</div>
	</div>
</form>

<script>
	$(document).ready(function() {
		$('#signUpBtn').on('submit', function(e) {
			//alert(111111);
			e.preventDefault();				// submit에 기능 멈춤 코
			
			let loginId = $('#loginId').val().trim();
			let password = $('#password').val();
			let passwordCol = $('#passwordCol').val();
			let name = $('#name').val().trim();
			let email = $('#email').val().trim();
			
			if (loginId.length < 1) {
				alert("아이디를 입력하세요.");
				return false;
			}
			if (password.length < 1) {
				alert("비밀번호를 입력하세요.");
				return false;
			}
			if (passwordCol.length < 1) {
				alert("비밀번호 확인을 입력하세요.");
				return false;
			}
			if (password != passwordCol) {
				alert("비밀번호 확인을 정확히 입력하세요.");
				return false;
			}
			if (name.length < 1) {
				alert("이름을 입력하세요.");
				return false;
			}
			if (email.length < 1) {
				alert("이메일을 입력하세요.");
				return false;
			}
			
			if ($('#idCheckOk').hasClass('d-none')) {
				alert("아이디 중복확인을 다시 해주세요.");
				return false;
			}
			// 2) ajax
			let url = $(this).attr('action');
			let params = $(this).serialize();	// form태그에 있는 name으로 파라미터들 구성
			
			$.post(url, params)	// request
			.done(function(data) {
				// response
				if (data.code == 1) {
					// 성공
					alert("가입을 환영합니다.");
					location.href = "/user/sign_in_view";
				} else {
					// 실패
					alert(data.errorMessage);
				}
			});
		});
		
		$('#idCheckBtn').on('click', function() {
			let loginId = $('#loginId').val().trim();
			// alert(loginId);
			$('#idCheckLength').addClass('d-none');
			$('#idCheckDuplicated').addClass('d-none');
			$('#idCheckOk').addClass('d-none');
			
			if (loginId.length < 4) {
				$('#idCheckLength').removeClass('d-none');
				return;
			}
			
			$.ajax({
				url: "/user/is_duplicated_id"
				, data: {"loginId":loginId}
			
				, success:function(data) {
					if (data.code == 1) {
						// 데이터 통신 성공
						if (data.result) {
							// 중복
							$('#idCheckDuplicated').removeClass('d-none');
						} else {
							// 사용가능
							$('#idCheckOk').removeClass('d-none');
						}
					} else {
						// 실패
						alert(data.errorMessage);
					}
				}
				, error:function(e) {
					alert("에러" + e);
				}
			});
		});
	});
</script>