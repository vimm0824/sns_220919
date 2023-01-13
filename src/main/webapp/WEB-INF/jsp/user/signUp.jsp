<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<form method="post" action="/user/sign_up">
	<div class="container col-5">
		<table class="table border text-center">
			<tr>
				<td class="border">아이디</td>
				<td>
					<div class="d-flex">
						<input type="text" id="userId" class="form-control mr-1">
						<button type="button" class="btn btn-success">중복확인</button>
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
				<td><input type="password" id="password" class="form-control"></td>
			</tr>
			<tr>
				<td class="border">비밀번호 확인</td>
				<td><input type="password" id="password" class="form-control"></td>
			</tr>
			<tr>
				<td class="border">이름</td>
				<td><input type="text" id="name" class="form-control"></td>
			</tr>
			<tr>
				<td class="border">이메일</td>
				<td><input type="text" id="email" class="form-control"></td>
			</tr>
		</table>
		<div class="d-flex justify-content-end">
			<button type="button" class="btn btn-primary">회원가입</button>
		</div>
	</div>
</form>

<script>
	$(document).ready(function() {
		
	});
</script>