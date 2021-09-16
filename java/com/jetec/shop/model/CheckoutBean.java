package com.jetec.shop.model;

import java.util.Date;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

public class CheckoutBean {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer orderid;
	private String firstname;
	private String lastname;
	private String company;
	private String email;
	private String phone;
	private String Address;
	private String postalcode;	
	private String Country;
	private String orderName;	
	private String orderAddress;
	private String orderPostalcode;
	private String orderEmail;
	private String orderPhone;
	private String message;
	private String orderstatus;	
	private Date createdate;
	
	
	
	public Integer getOrderid() {
		return orderid;
	}
	public void setOrderid(Integer orderid) {
		this.orderid = orderid;
	}
	public String getOrderstatus() {
		return orderstatus;
	}
	public void setOrderstatus(String orderstatus) {
		this.orderstatus = orderstatus;
	}
	public Date getCreatedate() {
		return createdate;
	}
	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return Address;
	}
	public void setAddress(String address) {
		Address = address;
	}
	public String getPostalcode() {
		return postalcode;
	}
	public void setPostalcode(String postalcode) {
		this.postalcode = postalcode;
	}
	public String getCountry() {
		return Country;
	}
	public void setCountry(String country) {
		Country = country;
	}
	public String getOrderName() {
		return orderName;
	}
	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}
	public String getOrderAddress() {
		return orderAddress;
	}
	public void setOrderAddress(String orderAddress) {
		this.orderAddress = orderAddress;
	}
	public String getOrderPostalcode() {
		return orderPostalcode;
	}
	public void setOrderPostalcode(String orderPostalcode) {
		this.orderPostalcode = orderPostalcode;
	}
	public String getOrderEmail() {
		return orderEmail;
	}
	public void setOrderEmail(String orderEmail) {
		this.orderEmail = orderEmail;
	}
	public String getOrderPhone() {
		return orderPhone;
	}
	public void setOrderPhone(String orderPhone) {
		this.orderPhone = orderPhone;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	@Override
	public String toString() {
		return "Checkout [firstname=" + firstname + ", lastname=" + lastname + ", company=" + company + ", email="
				+ email + ", phone=" + phone + ", Address=" + Address + ", postalcode=" + postalcode + ", Country="
				+ Country + ", orderName=" + orderName + ", orderAddress=" + orderAddress + ", orderPostalcode="
				+ orderPostalcode + ", orderEmail=" + orderEmail + ", orderPhone=" + orderPhone + ", message=" + message
				+ "]";
	}
	
	

}
