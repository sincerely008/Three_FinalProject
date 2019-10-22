package com.three.kidult;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.three.kidult.dto.MemberDto;
import com.three.kidult.model.biz.MemberBiz;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/home.do", method = RequestMethod.GET)


	public String home(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {


		logger.info("Welcome home! The client locale is {}.", locale);

		session = request.getSession();

		
		session = request.getSession();
		

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	
	@RequestMapping("/chat.do")
	public String chat() {
		return "chat";
	}
	
	@RequestMapping("/delivery.do")
	public String delivery() {
		return "delivery";
	}
	
	@RequestMapping("/note.do")
	public String note() {
		return "note";
	}
}
