package com.three.kidult;

import com.three.kidult.dto.MemberDto;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Controller
public class EchoHandler extends TextWebSocketHandler {

	private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);
	List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		logger.info("{0} conntected", session.getId());		
		sessions.add(session); 
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
		logger.info("From {0}, recieved Message : {1} ", session.getId(), message.getPayload());
		
		MemberDto dto = new MemberDto();
		if(dto.getMember_id()==null) {	
			String senderId = "비회원";
			for(WebSocketSession sess: sessions) {
				sess.sendMessage(new TextMessage(senderId+" : "+message.getPayload()));
			}
		}else {
			String senderId = dto.getMember_id();
			for(WebSocketSession sess: sessions) {
				sess.sendMessage(new TextMessage(senderId+" : "+message.getPayload()));
			}
		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		logger.info("{0} Connection Closed ", session.getId());
		sessions.remove(session);
	}
}


//https://victorydntmd.tistory.com/253 참고사이트
