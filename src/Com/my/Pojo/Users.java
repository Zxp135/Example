package Com.my.Pojo;

import org.springframework.stereotype.Component;

@Component("pojo2")
public class Users {

	private int id;
	private int uid;
	private String s_number;
	private String s_sex;
	private String workfor;
	private int userid;
	private Customer customer;
	private String username;
	private String password;

	@Override
	public String toString() {
		return "Users [id=" + id + ", s_number=" + s_number + ", s_sex=" + s_sex
				+ ", workfor=" + workfor + ", userid=" + userid + ", customer=" + customer + "]";
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Customer getCustomer() {
		return customer;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public String getS_sex() {
		return s_sex;
	}

	public void setS_sex(String s_sex) {
		this.s_sex = s_sex;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	public String getS_number() {
		return s_number;
	}

	public void setS_number(String s_number) {
		this.s_number = s_number;
	}

	public String getWorkfor() {
		return workfor;
	}

	public void setWorkfor(String workfor) {
		this.workfor = workfor;
	}
	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}
}
