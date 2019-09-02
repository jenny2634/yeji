package com.spring.yeji.controller;

import java.io.File;
import java.io.IOException;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String signup(@RequestParam Map<String, Object> map) {

		int result = yejiservice.insertMember(map);
		if (result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}

	@ResponseBody
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginPost(@RequestParam Map<String, Object> map, Model model, HttpSession session) {
		Map<String, Object> result = yejiservice.login(map);

		if (result != null) {
			// model.addAttribute("result", true);
			session.setAttribute("uname", map.get("uname"));
			return "success";
		} else {
			// model.addAttribute("result", false);
			return "fail";
		}
	}

	/*
	 * @RequestMapping(value = "/main") public String main(@RequestParam Map<String,
	 * Object> map) { return "main"; }
	 */

	@RequestMapping(value = "/main")
	public String main(HttpSession session, Model model) {
		model.addAttribute("list", yejiservice.select());
		String uname = (String)session.getAttribute("uname");
		if(uname == null) {
			return "redirect:/";
		}
		return "main";
	}
	
	@RequestMapping(value = "/list")
	public String list(Model model) {
		model.addAttribute("list", yejiservice.selectFile());
		return "list";
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String write(HttpSession session, Model model) {
		String uname = (String)session.getAttribute("uname");
		if(uname == null) {
			return "redirect:/";
		}
		return "write";
	}
	
	@RequestMapping(value="/write", method = RequestMethod.POST)
	public String writePost(@RequestParam Map<String, String> map,HttpSession session, MultipartHttpServletRequest mReq) {
		
		String uname = (String)session.getAttribute("uname");
		map.put("uname", uname);
		
		String path = this.getClass().getClassLoader().getResource("").getPath();
		path = path.substring(0,path.indexOf("WEB-INF"));
		
		File dir = new File(path + "/resources");
		//디렉토리가 없다면 생성
		if(!dir.isDirectory()) {
			dir.mkdirs();
		}
		
		MultipartFile mFile1 = mReq.getFile("file1");
		String file1 = mFile1.getOriginalFilename();
		
		long unixTime = 0;
		String fileName = "";
		String fileExt = "";
		if(!file1.equals("")) {
			unixTime = System.currentTimeMillis();
			fileName = file1.substring(0,file1.indexOf("."));
			fileExt = file1.substring(file1.indexOf("."));
			
			file1 = fileName + "_" + unixTime + fileExt;
			
			try {
				mFile1.transferTo(new File(path + "/resources/" + file1));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		map.put("file1", file1);
		yejiservice.insertFile(map);
		
	
		return "write";
	}

}
