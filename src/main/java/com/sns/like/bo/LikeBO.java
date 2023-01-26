package com.sns.like.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sns.like.dao.LikeDAO;

@Service
public class LikeBO {

	@Autowired
	private LikeDAO likeDAO;
	
	public int likeToggle(int userId, int postId) {
		if (haveLikeByUserIdPostId(userId, postId)) {
			return likeDAO.deleteLike(userId, postId);
		} else {
			return likeDAO.insertLike(userId, postId);
		}
	}
	
//	public int addLike(int userId, int postId) {
//		return likeDAO.insertLike(userId, postId);
//	}
//	
	public void deleteLikeByPostId(int postId) {
		likeDAO.deleteLikeByPostId(postId);
	}
	
	public boolean haveLikeByUserIdPostId(int userId, int postId) {
		return likeDAO.selectLikeCountByPostIdOrUserId(userId, postId) > 0 ? true : false;
	}
	
	public int getCountLikeByPostId(int postId) {
		return likeDAO.selectLikeCountByPostIdOrUserId(null, postId);
	}
	
}
