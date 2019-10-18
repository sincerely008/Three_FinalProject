package com.three.kidult.crawling;

import java.io.File;
import java.io.FileWriter;
import java.util.Iterator;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Crawling {
	
	public static void main(String[] args) throws Exception {
		
		String URL = "http://www.replicas.co.kr/shop/shopbrand.html?type=Y&xcode=124&sort=&page=1";
		
		Document doc = Jsoup.connect(URL).get();

		Elements elem = doc.select("div.item-wrap");
		Iterator<Element> ie1 = elem.select("div.item-cont > dl.item-list > dt.thumb > a > img[src]").iterator();
		Iterator<Element> ie2 = elem.select("div.item-cont > dl.item-list > dd > ul > li.prd-brand").iterator();
		Iterator<Element> ie3 = elem.select("div.item-cont > dl.item-list > dd > ul > li.prd-price").iterator();
		String link = "http://www.replicas.co.kr";
		
		
		JSONArray jsonar = new JSONArray();
		while(ie1.hasNext()) {
			//System.out.println("{"+"\"img\" : "+ "\""+"http://www.replicas.co.kr"+ie1.next().attr("src")+"\""+", "+"\"name\" : "+"\""+ie2.next().text()+"\""+", "+"\"price\" : "+"\""+ie3.next().text()+"\""+"}");
			
			//String craw = "{"+"\"img\" : "+ "\""+"http://www.replicas.co.kr"+ie1.next().attr("src")+"\""+", "+"\"name\" : "+"\""+ie2.next().text()+"\""+", "+"\"price\" : "+"\""+ie3.next().text()+"\""+"}";
				
			JSONObject jsonoj = new JSONObject();
				jsonoj.put("img", link+ie1.next().attr("src"));
				jsonoj.put("name", ie2.next().text());
				jsonoj.put("price", ie3.next().text());
				jsonar.add(jsonoj);
			
		}
		
		try {
			
			FileWriter file = new FileWriter(new File("textfile.json"),true);
			file.write(jsonar.toJSONString());
			file.flush();
			file.close();
		} catch (Exception e) {
			System.out.println("실패");
		}		
	}
}
