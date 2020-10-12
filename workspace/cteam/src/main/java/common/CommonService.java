package common;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.EmailAttachment;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;
import org.apache.commons.mail.MultiPartEmail;
import org.apache.commons.mail.SimpleEmail;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

@Service
public class CommonService {
	
	
	
	
	public void sendEmail(String email, String name, HttpSession session) {
		
		htmlSend(email,name,session);
		
	}
	
	
	//html형식의 내용을 갖는 메일 :파일 첨부가능

	public void htmlSend(String email, String name, HttpSession session) {
		HtmlEmail mail=new HtmlEmail();
		mail.setHostName("smtp.naver.com");
		mail.setCharset("utf-8");
		mail.setDebug(true);
		
		mail.setAuthentication("jinyi0604", "naverwlsd16134");
		mail.setSSLOnConnect(true);
		
		try {
			mail.setFrom("jinyi0604@naver.com","관리자");
			mail.addTo(email, name);
			
			mail.setSubject("회원가입을 축하드립니다");
			StringBuffer msg=new StringBuffer();
			msg.append("<html>");
			msg.append("<body>");
			msg.append("<a><img src='https://blogfiles.pstatic.net/MjAyMDA1MDFfMjE1/MDAxNTg4MzA5NjU3NDE4.E7VR-jHLIPaFVsWDcknAer_oLnZnQLe8wrvljZC32fQg.Ivu4AQAwiSlXlsbewyDptVjZc4uHoPYhHe-Q98enTCsg.JPEG.giveanapple/%EC%95%84%EC%9D%B4%EB%A6%B0.jpg'/></a>");
			msg.append("<hr>");
			msg.append("<h1>가입을 축하드립니다</h1>");
			msg.append("</body>");
			msg.append("</html>");
			
			mail.setHtmlMsg(msg.toString());
			
			EmailAttachment file=new EmailAttachment();
			file.setPath(session.getServletContext().getRealPath("resources")+"/images/hanul.ico");
			mail.attach(file);
			
			file=new EmailAttachment();
			file.setPath("C:\\Users\\user\\Desktop\\Mydoggy.jpg");
			mail.attach(file);
			mail.send();
		
		
		} catch (Exception e) {
			System.out.println("EmailException"+e.getMessage());
		}
		
	}
	
	
	//일반메일전송
	public void simpleSend(String email, String name) {
		SimpleEmail mail = new SimpleEmail();
		
		//메일을 작성항ㄹ 서버지정
		mail.setHostName("smtp.naver.com");
		mail.setCharset("utf-8");
		mail.setDebug(true);
		
		mail.setAuthentication("userName", "password");
		
		mail.setSSLOnConnect(true);
		
		try {
			
			mail.setFrom(email);
			mail.addTo(email, name);
			
			mail.setSubject("회원가입 완료메일");
			mail.setMsg(name+"님! 회원가입을 축하드립니다");
			
			mail.send();
		} catch (Exception e) {
				System.out.println("EmailException"+e.getMessage());
		}
		
		
	}

		
}
