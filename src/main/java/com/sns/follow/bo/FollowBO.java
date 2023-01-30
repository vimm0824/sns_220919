package com.sns.follow.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sns.follow.dao.FollowDAO;

@Service
public class FollowBO {

	@Autowired
	private FollowDAO followDAO;
	
	public int getFollowCountByUserId(int userId) {
		return followDAO.selecetFollowCountByUserId(userId);
	}
	
	public int getFollowCountByFollowId(int followId) {
		return followDAO.selecetFollowCountByFollowId(followId);
	}
	
	public int addFollowByUserIdFollowId(int userId, int followId) {
		if (userId == followId) {
			return -1;
		}
		return followDAO.insertFollowByUserIdFollowId(userId, followId);
	}
}
