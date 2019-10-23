package com.three.kidult;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.three.kidult.dto.ChattingDto;
import com.three.kidult.dto.MemberDto;
import com.three.kidult.model.biz.MemberBiz;

/**
 * Handles requests for the application home page.
 */
@Controller
public class login {
	
	@Autowired
	private MemberBiz biz;
	
	@Autowired
	private JavaMailSender mailSender;

	
	private static final Logger logger = LoggerFactory.getLogger(login.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/signup.do", method = RequestMethod.GET)
	public String signup(Model model, HttpServletRequest request, HttpServletResponse response,HttpSession session) {
		
		return "signup";
	}
	@RequestMapping(value = "/UserInformation.do", method = RequestMethod.GET)
	public String UserInformation(Model model, HttpServletRequest request, HttpServletResponse response,HttpSession session) {
		
		session = request.getSession();
		
		return "UserInformation";
	}
	@RequestMapping(value = "/UserInformationUpdate.do", method = RequestMethod.GET)
	public String UserInformationUpdate(Model model, HttpServletRequest request, HttpServletResponse response,HttpSession session) {
		
		session = request.getSession();
	
		return "UserInformationUpdate";
	}
	
	@RequestMapping("/idchk.do")
	@ResponseBody
	public String idchk(HttpServletRequest request, HttpServletResponse response){
		
		String id = request.getParameter("id");
		
		MemberDto dto = biz.idchk(id);
		
		
		if(dto != null) {
			return dto.getMember_id();
		}else {
			return "";
		}
	
	}
	
	@RequestMapping("/emailchk.do")
	@ResponseBody
	public String emailchk(HttpServletRequest request) {
		
		String email = request.getParameter("email");
		MemberDto dto = biz.emailchk(email);
		
		if(dto != null) {
			return dto.getMember_email();
		}else {
			return "";
		}
		
	}
	
	@RequestMapping("/sendemail.do")
	@ResponseBody
	public String sendemail(HttpServletRequest request) {
		
		String ran = "";
		for(int i = 0; i < 6; i++) {
			ran += (int)(Math.random()*10);
		}
		
		String setfrom = "threekidultproject@gmail.com";
		String email = request.getParameter("email");
		
		try {
			MimeMessage message = mailSender.createMimeMessage();	
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(setfrom);
			messageHelper.setTo(email);
			messageHelper.setSubject("kidult 인증 메일입니다.");
			messageHelper.setText("인증 번호 : " + ran);
			
			mailSender.send(message);
		} catch (MessagingException e) {
			System.out.println("smtp error");
			e.printStackTrace();
		}
		
		
		return ran;
	}
	
	@RequestMapping(value="/signupres.do", method = {RequestMethod.POST,RequestMethod.GET})
	public String signupres(Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		int res = 0;
		
		String member_id = request.getParameter("id");
		String member_pw = request.getParameter("password");
		String member_name = request.getParameter("name");
		String member_birth = request.getParameter("birth");
		String member_addr = request.getParameter("addr1") + " " + request.getParameter("addr2");
		String member_phone = request.getParameter("phone1") + "-" + request.getParameter("phone2") + "-" + request.getParameter("phone3");
		String member_email = request.getParameter("emailFront") + "@" + request.getParameter("emailBack");
		String member_kakao = request.getParameter("kakao");
		String member_gender = request.getParameter("gender");
		
		MemberDto dto = new MemberDto();
		dto.setMember_id(member_id);
		dto.setMember_pw(member_pw);
		dto.setMember_name(member_name);
		dto.setMember_birth(member_birth);
		dto.setMember_addr(member_addr);
		dto.setMember_phone(member_phone);
		dto.setMember_email(member_email);
		dto.setMember_kakao(member_kakao);
		dto.setMember_gender(member_gender);
		
		res = biz.signup(dto);
		
		if(res>0) {
			
			return "redirect:signend.do";
		}else {
			out.print("<script>");
			out.print("alert('회원가입 실패')");
			out.print("</script>");
			out.flush();
			return "signup";
		}
	
		
	}
	@RequestMapping("/signend.do")
	public String signend(Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		
		return "signend";
	}
	
	@RequestMapping("/forgotid.do")
	public String forgotID() {
		
		return "forgotid";
	}
	
	@RequestMapping(value="/goforgotid.do", method = RequestMethod.POST)
	public String goforgotId(HttpServletRequest request, Model model, HttpServletResponse response) throws UnsupportedEncodingException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		
		MemberDto dto = biz.forgotId(name, email);
		
		model.addAttribute("dto", dto);
		
		return "goforgotid";
	}
	
	@RequestMapping("/forgotpw.do")
	public String forgotPw() {
		
		return "forgotpw";
	}
	
	@RequestMapping(value="/goforgotpw.do", method = RequestMethod.POST)
	public String goforgotPw(Model model, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		
		MemberDto dto = biz.forgotPw(id, name, email);
		
		model.addAttribute("dto", dto);
		
		return "goforgotpw";
	}
	
	@RequestMapping(value="changeforgotpw.do", method = RequestMethod.POST)
	public String changePw(Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		String id = request.getParameter("id");
		String pw = request.getParameter("password");
		
		int res = biz.updatePw(id, pw);
		if(res>0) {
			out.print("<script>");
			out.print("alert('변경 완료!')");
			out.print("</script>");
			out.flush();
			return "changeforgotpw";
		}else {
			out.print("<script>");
			out.print("alert('변경 실패!')");
			out.print("</script>");
			out.flush();
			return "forgotpw";
		}
		
		
	}
	
	@RequestMapping("/UserLogin.do")
	public String gologin(Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		session = request.getSession();
		
		return"UserLogin";
	}
	
	
	@RequestMapping(value="/login.do", method = RequestMethod.POST)
	public String loginres(Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		session = request.getSession();
		PrintWriter out = response.getWriter();
		
		
		String id = request.getParameter("id");
		String pw = request.getParameter("password");
		
		MemberDto dto = biz.login(id, pw);
		
		if(dto != null && dto.getMember_kakao().equals("N") && dto.getMember_enabled().equals("Y")) {
			session.setAttribute("memberDto", dto);

			ChattingDto dto1 =new ChattingDto();
			dto1.setChatting_user(id);		

			return "redirect:home.do";
		}else if(dto.getMember_kakao().equals("Y") && dto.getMember_enabled().equals("Y")) {
			out.print("<script>");
			out.print("alert('카카오 로그인을 해주세요')");
			out.print("</script>");
			out.print("<script>");
			out.print("location.href='UserLogin.do'");
			out.print("</script>");
			out.flush();
			return "UserLogin";
		}else {
			out.print("<script>");
			out.print("alert('아이디와 비밀번호를 확인해주세요')");
			out.print("</script>");
			out.print("<script>");
			out.print("location.href='UserLogin.do'");
			out.print("</script>");
			out.flush();
			return "UserLogin";
		}
		
	
		
	}
	
	@RequestMapping(value="/kakaoLogin.do")
	public String kakaoLogin(String code, HttpSession session, Model model) {
		
		
		String access_Token = biz.kakaoGetAccessToken(code);
		HashMap<String, Object> userInfo = biz.kakaoGetUserInfo(access_Token);
		
		
		String kakaoId = (String) userInfo.get("kakaoId"); 
		String email = "";
		
		
		
		if(userInfo.get("email") != null&& userInfo.get("email") != "") {
			email = (String)userInfo.get("email");			
			session.setAttribute("access_Token", access_Token);
			
			String[] emailSplit = email.split("@");
			String emailFront = emailSplit[0];
			String emailBack = emailSplit[1];
			
			model.addAttribute("emailFront",emailFront);
			model.addAttribute("emailBack",emailBack);

			ChattingDto dto1=new ChattingDto();
			dto1.setChatting_user(kakaoId);
			
		}else {
			System.out.println("email is null");
		}
		
		MemberDto dto; 
		
		dto = biz.login(kakaoId, kakaoId);
		
		
		if(dto != null) {
			session.setAttribute("dto", dto);
			return "home";
		} else {
			
			dto = new MemberDto();
			dto.setMember_id(kakaoId);
			
			model.addAttribute("dto", dto);
			
			return "signup";
		}	
	}
	
	@RequestMapping("/logout.do")
	public String logOut(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		session = request.getSession();
		
		session.invalidate();
		
		ChattingDto dto1 =new ChattingDto();
		dto1.setChatting_user(null);		
		
		return "home";
	}
	
	@RequestMapping("/usermanagement.do")
	public String usermanagement(Model model) {	
		
		model.addAttribute("list", biz.selectList());	
		
		return "usermanagement";
	}
	
	@RequestMapping(value="/roleupdate.do")
	public String roleupdate(Model model, String enabled, String id) {
			
		int res = biz.roleupdate(enabled,id);
		
		if(res>0) {
			model.addAttribute("list", biz.selectList());	
			return	 "usermanagement";	
		}else {
			System.out.println("roleupdate error");
			model.addAttribute("list", biz.selectList());	
			return	 "usermanagement";	
		}
	}
	
	@RequestMapping(value="/deleteid.do")
	public String deleteid(Model model, String id) {
		
		int res = biz.deleteid(id);
		
		if(res>0) {
			model.addAttribute("list", biz.selectList());	
			return	 "usermanagement";	
		}else {
			System.out.println("roleupdate error");
			model.addAttribute("list", biz.selectList());	
			return	 "usermanagement";	
		}
	}
}
