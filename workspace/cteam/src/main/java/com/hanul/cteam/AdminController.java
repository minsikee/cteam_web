package com.hanul.cteam;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import admin.AdminServiceImpl;
import admin.ListPage;
import admin.SellVO;
import common.CommonService;

@Controller
public class AdminController {
	@Autowired private AdminServiceImpl service;
	@Autowired private CommonService common;
	@Autowired private ListPage page;
	
	//관리자페이지 불러오기
	@RequestMapping("/admin.ad")
	public String admin_page(Model model, HttpSession session) {
		session.setAttribute("category", "ad");
		return "admin/adminPage";
	} 
	
	//상품리스트페이지 불러오기
	@RequestMapping("/list.ad")
	public String item_list(Model model, HttpSession session,@RequestParam(defaultValue="1") int curPage,
			@RequestParam(defaultValue="5") int pageList) {
		session.setAttribute("category", "ad");
		
		//DB에서 방명록 정보를 조회하여 목록화면에 출력
			page.setCurPage(curPage);
			//page.setSearch(search);
			//page.setKeyword(keyword);
			page.setPageList(pageList);
			//page.setViewType(viewType);
			model.addAttribute("page",service.list(page));
		return "admin/list";
	} 

	//상품등록페이지
	@RequestMapping("/itemNew.ad")
	public String admin_up( HttpSession session) {
		
		
		return "admin/itemNew";
	}
	
	//상품등록
	@RequestMapping("/insert.ad")
	public String admin_insert(HttpSession session, MultipartFile file1,MultipartFile file2, SellVO vo) {
	
		if( ! file1.isEmpty() ) {
			vo.setItem_imgpath( common.upload("Item", file1, session) );
		}
		if( ! file2.isEmpty() ) {
			vo.setItem_content_imgpath( common.upload("content", file2, session) );
		}
		service.item_insert(vo);
		return "redirect:list.ad";
	}
	//10월 16일
		@RequestMapping("/memberList.ad")
		public String member_list(Model model, HttpSession session) {
			
			model.addAttribute("list", service.member_list());
			return "admin/memberList";
		}
		
		@RequestMapping("memberDetail.ad")
		public String member_detail(Model model, HttpSession session, String member_id) {
			
			model.addAttribute("list", service.member_detail(member_id));
			return "admin/memberDetail";
		}
	
}
