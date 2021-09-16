package com.jetec.shop.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;


@Entity
@Table(name = "order_status")
public class OrderStatusBean {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer orderstatus;
	private String content;
	
	
	@JsonIgnore
	@OneToMany( targetEntity = OrderBean.class,cascade = CascadeType.ALL)
	@JoinColumn(name = "orderstatus", referencedColumnName = "orderstatus")
	private List<OrderBean> orderBeans;


	@Override
	public String toString() {
		return "OrderStatusBean [orderstatus=" + orderstatus + ", content=" + content + "]";
	}


	public Integer getOrderstatus() {
		return orderstatus;
	}


	public void setOrderstatus(Integer orderstatus) {
		this.orderstatus = orderstatus;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public List<OrderBean> getOrderBeans() {
		return orderBeans;
	}


	public void setOrderBeans(List<OrderBean> orderBeans) {
		this.orderBeans = orderBeans;
	}
	
}
