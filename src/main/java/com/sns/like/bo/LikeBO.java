package com.sns.like.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sns.like.dao.LikeDAO;

@Service
public class LikeBO {

	@Autowired
	private LikeDAO likeDAO;
	
	public int addLike(int userId, int postId) {
		return likeDAO.insertLike(userId, postId);
	}
	
	public int getCountLikeByPostId(int postId) {
		return likeDAO.selecetCountLikeByPostId(postId);
	}
	
	public boolean haveLikeByUserIdPostId(int userId, int postId) {
		return likeDAO.haveLikeByUserIdPostId(userId, postId);
	}
	
	public int deleteLike(int userId, int postId) {
		return likeDAO.deleteLike(userId, postId);
	}
}
