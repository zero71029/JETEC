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
@Table(name = "product_picture")
public class ProductPictureBean {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private Integer productid;
    private String producturl;
    
    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "productid", referencedColumnName = "id", insertable = false, updatable = false)
    private ProductBean productBean;
    
    
    
    
    
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
	public String getProducturl() {
		return producturl;
	}
	public void setProducturl(String producturl) {
		this.producturl = producturl;
	}
	@Override
	public String toString() {
		return "ProductPictureBean [id=" + id + ", productid=" + productid + ", producturl=" + producturl + "]";
	}
    
    
	
}
