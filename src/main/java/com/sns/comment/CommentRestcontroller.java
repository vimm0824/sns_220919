package com.sns.comment;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sns.comment.bo.CommentBO;

import jakarta.servlet.http.HttpSession;

@RequestMapping("/comment")
@RestController
public class CommentRestcontroller {

	@Autowired
	private CommentBO commentBO;
	
	/**
	 * 댓글 작성
	 * @param postId
	 * @param content
	 * @param session
	 * @return
	 */
	@PostMapping("/create")
	public Map<String, Object> create(
			@RequestParam("postId") int postId,
			@RequestParam("content") String content,
			HttpSession session) {
		Map<String, Object> result = new HashMap<>();
		
		Integer userId = (Integer)session.getAttribute("userId");
		
		if (userId == null) {
			result.put("code", 500);
			result.put("errorMessage", "로그인후 이용하세요.");
			return result;
		}
		
		int row = commentBO.addComment(postId, userId, content);
		
		if (row > 0) {
			result.put("code", 1);
			result.put("result", "댓글 성공");
		} else {
			result.put("code", 500);
			result.put("errorMessage", "댓글 실패 문의 바람");
		}
		
		return result;
	}
	
	@DeleteMapping("/delete")
	public Map<String, Object> delete(
			@RequestParam("id") int id,
			HttpSession session) {
		Map<String, Object> result = new HashMap<>();
		
		int userId = (int)session.getAttribute("userId");
		
		int row = commentBO.deleteCommentByIdUserId(id, userId);
		
		if (row > 0) {
			result.put("code", 1);
			result.put("result", "댓글 삭제 성공");
		} else {
			result.put("code", 500);
			result.put("errorMessage", "댓글 삭제 실패 문의 바람");
		}
		
		return result;
	}
}
