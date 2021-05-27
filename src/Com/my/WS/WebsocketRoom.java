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

	
	private static  int onlinePeople=0;  //存放在线人数
	//存放各个用户的对应的聊天对象
	private static List<WebsocketRoom> websocketroom=new ArrayList<WebsocketRoom>();
	
	
	private Session session;
	
	@OnOpen
	 public void onpen(Session session) {
		this.session=session;
		websocketroom.add(this);
		onlinePeople++;
		 System.out.println("成功了！");
		 
	 }
	
	 
	 
	 @OnMessage                           //客户连接的session
	 public void onMessage(String message,Session session) throws IOException {
		 this.session.getBasicRemote().sendText(message);
		 
		 System.out.println(session+"ddd"+message);
	 }
	 
	 
	 @OnClose
	 public void Onclose() {
		 
		 
	 }
}
