package com.sns.timeline.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sns.comment.bo.CommentBO;
import com.sns.comment.model.CommentView;
import com.sns.like.bo.LikeBO;
import com.sns.post.bo.PostBO;
import com.sns.post.model.Post;
import com.sns.timeline.model.CardView;
import com.sns.user.bo.UserBO;
import com.sns.user.model.User;

import jakarta.servlet.http.HttpSession;

@Service
public class TimelineBO {

	@Autowired
	private PostBO postBO;
	@Autowired
	private UserBO userBO;
	@Autowired
	private CommentBO commentBO;
	@Autowired
	private LikeBO likeBO;
	
	// 로그인이 되지 않은 사람도 카드목록이 보여야 한다.
	public List<CardView> generateCardList(Integer sessionId) {
		List<CardView> cardViewList = new ArrayList<>();
		
		// 글목록 가져오기(post)
		List<Post> postList = postBO.getPostList();
		
		boolean haveLike = false;
		
		// postList반복문 => CardView => cardViewList에 넣는다.
		for (Post post : postList) {
			CardView card = new CardView();
			card.setPost(post);
			
			// user 정보
			int userId = post.getUserId();
			User user = userBO.getUserById(userId);
			card.setUser(user);
			
			// commentList 정보
			int postId = post.getId();
			List<CommentView> commentList = commentBO.generateCommentViewListByPostId(postId);
			card.setCommentList(commentList);
			
			// 좋아요
			int countLike = likeBO.getCountLikeByPostId(postId);
			card.setCountLike(countLike);
			
			if (sessionId != null) {
				haveLike = likeBO.haveLikeByUserIdPostId(sessionId, postId);
			}
			card.setFiledLike(haveLike);
			
			cardViewList.add(card);
		}
		
		return cardViewList;
	}
}
