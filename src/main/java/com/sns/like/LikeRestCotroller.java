package com.sns.like;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.sns.like.bo.LikeBO;

import jakarta.servlet.http.HttpSession;

@RestController
public class LikeRestCotroller {
	
	@Autowired
	private LikeBO likeBO;
	
	// /like?postId=13	@RequestParam
	// /like/13			@PathVariable
	@GetMapping("/like/{postId}")
	public Map<String, Object> like(
			@PathVariable int postId,
			HttpSession session) {
		Map<String, Object> result = new HashMap<>();
		
		
		Integer userId = (Integer)session.getAttribute("userId");
		
		if (userId == null) {
			result.put("code", 500);
			result.put("errorMassage", "로그인 후 이용해주세요.");
			return result;
		}
		boolean liked = likeBO.haveLikeByUserIdPostId(userId, postId);
		
		int row = 0;
		if (liked == false) {
			row = likeBO.addLike(userId, postId);
		} else {
			row = likeBO.deleteLike(userId, postId);
		}
		
		if (row > 0) {
			result.put("code", 1);
			result.put("result", "성공!!");
		} else {
			result.put("code", 500);
			result.put("errorMassage", "문의 후 이용해주세요.");
		}
		return result;
	}
}
