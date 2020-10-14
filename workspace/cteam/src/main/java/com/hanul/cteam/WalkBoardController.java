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
import member.MemberVO;

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
		model.addAttribute("crlf","\r\n");
		model.addAttribute("lf","\n");
		model.addAttribute("page", page);
		
		return "community/detail";
	}
	
	//새글쓰기 화면 >> 수정 필요?
	@RequestMapping("/new.bo")
	public String newBoard(Model model, String search, String search2, String search3) {
		
		page.setSearch2(search);
		page.setSearch2(search2);
		page.setSearch3(search3);
		model.addAttribute("page", page);
		
		return "community/new";
	}
	
	//새글쓰기 처리
	@RequestMapping("/insert.bo")
	public String insert(HttpSession session, CommunityVO vo) {
		
		vo.setMember_id( ((MemberVO)session.getAttribute("login_info")).getMember_id() );
		service.community_insert(vo);
		return "redirect:list.bo";
	}
	
	//글 삭제하기 처리
	@RequestMapping("/delete.bo")
	public String delete(Model model, int id) {
		
		service.community_delete(id);
		model.addAttribute("page", page);
		model.addAttribute("url", "list.bo");
		
		return "board/redirect";
	}
	

	
}