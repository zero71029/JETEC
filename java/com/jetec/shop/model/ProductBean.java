package com.jetec.shop.model;

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
@Table(name = "product")
public class ProductBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private Integer sellprice;// 售價
	private Integer purchaseprice;// 進價
	private Integer vendorid;// 廠商號
	private Integer productcategoryid;// 分類號
	private Integer quantity;// 數量
	private String model;// 品號
	private String name;// 名子
	private String producttext;// 描述
	private String specification;// 規格
	private String productstatus;// 狀態
	private String pictureurl;// 圖片名稱
	private Integer count;
	private Integer type;

	
	
	//商品選項
	@JsonIgnore
	@OneToMany(targetEntity = ProductOptionBean.class, cascade = CascadeType.ALL)
	@JoinColumn(name = "productid", referencedColumnName = "id")
	private List<ProductOptionBean> productOptionBean;

	//商品分類
	@JsonIgnore
	@ManyToOne(targetEntity = ProductTypeBean.class)
	@JoinColumn(name = "type", referencedColumnName = "type", insertable = false, updatable = false)
	private ProductTypeBean productTypeBean;// 分類
	//商品圖片
	@JsonIgnore
	@OneToMany(mappedBy = "productid", cascade = CascadeType.ALL)
	private List<ProductPictureBean> productpicturebeans;
	//商品特點
	@JsonIgnore
	@OneToMany(targetEntity = ProductSpecificationBean.class, cascade = CascadeType.ALL)
	@JoinColumn(name = "id", referencedColumnName = "id")
	private List<ProductSpecificationBean> psb;
	//pdf位置
	@JsonIgnore
	@OneToMany(mappedBy = "productid", cascade = CascadeType.ALL)
	private List<PdfUrlBean> pdfurl;
	
	



	public List<PdfUrlBean> getPdfurl() {
		return pdfurl;
	}

	public void setPdfurl(List<PdfUrlBean> pdfurl) {
		this.pdfurl = pdfurl;
	}

	public List<ProductOptionBean> getProductOptionBean() {
		return productOptionBean;
	}

	public void setProductOptionBean(List<ProductOptionBean> productOptionBean) {
		this.productOptionBean = productOptionBean;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public ProductTypeBean getProductTypeBean() {
		return productTypeBean;
	}

	public void setProductTypeBean(ProductTypeBean productTypeBean) {
		this.productTypeBean = productTypeBean;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public List<ProductSpecificationBean> getPsb() {
		return psb;
	}

	public void setPsb(List<ProductSpecificationBean> psb) {
		this.psb = psb;
	}

	public String getPictureurl() {
		return pictureurl;
	}

	public void setPictureurl(String pictureurl) {
		this.pictureurl = pictureurl;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getSellprice() {
		return sellprice;
	}

	public void setSellprice(Integer sellprice) {
		this.sellprice = sellprice;
	}

	public Integer getPurchaseprice() {
		return purchaseprice;
	}

	public void setPurchaseprice(Integer purchaseprice) {
		this.purchaseprice = purchaseprice;
	}

	public Integer getVendorid() {
		return vendorid;
	}

	public void setVendorid(Integer vendorid) {
		this.vendorid = vendorid;
	}

	public Integer getProductcategoryid() {
		return productcategoryid;
	}

	public void setProductcategoryid(Integer productcategoryid) {
		this.productcategoryid = productcategoryid;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getProducttext() {
		return producttext;
	}

	public void setProducttext(String producttext) {
		this.producttext = producttext;
	}

	public String getSpecification() {
		return specification;
	}

	public void setSpecification(String specification) {
		this.specification = specification;
	}

	public String getProductstatus() {
		return productstatus;
	}

	public void setProductstatus(String productstatus) {
		this.productstatus = productstatus;
	}

	public List<ProductPictureBean> getProductpicturebeans() {
		return productpicturebeans;
	}

	public void setProductpicturebeans(List<ProductPictureBean> productpicturebeans) {
		this.productpicturebeans = productpicturebeans;
	}

	@Override
	public String toString() {
		return "ProductBean [id=" + id + ", model=" + model + ", name=" + name + ", type=" + type + "]";
	}

}
