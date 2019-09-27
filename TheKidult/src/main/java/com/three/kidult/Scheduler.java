package com.three.kidult;

import java.text.DateFormat;
import java.util.Date;
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
public class Scheduler {
	
	private static final Logger logger = LoggerFactory.getLogger(Scheduler.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "scheduler.do", method = RequestMethod.GET)
	public String scheduler(Locale locale, Model model) {
		
		//로그인 시 비밀번호 변경이 1분 이상이면 여기 페이지로 이동하게 설계할 예정
		
		return "pw_scheduler";
	}
	
	
	@RequestMapping("/pwchange.do")
	public String pwChange() {
		
		// 비밀번호 변경 할 시
		
		return "메인화면";
	}
	
	public String PwChangeNoNo() {
		
		// 변경 안 할시 다음 로그인에 또 변경권장하기 뜰것
		
		return "메인화면";
	}
	
	public String waitChange() {
		
		// 다음 로그인시 하루동안 변경권장 안뜸
		
		return "메인화면";
	}
	
}
