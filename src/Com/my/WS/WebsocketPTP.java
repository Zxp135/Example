package Com.my.WS;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.springframework.stereotype.Component;

import javafx.scene.chart.PieChart.Data;
@ServerEndpoint(value="/websocketPTP")
@Component
public class WebsocketPTP {
       
	 //
	private static int  AllOnline=0;
	//存储个人的websocket
	 private static List<WebsocketPTP> PTP = new ArrayList<WebsocketPTP>(); 
	 private static List<String> pnameList=new ArrayList<String>();
	   //个人的session
	   private Session Session;
	    
	   public WebsocketPTP() {
		// TODO Auto-generated constructor stub
	  }
	
	@OnOpen
	 public void onpen(Session session) {  
		this.Session=session;
        PTP.add(this);
		pnameList.add(String.valueOf(AllOnline));
        AllOnline++;
		System.out.println("成功了！"+AllOnline);
	}
	
	 
	 
	 @OnMessage                           //客户连接的session
	 public void onMessage(String message,Session session) throws IOException {
         for(WebsocketPTP x:PTP) {
        	 if(x.getSession()==this.Session) {continue;}
		 x.sendMesage(message);}
	 }
	 
	 
	 public Session getSession() {
		return Session;
	}

	@OnClose
	 public void Onclose() {
		 PTP.remove(this);
		 AllOnline--;
	 }
	 
	 //发消息
	 public void sendMesage(String text) throws IOException {
		 System.out.print(text);
		 Date data=new Date();
		 SimpleDateFormat dateFormat=new SimpleDateFormat("HH:mm:ss");
		 String [] sx=text.split("\\+");
		 this.Session.getBasicRemote().sendText(dateFormat.format(data)+"<br/>"+sx[1]+":  &nbsp &nbsp &nbsp"+sx[0]+"<br/>");
	 }
	 
}
