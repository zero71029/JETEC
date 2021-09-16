package com.jetec.shop.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "order_detail")
public class OrderDetail {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private Integer orderid;
    private Integer productid;
    private Integer sellingprice;
    private Integer quantity;
    private String discount;//折扣
    private String remark;//備住
    
    @JsonIgnore
    @ManyToOne(targetEntity =OrderBean.class)
    @JoinColumn(name = "orderid", referencedColumnName = "orderid", insertable = false, updatable = false)
    private OrderBean OrderBean;
    
    
	public OrderBean getOrderBean() {
		return OrderBean;
	}
	public void setOrderBean(OrderBean orderBean) {
		OrderBean = orderBean;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getOrderid() {
		return orderid;
	}
	public void setOrderid(Integer orderid) {
		this.orderid = orderid;
	}
	public Integer getProductid() {
		return productid;
	}
	public void setProductid(Integer productid) {
		this.productid = productid;
	}
	public Integer getSellingprice() {
		return sellingprice;
	}
	public void setSellingprice(Integer sellingprice) {
		this.sellingprice = sellingprice;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public String getDiscount() {
		return discount;
	}
	public void setDiscount(String discount) {
		this.discount = discount;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	@Override
	public String toString() {
		return "OrderDetail [id=" + id + ", orderid=" + orderid + ", productid=" + productid + ", sellingprice="
				+ sellingprice + ", quantity=" + quantity +  "]";
	}
    
    
    
    

}
