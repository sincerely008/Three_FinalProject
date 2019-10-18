package com.three.kidult;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
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
import com.three.kidult.dto.PagingDto;
import com.three.kidult.dto.ProductDto;
import com.three.kidult.dto.UsedproductDto;
import com.three.kidult.model.biz.ProductBiz;
import com.three.kidult.model.biz.UsedproductBiz;

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
	public String godummy() {
		
		return "dummy";
	}
	
	@RequestMapping(value = "/dummydata01.do", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public void dummydate01(HttpServletRequest request, Model model, HttpServletResponse response) throws IOException {
		
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
				String product_imgUrl = product_imgUrls.getAsString();
				String product_pricest = product_prices.getAsString();
				int product_price = Integer.parseInt(product_pricest.replace("￦", "").replace(",", ""));
				
				
				String URL = URLs.getAsString();
				
				String link = "http://www.replicas.co.kr";
				
				Document doc = Jsoup.connect(link+URL).get();
				Elements elem = doc.select("prd-detail");
				
				Iterator<Element> ie1 = elem.select("img[src]").iterator();
				
				String product_details = link + ie1.toString();
				
				ProductDto dto = new ProductDto();
				dto.setCategory_no(1);
				dto.setProduct_name(product_name);
				dto.setProduct_imgurl(product_imgUrl);
				dto.setProduct_price(product_price);
				dto.setProduct_details(product_details);
				dto.setProduct_stock(10000);
				
				product.add(dto);
			}
			
			int res = pbiz.insert(product);
			
			out.println(res);
			
		}
		
		
	}
	
	
}
