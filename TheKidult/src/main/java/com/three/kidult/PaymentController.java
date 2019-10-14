package com.three.kidult;

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
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Handles requests for the application home page.
 */
@Controller
public class PaymentController {
	
	private static final Logger logger = LoggerFactory.getLogger(PaymentController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@RequestMapping(value = "/payment.do", method = {RequestMethod.POST,RequestMethod.GET})
	public String home(Locale locale, Model model,HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		return "payment";
	}
	
	@RequestMapping(value = "/paymentres.do", method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public String Payment(Model model,HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
				
		return "";
	}
	
}
