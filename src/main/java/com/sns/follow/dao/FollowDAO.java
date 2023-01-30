package com.sns.follow.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface FollowDAO {

	public int selecetFollowCountByUserId(int userId);
	
	public int selecetFollowCountByFollowId(int followId);
	
	public int insertFollowByUserIdFollowId(
			@Param("userId") int userId,
			@Param("followId") int followId);
}
