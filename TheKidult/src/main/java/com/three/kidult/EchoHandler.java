package com.three.kidult;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.three.kidult.dto.ChattingDto;

@Controller
public class EchoHandler extends TextWebSocketHandler {

	private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);
	List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	
	//Map<String, WebSocketSession> sessions = new HashMap<String, WebSocketSession>();
	//int a = 0;

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		logger.info("{} conntected", session.getId());
		sessions.add(session); 	
		
		/*String non = "비회원" + a;
		System.out.println(non);
		sessions.put(non, session);
		a++;*/
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		logger.info("From {}, recieved Message : {} ", session.getId(), message.getPayload());

		/*Set<Entry<String, WebSocketSession>> entrySet = sessions.entrySet();
		 for( Map.Entry<String, String> entry : entrySet) {
		 System.out.println(entry.getKey() + ":" + entry.getValue());
		for (Map.Entry<String, WebSocketSession> entry : entrySet) {
			entry.getValue().sendMessage(new TextMessage(entry.getKey() + " : " + message.getPayload()));
		}*/	
		

		String senderId = session.getId();
		String id=ChattingDto.getChatting_user();

		System.out.println(id);
		
		if(id==null){
			for(WebSocketSession sess: sessions) {
				sess.sendMessage(new TextMessage("비회원 "+senderId+" : "+message.getPayload()));	
			}
		}else{
			for(WebSocketSession sess: sessions) {
				sess.sendMessage(new TextMessage(id+" 회원"+" : "+message.getPayload()));
			}
		}		
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		logger.info("{} Connection Closed ", session.getId());
		sessions.remove(session);
	}
}
