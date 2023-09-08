package websocket;

import java.io.IOException;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

//요청이 오면 기능을 시작 하겠다.
@ServerEndpoint("/ChatingServer")
public class ChatServer {
	//Collections 클래스 synchronizedSet() 멀티스레드 환경에서 안전한 Set컬렉션을 생성 
	// Set은 순서를 유지 하지 않고 저장하며 중복 저장이 불가능 하다.
	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<>());

	@OnOpen		//클라이언트 접속 시 실행 
	public void onOpen(Session session) {
		clients.add(session); 	//세션 추가 
		System.out.println("웹소켓 연결 : " + session.getId());
	}
	@OnMessage // 메세지를 받으면 실행 
	public void onMessage(String message, Session session) throws IOException { 
		System.out.println("메세지 전송 : " + session.getId() + " : " + message);
		//동기화 블럭 
		synchronized (clients) {
			for(Session client : clients) {
				//메세지를 보낸 사용자가 아닌 다른 사용자들에게 메세지를 보내겠다.
				if(!client.equals(session)) {
					//입샙션 발생할 수 있어서 throws IOException를 추가 한다.
					client.getBasicRemote().sendText(message);
				}
			}
		}
	}
	@OnClose	//클라이언트와 연결이 끊기면 실행 
	public void onClose(Session session) {
		clients.remove(session);
		System.out.println("웹소켓 종료 : " + session.getId());
	}
	@OnError
	public void onError(Throwable e) {
		System.out.println("에러 발생");
		e.printStackTrace();
	}
	
	
	
}


















