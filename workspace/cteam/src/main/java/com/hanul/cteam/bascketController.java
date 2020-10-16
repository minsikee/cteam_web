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

@Controller
public class bascketController {
	
	//장바구니로 가기
	@RequestMapping("/cart.bs")
	public String go_cart(HttpSession session) {
		session.setAttribute("category", "bs");
		return "basket/cart";
	}
	
}
