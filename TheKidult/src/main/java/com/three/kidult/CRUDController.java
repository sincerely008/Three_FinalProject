package com.three.kidult;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.three.kidult.dto.PagingDto;
import com.three.kidult.dto.UsedproductDto;
import com.three.kidult.model.biz.UsedproductBiz;

/**
 * Handles requests for the application home page.
 */
@Controller
public class CRUDController {
	
	@Autowired
	private UsedproductBiz biz;
	
	int currentPageNo = 1;
	int recordsPerPage = 0;
	
	private static final Logger logger = LoggerFactory.getLogger(CRUDController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/crud.do", method = RequestMethod.GET)
	public String crudList(HttpServletRequest request, Model model) {
		
		if(request.getParameter("pages") != null) {
			currentPageNo = Integer.parseInt(request.getParameter("pages"));
		}
		if(request.getParameter("lines") != null) {
			recordsPerPage = Integer.parseInt(request.getParameter("lines"));
		}
		PagingDto paging = new PagingDto(recordsPerPage, currentPageNo);
		int offset = (paging.getCurrentPageNo() - 1) * paging.getRecordsPerPage();
		
		List<UsedproductDto> list = biz.boardList(offset, paging.getRecordsPerPage());
		paging.setNumberOfRecords(biz.getNoOfRecords());
		paging.makePaging();
		
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		
		return "crudlist";
	}
	
	@RequestMapping("/crudpaging.do")
	public String crudPaging(HttpServletRequest request, Model model) {
		
		if(request.getParameter("pages") != null) {
			currentPageNo = Integer.parseInt(request.getParameter("pages"));
		}
		if(request.getParameter("lines") != null) {
			recordsPerPage = Integer.parseInt(request.getParameter("lines"));
		}
		
		PagingDto paging = new PagingDto(recordsPerPage, currentPageNo);
		int offset = (paging.getCurrentPageNo() - 1) * paging.getRecordsPerPage();
		
		String searchFiled = request.getParameter("searchFiled");
		String searchValue = request.getParameter("searchValue");
		
		List<UsedproductDto> list = biz.searchFiled(offset, paging.getRecordsPerPage(), searchFiled, searchValue);
		paging.setSearchFiled(searchFiled);
		paging.setSearchValue(searchValue);
		paging.setNumberOfRecords(biz.getNoOfRecords());
		paging.makePaging();
		
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		
		return "crudlist";
	}
	

	
}
