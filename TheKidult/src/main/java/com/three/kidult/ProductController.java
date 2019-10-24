package com.three.kidult;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.three.kidult.dto.MemberDto;
import com.three.kidult.dto.PagingDto;
import com.three.kidult.dto.ProductDto;
import com.three.kidult.model.biz.ProductBiz;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ProductController {
	
	@Autowired
	private ProductBiz biz;
	
	int currentPageNo = 1;
	int recordsPerPage = 0;
	
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/product.do", method = RequestMethod.GET)
	public String productPage(Model model, HttpServletRequest request, HttpSession session) {
		
		if(request.getParameter("pages") != null) {
			currentPageNo = Integer.parseInt(request.getParameter("pages"));
		}
		if(request.getParameter("lines") != null) {
			recordsPerPage = Integer.parseInt(request.getParameter("lines"));
		}
		PagingDto paging = new PagingDto(recordsPerPage, currentPageNo);
		int offset = (paging.getCurrentPageNo() - 1) * paging.getRecordsPerPage();
			
		List<ProductDto> list = biz.boardList(offset, paging.getRecordsPerPage());
		paging.setNumberOfRecords(biz.getNoOfRecords());
		paging.makePaging();
		
		MemberDto mdto = (MemberDto)session.getAttribute("memberDto");
		
		model.addAttribute("mdto", mdto);
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		
		
		return "product";
	}
	
	@RequestMapping("/paging.do")
	public String SearchAndPaging(Model model, HttpServletRequest request) {
		
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

		List<ProductDto> list = biz.searchFiled(offset, paging.getRecordsPerPage(), searchFiled, searchValue);
		paging.setSearchFiled(searchFiled);
		paging.setSearchValue(searchValue);
		paging.setNumberOfRecords(biz.getNoOfRecords());
		paging.makePaging();
		
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		
		return "product";
	}
	
	@RequestMapping("/selectpage.do")
	public String selectOne(Model model, HttpServletRequest requset, HttpSession session) {
		
		int product_no = Integer.parseInt(requset.getParameter("product_no"));
		
		MemberDto mdto = (MemberDto)session.getAttribute("memberDto");
		ProductDto pdto = biz.selectBoard(product_no);
		model.addAttribute("pdto", pdto);
		model.addAttribute("mdto", mdto);
		
		return "selectproduct";
	}
	
}
