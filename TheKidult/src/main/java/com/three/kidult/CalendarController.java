package com.three.kidult;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.three.kidult.dto.CalendarDto;
import com.three.kidult.model.biz.CalendarBizImpl;

@Controller
public class CalendarController {
	
	@Autowired
	private CalendarBizImpl biz;
	
	@RequestMapping(value="/full.go")
	public void listFull(HttpServletResponse response) {
		
		try {
			PrintWriter out = response.getWriter();
		
		
		List<CalendarDto> list = biz.fullList();
		
		JSONArray jArr = new JSONArray();
		HashMap<String, Object> hm = null;
		for(int i = 0; i < list.size(); i++) {
			
			hm = new HashMap<String, Object>();
			hm.put("id", list.get(i).getFullid());
			hm.put("title", list.get(i).getFulltitle());
			hm.put("start", list.get(i).getFullstart());
			hm.put("end", list.get(i).getFullend());
			hm.put("description", list.get(i).getFulldescription());
			
			jArr.add(hm);
		}
		
		
//		JSONObject jobj = new JSONObject();
//		jobj.put("event", jArr);
//		
//		JsonParser parser = new JsonParser();
//		JsonElement element = parser.parse(jobj.toString());
		
		out.print(jArr.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/fullDetail.go")
	public String fullDetail(@RequestParam("id")int fullId, Model model) {
		
		CalendarDto dto = biz.fullDetail(fullId);
		System.out.println(fullId);
		
		model.addAttribute("dto", dto);
		
		return "eventdetail";
	}
	
	@RequestMapping(value="/fullUpdate.go")
	public String fullUpdate(@RequestParam("id")int fullId, Model model) {
		
		CalendarDto dto = biz.fullDetail(fullId);
		
		model.addAttribute("dto", dto);
		
		return "eventupdate";
	}
	
	@RequestMapping(value="/fullUpdateRes.go")
	public String fullUpdateRes(CalendarDto dto, Model model) {
		
		
		int res = 0;
		
		res = biz.fullUpdate(dto);
		
		if(res>0) {
			
			System.out.println("update success");
			
			model.addAttribute("dto", dto);
			
			return "eventdetail";
		} else {
			
			System.out.println("update fail");
			
			model.addAttribute("dto", dto);
			
			return "eventupdate";
		}
	}
	
	@RequestMapping(value="/fullDelete.go")
	public void fullDelete(@RequestParam("id")int fullId, HttpServletResponse response, Model model) {
		
		try {
			PrintWriter out = response.getWriter();
			
			int res = 0;
			
			res = biz.fullDelete(fullId);
			
			if(res > 0) {
				System.out.println("삭제 성공");
				
			}else {
				System.out.println("삭제 실패");
				
				model.addAttribute("id", fullId);
				
				response.sendRedirect("fullDetail.go");
			}

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}
	
	@RequestMapping(value="/fullDropUpdate.go")
	public void fullDropUpdate(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			PrintWriter out = response.getWriter();
			
			int id = Integer.parseInt(request.getParameter("id"));
			String start = request.getParameter("start");
			String end = request.getParameter("end");
			
			System.out.println("start : " + start);
			System.out.println("end : " + end);
			
			
			CalendarDto dto = new CalendarDto();
			dto.setFullid(id);
			dto.setFullstart(start);
			dto.setFullend(end);
			
			int res = 0;
			
			res = biz.fullDropUpdate(dto);
			
			if(res>0) {
				out.print("success");
			} else {
				out.print("fail");
			}

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	@RequestMapping(value="/fullinsert.go")
	public void fullInsert(CalendarDto dto, HttpServletResponse response) {
		try {
			
			PrintWriter out = response.getWriter();
			
			int res = 0;
			res = biz.fullInsert(dto);
			
			if(res>0) {
				out.print("success");
			}else {
				out.print("fail");
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/uploadform.go")
	public String uploadForm() {
		return "eventuploadform";
	}


}
