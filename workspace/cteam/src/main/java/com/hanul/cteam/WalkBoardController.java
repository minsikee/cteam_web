package com.hanul.cteam;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import community.CommunityPage;
import community.CommunityServiceImpl;
import community.CommunityVO;

@Controller
public class WalkBoardController {
	
	@Autowired private CommunityServiceImpl service;
	@Autowired private CommunityPage page;
	
	//글목록 화면
	@RequestMapping("/list.bo")
	public String list(HttpSession session, Model model, 
					   String search, String search2, String search3, 
					   String search4, String keyword, 
					   @RequestParam(defaultValue="1") int curPage, 
					   @RequestParam(defaultValue="15") int pageList) {
		session.setAttribute("category", "bo");
		
		page.setCurPage(curPage);
		page.setPageList(pageList);
		page.setSearch(search);
		page.setSearch2(search2);
		page.setSearch3(search3);
		page.setSearch4(search4);
		page.setKeyword(keyword);
		model.addAttribute("page", service.community_list(page));
		
		return "community/list";
	}
	
	//글 상세보기 화면
	@RequestMapping("/detail.bo")
	public String detail(Model model, int id) {
		
		model.addAttribute("vo", service.community_detail(id));
		
		return "community/detail";
	}
	
	//새글쓰기 화면
	@RequestMapping("/new.bo")
	public String newBoard() {
		
		return "community/new";
	}
	
	//새글쓰기 처리
	@RequestMapping("/insert.bo")
	public String insert() {
		
		return "redirect:list.bo";
	}
	

	
}