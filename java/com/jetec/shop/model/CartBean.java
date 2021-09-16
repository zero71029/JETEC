package com.jetec.shop.model;

public class CartBean {
	
	private Integer id;
	private Integer num;
	private String name;
	private String pictureurl;
	private String model;
	private String specification;
	private Integer sellprice;
	private String product_group;
	private String product_option;
	private String product_group2;					
	private String product_option2;
	private String product_group3;
	private String product_option3;
	private String product_type;
		
	
	
	public String getProduct_type() {
		return product_type;
	}
	public void setProduct_type(String product_type) {
		this.product_type = product_type;
	}
	@Override
	public String toString() {
		return "CartBean [id=" + id + ", num=" + num + ", name=" + name + ", pictureurl=" + pictureurl + ", model="
				+ model + ", specification=" + specification + ", sellprice=" + sellprice + ", product_group="
				+ product_group + ", product_option=" + product_option + ", product_group2=" + product_group2
				+ ", product_option2=" + product_option2 + ", product_group3=" + product_group3 + ", product_option3="
				+ product_option3 + ", product_type=" + product_type + "]";
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
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPictureurl() {
		return pictureurl;
	}
	public void setPictureurl(String pictureurl) {
		this.pictureurl = pictureurl;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public String getSpecification() {
		return specification;
	}
	public void setSpecification(String specification) {
		this.specification = specification;
	}
	public Integer getSellprice() {
		return sellprice;
	}
	public void setSellprice(Integer sellprice) {
		this.sellprice = sellprice;
	}

}
