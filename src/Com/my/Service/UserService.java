package Com.my.Service;

import java.util.List;

import Com.my.Pojo.Customer;
import Com.my.Pojo.UserAndCustomer;
import Com.my.Pojo.Users;

public interface UserService {

	
	
	    //��ѯȫ��
		 public List<Users> SearchALLUsers();
		
		//ģ����ѯ
		 public List<UserAndCustomer> SearchSomeOne(UserAndCustomer userAndCustomer);
		
		//����
	     public  List<Customer> FindUser(Customer customer);
		 
		 public  List<Users> InsertUsers(Users users);
		
		 //ɾ��
		 public int DeleteUser(UserAndCustomer userAndCustomer);
		 
		 //�޸�
		 public String UpdateUser(Users users);
}
