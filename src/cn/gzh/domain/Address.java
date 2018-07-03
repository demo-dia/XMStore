package cn.gzh.domain;

import java.io.Serializable;

/**
 *	用户收货地址,和用户是多对一的关系 
 *
 */
public class Address implements Serializable{
	private Integer aid;
	private String addressee;  //收货人
	private String phone;        //联系方式
	
	private City province;  //省份id
	private City city; //城市id
	private City county;//县城id
	
	private String street;     //具体地址
	private String postalcode;  //邮政编码
	private Boolean isDefault;  //是否默认
	
	private User user;             //所属的用户
	
	public String getAddressee() {
		return addressee;
	}
	public void setAddressee(String addressee) {
		this.addressee = addressee;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}

	
	
	public String getPostalcode() {
		return postalcode;
	}
	public void setPostalcode(String postalcode) {
		this.postalcode = postalcode;
	}
	public Boolean getIsDefault() {
		return isDefault;
	}
	public void setIsDefault(Boolean isDefault) {
		this.isDefault = isDefault;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Integer getAid() {
		return aid;
	}
	public void setAid(Integer aid) {
		this.aid = aid;
	}
	

	public City getProvince() {
		return province;
	}
	public void setProvince(City province) {
		this.province = province;
	}
	public City getCity() {
		return city;
	}
	public void setCity(City city) {
		this.city = city;
	}
	public City getCounty() {
		return county;
	}
	public void setCounty(City county) {
		this.county = county;
	}
	public String getStreet() {
		return street;
	}
	public void setStreet(String street) {
		this.street = street;
	}
	@Override
	public String toString() {
		return "Address [aid=" + aid + ", addressee=" + addressee + ", phone="
				+ phone + ", street=" + street + ", postalcode=" + postalcode
				+ ", isDefault=" + isDefault + "]";
	}
	
	
	
}
