package com.hanul.cteam;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import qna.QnaServiceImpl;

@Controller
public class QnAController {
	
	@Autowired private QnaServiceImpl service;
	
	//QnA 목록화면
	@RequestMapping("/list.qn")
	public String list(HttpSession session, Model model) {
		session.setAttribute("category", "qn");
		
		model.addAttribute("crlf","\r\n");
		model.addAttribute("lf","\n");
		model.addAttribute("list", service.qna_list());
		
		return "qna/list";
	}
	
}
