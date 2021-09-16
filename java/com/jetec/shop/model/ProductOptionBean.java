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
@Table(name = "product_option")
public class ProductOptionBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private Integer productid;
	private String product_group;
	private String product_option;
	private String product_group2;					
	private String product_option2;
	private String product_group3;
	private String product_option3;
	private String product_status;
	private Integer purchase_price;// 進價
	private Integer product_price;
	private Integer product_quantity;
	private String product_type;
	private String product_model;
	
	
	//商品
//	@JsonIgnore
//	@ManyToOne(targetEntity = ProductBean.class)
//	@JoinColumn(name = "productid", referencedColumnName = "id", insertable = false, updatable = false)
//	private ProductBean ProductBean;



	public String getProduct_type() {
		return product_type;
	}



	public void setProduct_type(String product_type) {
		this.product_type = product_type;
	}



	public String getProduct_model() {
		return product_model;
	}



	public void setProduct_model(String product_model) {
		this.product_model = product_model;
	}



	public Integer getId() {
		return id;
	}



	public void setId(Integer id) {
		this.id = id;
	}



	public Integer getProductid() {
		return productid;
	}



	public void setProductid(Integer productid) {
		this.productid = productid;
	}



	public String getProduct_group() {
		return product_group;
	}



	public void setProduct_group(String product_group) {
		this.product_group = product_group;
	}



	public String getProduct_option() {
		return product_option;
	}



	public void setProduct_option(String product_option) {
		this.product_option = product_option;
	}



	public String getProduct_group2() {
		return product_group2;
	}



	public void setProduct_group2(String product_group2) {
		this.product_group2 = product_group2;
	}



	public String getProduct_option2() {
		return product_option2;
	}



	public void setProduct_option2(String product_option2) {
		this.product_option2 = product_option2;
	}



	public String getProduct_group3() {
		return product_group3;
	}



	public void setProduct_group3(String product_group3) {
		this.product_group3 = product_group3;
	}



	public String getProduct_option3() {
		return product_option3;
	}



	public void setProduct_option3(String product_option3) {
		this.product_option3 = product_option3;
	}



	public String getProduct_status() {
		return product_status;
	}



	public void setProduct_status(String product_status) {
		this.product_status = product_status;
	}



	public Integer getPurchase_price() {
		return purchase_price;
	}



	public void setPurchase_price(Integer purchase_price) {
		this.purchase_price = purchase_price;
	}



	public Integer getProduct_price() {
		return product_price;
	}



	public void setProduct_price(Integer product_price) {
		this.product_price = product_price;
	}



	public Integer getProduct_quantity() {
		return product_quantity;
	}



	public void setProduct_quantity(Integer product_quantity) {
		this.product_quantity = product_quantity;
	}



//	public ProductBean getProductBean() {
//		return ProductBean;
//	}
//
//
//
//	public void setProductBean(ProductBean productBean) {
//		ProductBean = productBean;
//	}



	@Override
	public String toString() {
		return "ProductOptionBean [id=" + id + ", productid=" + productid + ", product_group=" + product_group
				+ ", product_option=" + product_option + ", product_group2=" + product_group2 + ", product_option2="
				+ product_option2 + ", product_group3=" + product_group3 + ", product_option3=" + product_option3
				+ ", product_status=" + product_status + ", purchase_price=" + purchase_price + ", product_price="
				+ product_price + ", product_quantity=" + product_quantity  + "]";
	} 
	
	
	
	
}
