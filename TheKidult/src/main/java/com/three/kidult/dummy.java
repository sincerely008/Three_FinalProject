package com.three.kidult;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.three.kidult.dto.ProductDto;
import com.three.kidult.model.biz.ProductBiz;

/**
 * Handles requests for the application home page.
 */
@Controller
public class dummy {
	
	@Autowired
	private ProductBiz pbiz;
	
	private static final Logger logger = LoggerFactory.getLogger(dummy.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 * @throws IOException 
	 */
	
	@RequestMapping("/dummy.do")
	public String godummy(HttpServletRequest request, Model model, HttpServletResponse response) throws IOException {
		

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
			
		PrintWriter out = response.getWriter();
		
		out.println("1번을 클릭해주세요");
		
		return "dummy";
	}
	
	@RequestMapping(value = "/dummydata01.do", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public void dummydate01(HttpServletRequest request, Model model, HttpServletResponse response) throws IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		
		PrintWriter out = response.getWriter();
		
		String info = request.getParameter("info");
		JsonParser parser = new JsonParser();
		JsonElement infoEle = parser.parse(info);
	
		List<ProductDto> product = pbiz.productList();
		
		
		if(product.size() == 0) {
			for(int i = 0; i < infoEle.getAsJsonObject().get("DATA").getAsJsonArray().size(); i++) {
				JsonObject infoObj = infoEle.getAsJsonObject().get("DATA").getAsJsonArray().get(i).getAsJsonObject();
				
				JsonElement product_names = infoObj.get("name");
				JsonElement product_imgUrls = infoObj.get("img");
				JsonElement product_prices = infoObj.get("price");
				
				JsonElement URLs = infoObj.get("det");
				
				String product_name = product_names.getAsString();
				String product_img = product_imgUrls.getAsString();
				String product_pricest = product_prices.getAsString();
				int product_price = Integer.parseInt(product_pricest.replace("￦", "").replace(",", ""));
				
				
				String URL = URLs.getAsString();
				
				Document doc = Jsoup.connect(URL).get();
				Elements elem = doc.select("div.prd-detail");

								
				String product_details = elem.select("img[src]").attr("src").toString();
				
				ProductDto dto = new ProductDto();
				dto.setCategory_no(1);
				dto.setProduct_no(i+1);
				dto.setProduct_name(product_name);
				dto.setProduct_img(product_img);
				dto.setProduct_price(product_price);
				dto.setProduct_details(product_details);
				dto.setProduct_stock(10000);
				
				product.add(dto);
			}
			
			int res = pbiz.insert(product);
			
			out.println("카테고리 1 더미데이터 "+res+" 개 생성");
			out.println("2번을 클릭해주세요");
			
		}else {
			out.println("이미 생성됨");
		}
		
		
	}
	
	@RequestMapping(value = "/dummydata02.do", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public void dummydate02(HttpServletRequest request, Model model, HttpServletResponse response) throws IOException {
		

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
			
		PrintWriter out = response.getWriter();
		
		String info = request.getParameter("info2");
		
		JsonParser parser = new JsonParser();
		JsonElement infoEle = parser.parse(info);
	
		List<ProductDto> product = pbiz.productList();
		List<ProductDto> products = new ArrayList<ProductDto>();
	
		
		if(product.size() == 120) {
			for(int i = 0; i < infoEle.getAsJsonObject().get("DATA").getAsJsonArray().size(); i++) {
				JsonObject infoObj = infoEle.getAsJsonObject().get("DATA").getAsJsonArray().get(i).getAsJsonObject();
				
				JsonElement product_names = infoObj.get("name");
				JsonElement product_imgUrls = infoObj.get("img");
				JsonElement product_prices = infoObj.get("price");
				
				JsonElement URLs = infoObj.get("det");
				
				String product_name = product_names.getAsString();
				String product_img = product_imgUrls.getAsString();
				String product_pricest = product_prices.getAsString();
				int product_price = Integer.parseInt(product_pricest.replace("￦", "").replace(",", ""));
				
				
				String URL = URLs.getAsString();
				
				
				Document doc = Jsoup.connect(URL).get();
				Elements elem = doc.select("div.prd-detail");

								
				String product_details = elem.select("img[src]").attr("src").toString();
				
				ProductDto dto = new ProductDto();
				dto.setCategory_no(2);
				dto.setProduct_no(i+121);
				dto.setProduct_name(product_name);
				dto.setProduct_img(product_img);
				dto.setProduct_price(product_price);
				dto.setProduct_details(product_details);
				dto.setProduct_stock(10000);
				products.add(dto);
				
			}
			
			int res = pbiz.insert(products);
			
			out.println("카테고리 2 더미데이터 "+res+" 개 생성");
			
		}else {
			out.println("이미 생성됨");
		}		
		
	}
	
	
}
