package com.jetec.shop.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name ="product_specification")
public class ProductSpecificationBean {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer specification;
    private Integer id;//商品id
    private String sptext;//規格描述
    
    
    @JsonIgnore
    @ManyToOne( targetEntity = ProductBean.class)
    @JoinColumn(name = "id", referencedColumnName = "id", insertable = false, updatable = false)
    private ProductBean productBean;
      
    
    
    
    
    
    
    
	public ProductBean getProductBean() {
		return productBean;
	}
	public void setProductBean(ProductBean productBean) {
		this.productBean = productBean;
	}
	public Integer getSpecification() {
		return specification;
	}
	public void setSpecification(Integer specification) {
		this.specification = specification;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getSptext() {
		return sptext;
	}
	public void setSptext(String sptext) {
		this.sptext = sptext;
	}
	@Override
	public String toString() {
		return "ProducrSpecificationBean [specification=" + specification + ", id=" + id + ", sptext=" + sptext
				+ "]";
	}
	
    
}
