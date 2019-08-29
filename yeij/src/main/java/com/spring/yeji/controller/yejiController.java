package com.spring.yeji.controller;

import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.yeji.service.yejiService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class yejiController {
	@Autowired
	yejiService yejiservice;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "home";
	}
	
	@ResponseBody
	@RequestMapping(value = "/join",  method = RequestMethod.POST)
	public String signup(@RequestParam Map<String,Object> map) {
		

		int result = yejiservice.insertMember(map);
		
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginPost(
			@RequestParam Map<String,Object> map, Model model) {
		Map<String, Object> result = yejiservice.login(map);
	
		if(result != null) {
			model.addAttribute("result", true);
			return "success";
		} else {
			model.addAttribute("result", false);
			return "fail";
			
		}
	}
	
	
	@RequestMapping(value = "/main")
	public String main(@RequestParam Map<String,Object> map) {
		return "main";
	}
	
	
	
}
