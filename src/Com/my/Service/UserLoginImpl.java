package Com.my.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import Com.my.Dao.UserLogin;
import Com.my.Pojo.Customer;
import Com.my.Pojo.Users;

@Service
@Transactional
public class UserLoginImpl implements UserLoginService{

	@Autowired
	private UserLogin usLogin;
	
	public Customer Userlogin(Customer customer) {
		
		return this.usLogin.Login(customer);
	}

	
	@Override
	public List<Customer> findU(Customer customer) {
		// TODO Auto-generated method stub
		return usLogin.FindUser(customer);
	}

	@Override
	public int add1Users(Customer customer) {
		// TODO Auto-generated method stub
		return usLogin.InsertUsers1(customer);
	}

	@Override
	public int add2Users(Users users) {
		// TODO Auto-generated method stub
		return usLogin.InsertUsers2(users);
	}

	public String Resgier(Users users) {
		Customer customer=users.getCustomer();
		List<Customer> x1=findU(customer);
		if(x1.size()>0) {
			return "FAIL";
		}else {
			int row1=add1Users(customer);
			List<Customer> x2=findU(customer);
			users.setUserid(x2.get(0).getId());
		    int row2=add2Users(users);
		    if(row1<0 || row2<0)
	             return "FAIL";
		}
	   return "SUCCESS";   
	}
	


}
