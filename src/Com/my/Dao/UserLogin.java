package Com.my.Dao;

import java.util.List;

import Com.my.Pojo.Customer;
import Com.my.Pojo.Users;

/*
 * Dao层接口模式
 * 
 */
public interface UserLogin {
   
     //登录
	 public Customer Login(Customer customer);
	 
	 //注册
	 public  List<Customer> FindUser(Customer customer);
	 
	 public  int           InsertUsers1(Customer customer);
	 public  int           InsertUsers2(Users users);
}
