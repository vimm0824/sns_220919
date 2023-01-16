package com.sns.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sns.common.EncryptUtils;
import com.sns.user.bo.UserBO;
import com.sns.user.model.User;

import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/user")
public class UserRestController {

	@Autowired
	private UserBO userBO;
	
	@PostMapping("/sign_up")
	public Map<String, Object> signUp(
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password,
			@RequestParam("name") String name,
			@RequestParam("email") String email) {
	
		Map<String, Object> result = new HashMap<>();
 		
		password = EncryptUtils.md5(password);
		
		userBO.addUser(loginId, password, name, email);
		
		result.put("code", 1);
		result.put("result", "성공");
		
		return result;
	}
	
	@RequestMapping("/is_duplicated_id")
	public Map<String, Object> isDuplicatedId(
			@RequestParam("loginId") String loginId) {
		
		Map<String, Object> result = new HashMap<>();
		
		boolean isDuplicated = userBO.existLoginId(loginId);
		
		if (isDuplicated) { // 중복일때
			result.put("code", 1);
			result.put("result", true);
		} else { // 사용가능
			result.put("code", 1);
			result.put("result", false);
		}
		
		return result;
	}
	
	@PostMapping("/sign_in")
	public Map<String, Object> signIn(
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password,
			HttpSession session
			) {
		password = EncryptUtils.md5(password);
		
		Map<String, Object> result = new HashMap<>();
		
		User user = userBO.getUserByIdPassword(loginId, password);
		
		if (user != null) {
			result.put("code", 1);
			result.put("result", "로그인 성공");
			
			session.setAttribute("userId", user.getId());
			session.setAttribute("userLoginId", user.getLoginId());
			session.setAttribute("userName", user.getName());
		} else {
			result.put("code", 500);
			result.put("errorMessage", "존재하지 않은 사용자입니다.");
		}
		
		return result;
	}
}
