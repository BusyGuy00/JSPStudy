package webchat;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/chatingServer")
public class ChatServer {
	//Collections클래스 synchronizedSet() 멀티스레드 환경에서 안전한 Set컬렉션을 생성
	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<>());
	
	@OnOpen
	public void onOpen(Session session) {
		clients.add(session);
		System.out.println("웹소켓연결 : "+session.getId());
	}
	@OnMessage
	public void onMessage(String message, Session session) throws IOException {
		System.out.println("메세지 전송: "+session.getId()+" : "+message);
		synchronized (clients) {
			for(Session client : clients) {
				if(!client.equals(session)) {
					client.getBasicRemote().sendText(message);
				}
			}
		}
	}
	@OnClose
	public void onClose(Session session) {
		clients.remove(session);
		System.out.println("웹소켓 종료 : "+session.getId());
	}
	@OnError
	public void onError(Throwable e) {
		System.out.println("에러발생");
		e.printStackTrace();
	}
}
