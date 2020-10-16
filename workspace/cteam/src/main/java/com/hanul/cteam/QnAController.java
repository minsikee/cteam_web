package com.hanul.cteam;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.MemberVO;

@Controller
public class QnAController {
	
	@RequestMapping("/list.qn")
	public String mypage(Model model, HttpSession session) {
		session.setAttribute("category", "qn");
	
		return "qna/list";
	} 
	
}
