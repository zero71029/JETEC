package com.jetec.shop.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.web.bind.annotation.RequestParam;


public class MessageInBean {

    private Integer id;
	private String email; 
	private String firstname;
	private String lastname;
	private String company;
	private String phone;
	private String message;
	private String country;
	private String reply;
	private Date create_date;//日期;
	private String product_model;
	private String productType ;
	private String industry ;
	private String otherQ;
	private String orderIndustry;
	
	
	
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public Date getCreate_date() {
		return create_date;
	}
	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}
	public String getProduct_model() {
		return product_model;
	}
	public void setProduct_model(String product_model) {
		this.product_model = product_model;
	}
	public String getProductType() {
		return productType;
	}
	public void setProductType(String productType) {
		this.productType = productType;
	}
	public String getIndustry() {
		return industry;
	}
	public void setIndustry(String industry) {
		this.industry = industry;
	}
	public String getOtherQ() {
		return otherQ;
	}
	public void setOtherQ(String otherQ) {
		this.otherQ = otherQ;
	}
	public String getOrderIndustry() {
		return orderIndustry;
	}
	public void setOrderIndustry(String orderIndustry) {
		this.orderIndustry = orderIndustry;
	}
	@Override
	public String toString() {
		return "MessageBuyBean [id=" + id + ", email=" + email + ", firstname=" + firstname + ", lastname=" + lastname
				+ ", company=" + company + ", phone=" + phone + ", message=" + message + ", reply=" + reply
				+ ", create_date=" + create_date + ", product_model=" + product_model + ", productType=" + productType
				+ ", industry=" + industry + ", otherQ=" + otherQ + ", orderIndustry=" + orderIndustry + "]";
	}
	

}
