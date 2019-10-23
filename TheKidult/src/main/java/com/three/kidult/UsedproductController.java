package com.three.kidult;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.three.kidult.model.biz.UsedproductBiz;

@Controller
public class UsedproductController {

	@Autowired
	private UsedproductBiz biz;
	
	@RequestMapping("/usedproduct.do")
	public String usedproduct(Model model) {
		return null;		
	}
	
}
