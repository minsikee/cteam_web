package com.hanul.cteam;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import admin.AdminServiceImpl;
import admin.SellVO;
import common.CommonService;
import member.MemberVO;

@Controller
public class AdminController {
	@Autowired private AdminServiceImpl service;
	@Autowired private CommonService common;
	
	//관리자페이지 불러오기
	@RequestMapping("/admin.ad")
	public String admin_page(Model model, HttpSession session) {
		session.setAttribute("category", "ad");
		return "admin/adminPage";
	} 
	
	//상품리스트페이지 불러오기
	@RequestMapping("/list.ad")
	public String item_list(Model model, HttpSession session) {
		
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
	
}
