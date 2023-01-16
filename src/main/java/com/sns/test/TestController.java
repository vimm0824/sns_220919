package com.sns.test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sns.post.dao.PostDAO;

@Controller
public class TestController {

	@Autowired
	private PostDAO postDAO;
	
	@ResponseBody
	@GetMapping("/test1")
	public String test1() {
		return "Hello world!!";
	}
	
	@ResponseBody
	@GetMapping("/test2")
	public Map<String, Object> test2(){
		Map<String, Object> result = new HashMap<>();
		result.put("key1", 111);
		result.put("key2", 222);
		result.put("key3", 333);
		return result;
	}
	
	@GetMapping("/test3")
	public String test3() {
		return "test/test";
	}
	
	@GetMapping("/test4")
	@ResponseBody
	public List<Map<String, Object>> test4(){
		return postDAO.selectPostList();
	}
}
