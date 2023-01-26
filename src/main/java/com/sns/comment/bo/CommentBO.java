package com.sns.comment.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sns.comment.dao.CommentDAO;
import com.sns.comment.model.Comment;
import com.sns.comment.model.CommentView;
import com.sns.user.bo.UserBO;
import com.sns.user.model.User;

@Service
public class CommentBO {

	@Autowired
	private CommentDAO commentDAO;
	@Autowired
	private UserBO userBO;
	
	public int addComment(int postId, int userId, String content) {
		return commentDAO.insertComment(postId, userId, content);
	}
	
	private List<Comment> getCommentListByPostId(int postId) {
		return commentDAO.selecetCommentListByPostId(postId);
	}
	
	public List<Comment> getCommentList() {
		return commentDAO.selecetCommentList();
	}
	
	// output: 글번호에 해당하는 댓글 목록 (+댓글쓴이 정보)을 가져온다.
	public List<CommentView> generateCommentViewListByPostId(int postId) {
		List<CommentView> commentViewList = new ArrayList<>();
		
		List<Comment> commentList = getCommentListByPostId(postId);
		
		for (Comment comment : commentList) {
			CommentView commentView = new CommentView();
			
			commentView.setComment(comment);
			
			int userId = comment.getUserId();
			User user = userBO.getUserById(userId);
			commentView.setUser(user);
			
			commentViewList.add(commentView);
		}
		
		return commentViewList;
	}
	
	public void deleteCommentByPostId(int postId) {
		commentDAO.deleteCommentByPostId(postId);
	}
	
	public int deleteCommentByIdUserId(int Id, int userId) {
		return commentDAO.deleteCommentByIdUserId(Id, userId);
	}
}
