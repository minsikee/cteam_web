package com.hanul.cteam;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import admin.AdminServiceImpl;
import admin.ListPage;
import admin.MemberListPage;
import admin.SellVO;
import common.CommonService;

@Controller
public class AdminController {
	@Autowired private AdminServiceImpl service;
	@Autowired private CommonService common;
	@Autowired private ListPage page;
	@Autowired private MemberListPage memberpage;
	
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
	//회원관리
		@RequestMapping("/memberList.ad")
		public String member_list(Model model, HttpSession session,@RequestParam(defaultValue="1") int curPage,
				@RequestParam(defaultValue="15") int pageList) {
			
			//session.setAttribute("category", "ad");
			
			//DB에서 방명록 정보를 조회하여 목록화면에 출력
			memberpage.setCurPage(curPage);
				//page.setSearch(search);
				//page.setKeyword(keyword);
			memberpage.setPageList(pageList);
				//page.setViewType(viewType);
				model.addAttribute("page", service.member_list(memberpage));
			return "admin/memberList";
		}
		
		//회원정보 상세보기
		@RequestMapping("memberDetail.ad")
		public String member_detail(Model model, HttpSession session, String member_id) {
			
			model.addAttribute("list", service.member_detail(member_id));
			return "admin/memberDetail";
		}
		
		//주문관리
		@RequestMapping("/orderList.ad")
		public String order_list(Model model, HttpSession session) {
			
			model.addAttribute("orderlist", service.order_list());
			return "admin/orderList";
		}
		
	 	@RequestMapping("/stateUpdate.ad")
		public void state_update(Model model, String order_state, String order_num) {
	 		HashMap<String, String> map = new HashMap<String, String>();
			map.put("order_state", order_state);
			map.put("order_num", order_num);
			
			service.state_update(map);
			//return "redirect:orderList";
		}
		
		
}
