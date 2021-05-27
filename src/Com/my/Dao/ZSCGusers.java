package Com.my.Dao;

import java.util.List;

import Com.my.Pojo.Customer;
import Com.my.Pojo.UserAndCustomer;
import Com.my.Pojo.Users;

public interface ZSCGusers {

	//查询全部
	 public List<Users> selectALL();
	
	//模糊查询
	 public List<UserAndCustomer> selectSomeBody(UserAndCustomer userAndCustomer);
	
	//增加
     public  List<Customer> FindUser(Customer customer);
	 
	 public  List<Users> InsertUsers(Users users);
	
	 //删除
	 public int deleteuser(UserAndCustomer userAndCustomer);
	 
	 //修改
	 public int UPDATUser(Users users);
	 
	 
}
