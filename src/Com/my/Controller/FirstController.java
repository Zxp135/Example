package Com.my.Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import Com.my.Pojo.*;
import Com.my.Service.UserLoginService;
import Com.my.Service.UserService;

@Controller
public class FirstController {

	@Autowired           //ע��ע��
	private UserLoginService userLoginService;

	@Autowired
	private UserService userService;

	@RequestMapping("/he")
	@ResponseBody
	public String hhh() {
		String xString= "ddd";
		return xString;
	}
	    //��¼
	@CrossOrigin(origins = "*", maxAge = 3600)
	@RequestMapping(value = "/test", method = RequestMethod.POST)
	public String teString(Customer user, HttpServletRequest request) {
			    	
		System.out.println("����ɹ���");
		System.out.println(user.getUsername()+"\n"+user.getPassword());
		 Customer realuser=userLoginService.Userlogin(user);                 
		if (realuser == null)
		{
			request.setAttribute("out", "�˺Ż��������");
//			return "fialed";
			  return "forward:Login.jsp";
		}
		if (realuser.getUsername().equals("zpp") || realuser.getUsername().equals("cwg")) 
		{
			request.setAttribute("log", realuser.getUsername() + "����Ա");
			  return "WEB-INF/jsp/NewFile1.jsp";
		} 
		request.removeAttribute("out");
		request.setAttribute("user", realuser.getUsername());
//		return "Success";
		return "WEB-INF/jsp/TestPage.jsp";
	}

	@RequestMapping(value = "/go")
	public String to() { // ��תҳ��Ĺ���
		return "/WEB-INF/jsp/UserResgister.jsp";
	}
	
	//ע��
	@RequestMapping(value = "/ADD",method =RequestMethod.POST)
	public String teString2(Users user, HttpServletRequest request, Model d) {
		Customer customer = user.getCustomer();
		if (customer.getUsername().equals("")) {
			request.setAttribute("out", "�벹ȫ��Ϣ");
			return "forward:/WEB-INF/jsp/UserResgister.jsp";
		} else {
			try {
				String reS=userLoginService.Resgier(user);
				if (reS.equals("FAIL")) {
					request.setAttribute("out", "ע��ʧ��");
					return "forward:/WEB-INF/jsp/UserResgister.jsp";
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			d.addAttribute("out", "�ɹ�ע�ᣡ");
			return "/Login.jsp";
		}
		}

	//��ѯ����
		@RequestMapping(value = "/mydata", method = RequestMethod.POST)
		@ResponseBody            //�Զ�json������
		public List<Users> Getdata(HttpServletResponse reponServletResponse) throws IOException {
			List<Users> xCustomers=userService.SearchALLUsers();
			return xCustomers;
		}

		 //ģ����ѯ
		@RequestMapping(value = "/mydata2", method = RequestMethod.POST)
		@ResponseBody            //�Զ�json������
		public List<UserAndCustomer> GetSomebody(@RequestBody UserAndCustomer uc,HttpServletResponse reponServletResponse) throws IOException {
			String xx=uc.getS_number();
			String xxx=uc.getUsername();
			String xxxx=uc.getWorkfor();
			if(xx==null || xx=="") {
				uc.setS_number(null); 
			}
			else {
				uc.setS_number("%"+xx+"%");
			}
			if(xxx==null || xxx=="") {
				uc.setUsername(null);  
			}else {
				uc.setUsername("%"+xxx+"%");
			}
			if(xxxx==null  || xxxx=="") {
				uc.setWorkfor(null);
				}
			else {
				uc.setWorkfor("%"+xxxx+"%");
			}
			System.out.print(uc);
			List<UserAndCustomer> xCustomers=userService.SearchSomeOne(uc);
			
				System.out.println(xCustomers);
			
				System.out.print("ss");
			
			return xCustomers;
		}
		
		@RequestMapping("/Apptext")
		public String name() {

			return "/WEB-INF/jsp/RealUser.jsp";
		}
		//ɾ���û�
		@RequestMapping(value="/deleteuser",method = RequestMethod.POST)
		@ResponseBody
		public String deleteu(@RequestBody UserAndCustomer du) {
			System.out.print(du);
			int row=userService.DeleteUser(du);
			if(row>0) {
				return "OK";
			}else {
				return "FAIL";
				  }
		}
		
		//�½��û�
		@RequestMapping(value = "/create" ,method = RequestMethod.POST)
		@ResponseBody
		public String createUser(@RequestBody Users U) {
			
			 Customer customer=new Customer();
			 String dd=U.getUsername();
			 String string=U.getPassword();
			 customer.setUsername(dd);
			 customer.setPassword(string);
			 U.setCustomer(customer);
			System.out.print(customer.getPassword()+"   ");
			String cReS=userLoginService.Resgier(U);
			return cReS;
		}
		
		//�޸��û�
			@RequestMapping(value = "/updata",method = RequestMethod.POST)
			@ResponseBody
			public String UpdataUser(@RequestBody Users users) {
				String row=userService.UpdateUser(users);
				return row;	
			}
	
	
}
