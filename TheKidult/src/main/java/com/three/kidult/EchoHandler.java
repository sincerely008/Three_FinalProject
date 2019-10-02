package com.three.kidult;

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
	
	//클라이언트가 연결이후에 실행되는 메소드
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		logger.info("{0} conntected", session.getId());
		sessions.add(session); 		// 접속하는 id들을 sessions에 담는다
	}
	
	//클라이언트가 웹소켓 서버로 메세지를 전송했을시 실행되는 메소드
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
		logger.info("From {0}, recieved Message : {1} ", session.getId(), message.getPayload());
		
		String senderId = session.getId();
		//연결되어있는 모든 클라이언트에게 메세지를 전송한다
	    //session.sendMessage(new TextMessage("echo : " + message.getPayload()));	
		for(WebSocketSession sess: sessions) {
			sess.sendMessage(new TextMessage(senderId+" : "+message.getPayload()));
		}
	}
	
	//클라이언트가 연결을 끊었을때 실행되는 메소드
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		logger.info("{0} Connection Closed ", session.getId());
		sessions.remove(session);
	}
}


//https://victorydntmd.tistory.com/253 참고사이트
