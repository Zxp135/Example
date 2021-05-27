package Com.my.Service;

import java.util.List;

import Com.my.Pojo.Customer;
import Com.my.Pojo.UserAndCustomer;
import Com.my.Pojo.Users;

public interface UserService {

	
	
	    //查询全部
		 public List<Users> SearchALLUsers();
		
		//模糊查询
		 public List<UserAndCustomer> SearchSomeOne(UserAndCustomer userAndCustomer);
		
		//增加
	     public  List<Customer> FindUser(Customer customer);
		 
		 public  List<Users> InsertUsers(Users users);
		
		 //删除
		 public int DeleteUser(UserAndCustomer userAndCustomer);
		 
		 //修改
		 public String UpdateUser(Users users);
}
