package Com.my.Pojo;

public class UserAndCustomer {

	
	private int id;
	private String s_number;
	private String s_sex;
	private String workfor;
	private int userid;
	private String username;
	private Customer customer;
	private int uid;
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	@Override
	public String toString() {
		return "UserAndCustomer [id=" + id + ", s_number=" + s_number + ", s_sex=" + s_sex + ", workfor=" + workfor
				+ ", userid=" + userid + ", username=" + username +  "]"+customer;
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
	public String getS_sex() {
		return s_sex;
	}
	public void setS_sex(String s_sex) {
		this.s_sex = s_sex;
	}
	public String getWorkfor() {
		return workfor;
	}
	public void setWorkfor(String workfor) {
		this.workfor = workfor;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}

}
