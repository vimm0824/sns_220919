package com.sns.timeline;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sns.comment.bo.CommentBO;
import com.sns.comment.model.Comment;
import com.sns.post.bo.PostBO;
import com.sns.timeline.bo.TimelineBO;
import com.sns.timeline.model.CardView;

import jakarta.servlet.http.HttpSession;

@RequestMapping("/timeline")
@Controller
public class TimelineController {

	@Autowired
	private PostBO postBO;
	@Autowired
	private CommentBO commentBO;
	@Autowired
	private TimelineBO timelineBO;
	
	@GetMapping("/timeline_view")
	public String postListView(
			HttpSession session,
			Model model) {
		
		Integer userId = (Integer)session.getAttribute("userId");
		
		List<CardView> cardList = timelineBO.generateCardList(userId);
		model.addAttribute("cardResult", cardList);
		model.addAttribute("viewName", "post/postList");
		
		return "template/layout";
	}
}
