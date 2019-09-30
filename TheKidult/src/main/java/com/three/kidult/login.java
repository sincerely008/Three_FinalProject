package com.three.kidult;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.three.kidult.dto.MemberDto;
import com.three.kidult.model.biz.MemberBiz;

/**
 * Handles requests for the application home page.
 */
@Controller
public class login {
	
	@Autowired
	private MemberBiz biz;
	
	private static final Logger logger = LoggerFactory.getLogger(login.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/signup.do", method = RequestMethod.GET)
	public String signup(Model model) {
		
		return "signup";
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
	
}
