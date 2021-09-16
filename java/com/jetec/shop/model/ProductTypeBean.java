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
@Table(name = "product_type")
public class ProductTypeBean {
    @Id  
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer type;
    private String love1;//規格
    private String love2;//狀態 
    
    
	@JsonIgnore
	@OneToMany( targetEntity = ProductBean.class,cascade = CascadeType.ALL)
	@JoinColumn(name = "type", referencedColumnName = "type")
    private List<ProductBean>  ProductBean;   
	 

	public List<ProductBean> getProductBean() {
		return ProductBean;
	}
	public void setProductBean(List<ProductBean> productBean) {
		ProductBean = productBean;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public String getLove1() {
		return love1;
	}
	public void setLove1(String love1) {
		this.love1 = love1;
	}
	public String getLove2() {
		return love2;
	}
	public void setLove2(String love2) {
		this.love2 = love2;
	}
	public Integer getType() {
		return type;
	}
	@Override
	public String toString() {
		return "ProductTypeBean [type=" + type + ", love1=" + love1 + ", love2=" + love2 + "]";
	}

    
    

}
