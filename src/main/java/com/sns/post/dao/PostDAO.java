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
	
	public List<Post> selecetPostListByUserId(int userId);
	
	public Post selecetPostByPostIdUserId(
			@Param("postId") int postId,
			@Param("userId") int userId);
	
	public void deletePostByPostIdUserId(
			@Param("postId") int postId,
			@Param("userId") int userId
			);
}
