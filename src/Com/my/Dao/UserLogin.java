package Com.my.Dao;

import java.util.List;

import Com.my.Pojo.Customer;
import Com.my.Pojo.Users;

/*
 * Dao��ӿ�ģʽ
 * 
 */
public interface UserLogin {
   
     //��¼
	 public Customer Login(Customer customer);
	 
	 //ע��
	 public  List<Customer> FindUser(Customer customer);
	 
	 public  int           InsertUsers1(Customer customer);
	 public  int           InsertUsers2(Users users);
}
