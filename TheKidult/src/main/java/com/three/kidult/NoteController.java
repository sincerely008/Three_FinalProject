package com.three.kidult;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.three.kidult.model.biz.NoteBiz;

@Controller
public class NoteController {

	@Autowired
	private NoteBiz biz;
	
	@RequestMapping(value="/notebox.do")
	public String noteBox(Model model, String note_get) {
		
		model.addAttribute("list",biz.selectlist(note_get));
		
		return "notebox";
	}
	
	@RequestMapping(value="/notesendform.do")
	public String notesendform(Model model, HttpServletRequest request) {
		
		return null;
	}
	
	@RequestMapping(value="/notesend.do")
	public String notesend(Model model, HttpServletRequest request) {
		return null;
	}
	
	@RequestMapping(value="/noteselect.do")
	public String noteselect(Model model, HttpServletRequest request) {
		return null;
	}
	
	@RequestMapping(value="/notedelete.do")
	public String notedelete(Model model, HttpServletRequest request) {
		return null;		
	}
}
