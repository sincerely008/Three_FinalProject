package com.three.kidult;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class login {
	
	private static final Logger logger = LoggerFactory.getLogger(login.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		
		
		return "signup";
	}
	
}
