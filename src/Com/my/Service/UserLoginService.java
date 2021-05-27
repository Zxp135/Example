package Com.my.Service;

import java.util.List;

import Com.my.Pojo.Customer;
import Com.my.Pojo.Users;

public interface UserLoginService {
  //µÇÂ¼
	public Customer Userlogin(Customer customer);
	
	//×¢²á
	 public     List<Customer>      findU(Customer customer);
     public     int                 add1Users(Customer customer);
	 public     int                 add2Users(Users users);
	 public String Resgier(Users users) ;
	
}
