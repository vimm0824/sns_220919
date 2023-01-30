package com.sns.info.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sns.follow.bo.FollowBO;
import com.sns.info.model.InfoView;
import com.sns.post.bo.PostBO;
import com.sns.post.model.Post;
import com.sns.user.bo.UserBO;
import com.sns.user.model.User;

@Service
public class InfoBO {

	@Autowired
	private UserBO userBO;
	@Autowired
	private PostBO postBO;
	@Autowired
	private FollowBO followBO;
	
	public InfoView getInfoView(int userId) {
		InfoView infoView = new InfoView();
		
		User user = userBO.getUserById(userId);
		infoView.setUser(user);
		
		List<Post> postList = postBO.getPostListByUserId(userId);
		infoView.setPostList(postList);
		
		int postCount = postList.size();
		infoView.setPostCount(postCount);
		
		int followCount = followBO.getFollowCountByFollowId(userId);
		int followingCount = followBO.getFollowCountByUserId(userId);
		
		infoView.setFollowCount(followCount);
		infoView.setFollowingCount(followingCount);
		
		return infoView;
	}
}
