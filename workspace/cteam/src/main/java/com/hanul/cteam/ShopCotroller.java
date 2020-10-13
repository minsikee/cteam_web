package com.hanul.cteam;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import common.CommonService;
import shop.ShopPage;
import shop.ShopServiceImpl;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ShopCotroller {
	
	@Autowired private ShopServiceImpl service;
	@Autowired private ShopPage page;
	@Autowired private CommonService common;
	
	

	
	
	@RequestMapping("/item.detail")
	public String itemDetail(Model model, int item_num) {
		
		model.addAttribute("vo",service.shop_detail(item_num));
		model.addAttribute("crlf","\r\n");
		model.addAttribute("lf","\n");
		model.addAttribute("page",page);
		
		return "shop/itemDetail1";
	}
	
	@RequestMapping("/list.sh")
	public String list(Model model, HttpSession session, @RequestParam(defaultValue ="1") int curPage,
			 String search, String keyword ) {
		
		session.setAttribute("category", "sh");
		
		page.setCurPage(curPage);
		page.setSearch(search);
		page.setKeyword(keyword);
		model.addAttribute("page", service.shop_list(page));
		
		return "shop/shopPage";
	}
	 
}
