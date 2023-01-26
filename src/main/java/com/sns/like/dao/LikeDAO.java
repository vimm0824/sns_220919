package com.sns.like.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface LikeDAO {

	public int insertLike(
			@Param("userId") int userId,
			@Param("postId") int postId);
	
//	public int selecetCountLikeByPostId(int postId);
//	
//	public boolean haveLikeByUserIdPostId(
//			@Param("userId") int userId, 
//			@Param("postId") int postId);
	
	public int deleteLike(
			@Param("userId") int userId, 
			@Param("postId") int postId);
	
	public void deleteLikeByPostId(int postId);
	
	public int selectLikeCountByPostIdOrUserId(
			@Param("userId") Integer userId, 
			@Param("postId") int postId);
}
