package cn.gzh.domain;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

/*
 * CREATE TABLE USER(
	uid INT PRIMARY KEY AUTO_INCREMENT,
	loginname VARCHAR(20) ,
	PASSWORD VARCHAR(20) ,
	username VARCHAR(20),
	email VARCHAR(30),
	phone VARCHAR(20),
	addr VARCHAR(50),
	sex VARCHAR(10),
	state INT,
	CODE VARCHAR(64)
);
 */
public class User implements Serializable {
	private Integer uid;
	private String loginName;
	private String password;
	private String userName;
	private String email;
	private String sex;
	private Integer state;
	private String code;
	private Set<Address> addresses = new HashSet<Address>();
	private Set<Order>  orders = new HashSet<Order>();
	private Set<Product> favorites = new HashSet<Product>();
	
	
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
	public Set<Address> getAddresses() {
		return addresses;
	}
	public void setAddresses(Set<Address> addresses) {
		this.addresses = addresses;
	}
	public Set<Order> getOrders() {
		return orders;
	}
	public void setOrders(Set<Order> orders) {
		this.orders = orders;
	}
	
	public Set<Product> getFavorites() {
		return favorites;
	}
	public void setFavorites(Set<Product> favorites) {
		this.favorites = favorites;
	}
	@Override
	public String toString() {
		return "User [uid=" + uid + ", loginName=" + loginName + ", password="
				+ password + ", userName=" + userName + ", email=" + email
				+ ", sex=" + sex + ", state=" + state + ", code=" + code
				+ ", addresses=" + addresses + ", orders=" + orders + "]";
	}
	

	
}
