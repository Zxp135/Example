package Com.my.WS;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CopyOnWriteArraySet;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.springframework.stereotype.Component;



@ServerEndpoint(value="/websocket11")
@Component
public class WebsocketRoom {

	
	private static  int onlinePeople=0;  //�����������
	//��Ÿ����û��Ķ�Ӧ���������
	private static List<WebsocketRoom> websocketroom=new ArrayList<WebsocketRoom>();
	
	
	private Session session;
	
	@OnOpen
	 public void onpen(Session session) {
		this.session=session;
		websocketroom.add(this);
		onlinePeople++;
		 System.out.println("�ɹ��ˣ�");
		 
	 }
	
	 
	 
	 @OnMessage                           //�ͻ����ӵ�session
	 public void onMessage(String message,Session session) throws IOException {
		 this.session.getBasicRemote().sendText(message);
		 
		 System.out.println(session+"ddd"+message);
	 }
	 
	 
	 @OnClose
	 public void Onclose() {
		 
		 
	 }
}
