package com.jetec.shop.model;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import com.fasterxml.jackson.annotation.JsonIgnore;


@Entity
@Table(name = "orders")
public class OrderBean {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer orderid;//
    private Integer userid;//
	private String email;//
	private String firstname;//
	private String lastname;//
	private String company;//

	private String phone;//
	private String address;//
	private String postalcode;	//
	private String country;//
	private String order_name;//	
	private String order_address;//
	private String order_postalcode;//
	private String order_email;//
	private String order_phone;//
	private String message;//
	private String orderstatus;//	
	private Date createdate;//
	
	@JsonIgnore
	@OneToMany(targetEntity=OrderDetail.class, cascade = CascadeType.ALL)
	@JoinColumn(name = "orderid", referencedColumnName = "orderid")
	private List<OrderDetail> OrderDetail= new LinkedList<>();	
	
	
    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "orderstatus", referencedColumnName = "orderstatus",insertable = false, updatable = false)
    private OrderStatusBean orderStatusBean;


    
    
    
	public Integer getUserid() {
		return userid;
	}


	public void setUserid(Integer userid) {
		this.userid = userid;
	}


	public Integer getOrderid() {
		return orderid;
	}


	public void setOrderid(Integer orderid) {
		this.orderid = orderid;
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
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getPostalcode() {
		return postalcode;
	}


	public void setPostalcode(String postalcode) {
		this.postalcode = postalcode;
	}


	public String getCountry() {
		return country;
	}


	public void setCountry(String country) {
		this.country = country;
	}


	public String getOrder_name() {
		return order_name;
	}


	public void setOrder_name(String order_name) {
		this.order_name = order_name;
	}


	public String getOrder_address() {
		return order_address;
	}


	public void setOrder_address(String order_address) {
		this.order_address = order_address;
	}


	public String getOrder_postalcode() {
		return order_postalcode;
	}


	public void setOrder_postalcode(String order_postalcode) {
		this.order_postalcode = order_postalcode;
	}


	public String getOrder_email() {
		return order_email;
	}


	public void setOrder_email(String order_email) {
		this.order_email = order_email;
	}


	public String getOrder_phone() {
		return order_phone;
	}


	public void setOrder_phone(String order_phone) {
		this.order_phone = order_phone;
	}


	public String getMessage() {
		return message;
	}


	public void setMessage(String message) {
		this.message = message;
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


	public List<OrderDetail> getOrderDetail() {
		return OrderDetail;
	}


	public void setOrderDetail(List<OrderDetail> orderDetail) {
		OrderDetail = orderDetail;
	}
 

	public OrderStatusBean getOrderStatusBean() {
		return orderStatusBean;
	}


	public void setOrderStatusBean(OrderStatusBean orderStatusBean) {
		this.orderStatusBean = orderStatusBean;
	}


	@Override
	public String toString() {
		return "OrderBean [orderid=" + orderid + ", firstname=" + firstname + ", lastname=" + lastname + ", company="
				+ company + ", email=" + email + ", phone=" + phone + ", address=" + address + ", postalcode="
				+ postalcode + ", country=" + country + ", order_name=" + order_name + ", order_address="
				+ order_address + ", order_postalcode=" + order_postalcode + ", order_email=" + order_email
				+ ", order_phone=" + order_phone + ", message=" + message + ", orderstatus=" + orderstatus
				+ ", createdate=" + createdate + ", OrderDetail=" + OrderDetail + ", orderStatusBean=" + orderStatusBean
				+ "]";
	}
	
	
	

	
	

}
