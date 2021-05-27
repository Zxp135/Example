package Com.my.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import Com.my.Dao.ZSCGusers;
import Com.my.Pojo.Customer;
import Com.my.Pojo.UserAndCustomer;
import Com.my.Pojo.Users;

@Service
@Transactional
public class UserServiceImpl implements UserService{

	@Autowired
	private ZSCGusers zscgusers;
	
	@Override
	public List<Users> SearchALLUsers() {
		
		return zscgusers.selectALL();
	}

	@Override
	public List<UserAndCustomer> SearchSomeOne(UserAndCustomer userAndCustomer) {
		// TODO Auto-generated method stub
		return zscgusers.selectSomeBody(userAndCustomer);
	}

	@Override
	public List<Customer> FindUser(Customer customer) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Users> InsertUsers(Users users) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int DeleteUser(UserAndCustomer userAndCustomer) {
		// TODO Auto-generated method stub
		return zscgusers.deleteuser(userAndCustomer);
	}

	@Override
	public String UpdateUser(Users users) {
		// TODO Auto-generated method stub
	int rowss = zscgusers.UPDATUser(users);
		if(rowss>0) {
			return "OK";	
		}else {
			return "FAIL";
		}
	}

}
