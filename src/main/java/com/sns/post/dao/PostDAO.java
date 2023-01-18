package com.sns.post.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.sns.post.model.Post;

@Repository
public interface PostDAO {

	
	public int insertPost(
			@Param("userId") int userId,
			@Param("content") String content,
			@Param("imagePath") String imagePath);
	
	public List<Post> selectPostList();
}
