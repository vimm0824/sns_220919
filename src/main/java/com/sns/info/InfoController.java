package com.sns.info;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sns.info.bo.InfoBO;
import com.sns.info.model.InfoView;
import com.sns.user.bo.UserBO;
import com.sns.user.model.User;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/info")
public class InfoController {
	
	@Autowired
	private InfoBO infoBO;
	
	@Autowired
	private UserBO userBO;

	@GetMapping("/info_user")
	public String detailUser(
			@RequestParam(value="userId", required=false) Integer userId,
			Model model) {
		
		if (userId == null) {
			return "redirect:/timeline/timeline_view";
		}
		
		InfoView infoView = infoBO.getInfoView(userId);
		
		model.addAttribute("infoView", infoView);
		model.addAttribute("viewName", "info/info");
		return "template/layout";
	}
}
