package com.hanul.cteam;

import java.io.Console;
import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.scribejava.core.model.OAuth2AccessToken;

import common.CommonService;
import member.MemberServiceImpl;
import member.MemberVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MemberController {
	@Autowired private MemberServiceImpl service;
	@Autowired private CommonService common;
		

	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}

	
	
	
	//회원가입 
	@ResponseBody @RequestMapping(value="/join", produces="text/html; charset=utf-8")
	public String join(MemberVO vo, HttpServletRequest req, HttpSession session) {
		
		String msg="<script type='text/javascript'>";
		System.out.println(vo.getMember_answer()+vo.getMember_question());
		
		if(service.member_insert(vo)) {
			common.sendEmail(vo.getMember_email(),vo.getMember_name(),session);
			msg+= "alert('회원가입이 완료되었습니다'); location='http://192.168.0.100:8089/cteam/loginPage'";
		}else {
			msg+="alert('회원가입에 실패했습니다') history.go(-1)";
			
		}
		
			msg+="</script>";
					
		return msg;
	}
	
	
	// 네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws IOException, ParseException {
		System.out.println("여기는 callback시 세션 " + session);
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		// 1. 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBO.getUserProfile(oauthToken); // String형식의 json데이터
		/**
		 * apiResult json 구조 {"resultcode":"00", "message":"success",
		 * "response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
		 **/
		// 2. String형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;
		// 3. 데이터 파싱
		// Top레벨 단계 _response 파싱
		JSONObject response_obj = (JSONObject) jsonObj.get("response");
		// response의 nickname값 파싱
		String nickname = (String) response_obj.get("nickname");
		System.out.println(nickname);
		// 4.파싱 닉네임 세션으로 저장
		session.setAttribute("sessionId", nickname); // 세션 생성
		model.addAttribute("result", apiResult);
		return "home/home";
	}
	

	
	
		//아이디 중복화면
	
		@ResponseBody @RequestMapping("/id_check")
		public boolean id_check(String id) {
			
			return service.member_id_check(id);
		}
	
	
		//회원가입 요청
		@RequestMapping("/member")
		public String member(HttpSession session) {
			session.removeAttribute("category");
			return "member/join";
		}
		
	
		@RequestMapping(value = "/logout_home", method = { RequestMethod.GET, RequestMethod.POST })
		public String logout_home(HttpSession session){
		
			session.removeAttribute("login_info");
			
			return "redirect:/";
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
		
		//로그인 화면이동
		@RequestMapping(value = "/loginPage", method = { RequestMethod.GET, RequestMethod.POST })
		public String loginPage(Model model, HttpSession session) {
			/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
			System.out.println("login 시 세션:" + session);
			String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
			// https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
			// redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
			System.out.println("네이버:" + naverAuthUrl);
			// 네이버
			model.addAttribute("url", naverAuthUrl);
			return "member/login";
		}
		
		
	

	
}
