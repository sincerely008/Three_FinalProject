package com.three.kidult;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.three.kidult.dto.MemberDto;
import com.three.kidult.dto.ProductDto;
import com.three.kidult.model.biz.MemberBiz;
import com.three.kidult.model.biz.ProductBiz;

/**
 * Handles requests for the application home page.
 */
@Controller
public class PaymentController {
	
	@Autowired
	private MemberBiz mbiz;
	
	@Autowired
	private ProductBiz pbiz;
	
	private static final Logger logger = LoggerFactory.getLogger(PaymentController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@RequestMapping(value = "/payment.do", method = {RequestMethod.POST,RequestMethod.GET})
	public String home(Locale locale, Model model,HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		int product_no = Integer.parseInt(request.getParameter("product_no"));
		MemberDto mdto = (MemberDto)session.getAttribute("memberDto");
		if(mdto != null) {
		mdto = mbiz.userInfo(mdto.getMember_id());
		}
		ProductDto pdto = pbiz.selectBoard(product_no);
	
		model.addAttribute("pdto", pdto);
		model.addAttribute("mdto", mdto);
		
		if(mdto != null) {
			return "payment";
		}else {
			return "UserLogin";
		}
	}
	
	@RequestMapping(value = "/paymentres.do", method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public String Payment(Model model,HttpServletRequest request, HttpServletResponse response, HttpSession session) {		
		
		String member_id = request.getParameter("member_id");
		int product_no = Integer.parseInt(request.getParameter("product_no"));
		String product_addr = request.getParameter("product_addr");
		
		MemberDto mdto = mbiz.userInfo(member_id);
		
		return "home.do";
	}
	
}
