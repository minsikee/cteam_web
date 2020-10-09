package com.hanul.cteam;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import common.CommonService;
import member.MemberServiceImpl;
import member.MemberVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MemberController {
	@Autowired private MemberServiceImpl service;
		
	
		//회원가입 요청
		@RequestMapping("/member")
		public String join(HttpSession session) {
			session.removeAttribute("category");
			return "member/join";
		}
	
		//로그아웃처리
	
		@ResponseBody @RequestMapping("/logout")
		public void logout(HttpSession session) {
			session.removeAttribute("login_info");
		}
	
		//로그인처리
		@ResponseBody @RequestMapping("/login")
		public Boolean login(String userid, String userpwd, HttpSession session) {
			
			HashMap<String, String>map = new HashMap<String, String>();
			map.put("id", userid);
			map.put("pwd", userpwd);
			service.member_login(map);
			
			System.out.println(userid+userpwd);
			
			MemberVO vo = service.member_login(map);
			
			session.setAttribute("login_info", vo);
			
			return vo == null? false : true;
			
			
		}
		
	

	
}
