package Com.my.Dao;

import java.util.List;

import Com.my.Pojo.Customer;
import Com.my.Pojo.UserAndCustomer;
import Com.my.Pojo.Users;

public interface ZSCGusers {

	//��ѯȫ��
	 public List<Users> selectALL();
	
	//ģ����ѯ
	 public List<UserAndCustomer> selectSomeBody(UserAndCustomer userAndCustomer);
	
	//����
     public  List<Customer> FindUser(Customer customer);
	 
	 public  List<Users> InsertUsers(Users users);
	
	 //ɾ��
	 public int deleteuser(UserAndCustomer userAndCustomer);
	 
	 //�޸�
	 public int UPDATUser(Users users);
	 
	 
}
