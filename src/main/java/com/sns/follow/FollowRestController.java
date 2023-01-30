package com.sns.follow;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sns.follow.bo.FollowBO;

import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/follow")
public class FollowRestController {
	
	@Autowired
	private FollowBO followBO;

	@GetMapping("/{followId}")
	public Map<String, Object> addFollow(
			@PathVariable int followId,
			HttpSession session
			) {
		Map<String, Object> result = new HashMap<>();
		
		Integer userId = (Integer)session.getAttribute("userId");
		if (userId == null) {
			result.put("code", 500);
			result.put("errorMessage", "로그인 후 이용해주세요!!");
			return result;
		}
		
		int row = followBO.addFollowByUserIdFollowId(userId, followId);
		
		if (row < 0) {
			result.put("code", -1);
			result.put("errorMessage", "본인을 팔로우 할수 없습니다!!");
		} else if (row > 0) {
			result.put("code", 1);
			result.put("result", "성공");
		} else {
			result.put("code", 500);
			result.put("errorMessage", "실패, 관리자에게 문의해주세요!!");
		}
		
		return result;
	}
}
