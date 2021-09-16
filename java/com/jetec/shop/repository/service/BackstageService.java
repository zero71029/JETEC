package com.jetec.shop.repository.service;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

import javax.mail.search.IntegerComparisonTerm;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jetec.shop.model.AdminBean;
import com.jetec.shop.model.EmailBean;
import com.jetec.shop.model.MessageBean;
import com.jetec.shop.model.MessageInBean;
import com.jetec.shop.model.PdfUrlBean;
import com.jetec.shop.model.ProductBean;
import com.jetec.shop.model.ProductOptionBean;
import com.jetec.shop.model.ProductTypeBean;
import com.jetec.shop.repository.AdminRepository;
import com.jetec.shop.repository.EmailRepository;
import com.jetec.shop.repository.MessageRepository;
import com.jetec.shop.repository.PdfUrlRepository;
import com.jetec.shop.repository.ProductOptionRepository;
import com.jetec.shop.repository.ProductRepository;
import com.jetec.shop.repository.ProductSpecificationRepository;
import com.jetec.shop.repository.ProductTypeRepository;

@Service
@Transactional
public class BackstageService {
	@Autowired
	ProductRepository productRepository;
	@Autowired
	ProductSpecificationRepository psr;
	@Autowired
	ProductTypeRepository ptr;
	@Autowired
	ProductOptionRepository productOptionRepository;
	@Autowired
	PdfUrlRepository pdfUrlRepository;
	@Autowired
	MessageRepository messageRepository;
	@Autowired
	EmailRepository emailRepository;
	@Autowired
	AdminRepository adminRepository;

	// 新增資料
//	public ProductBean newProduct(ProductBean productBean) {
//
//		ProductBean bean = new ProductBean();
//		bean.setModel(productBean.getModel());
//		bean.setName(productBean.getName());
//		bean.setType(productBean.getType());
//		bean.setProducttext(productBean.getProducttext());
//		bean.setSellprice(productBean.getSellprice());
//		bean.setPurchaseprice(productBean.getPurchaseprice());
//		bean.setVendorid(1);
//		bean.setProductcategoryid(1);
//		bean.setProductstatus("1");
//		bean.setQuantity(productBean.getQuantity());
//		ProductBean save = productRepository.save(bean);
//		productBean.setId(save.getId());
//		productBean.setVendorid(1);
//		productBean.setProductcategoryid(1);
//		productBean.setProductstatus("1");		
//		int i = 0;
//		List<ProductSpecificationBean> aaa = productBean.getPsb();
//		for (ProductSpecificationBean bbb : aaa) {
//			if(bbb.getSptext() == null || bbb.getSptext().length() == 0)continue;
//			System.out.println(bbb);
//			bbb.setId(save.getId());
//			psr.save(bbb);
//			
//		}
//		productBean.setVendorid(1);
//		productBean.setProductcategoryid(1);
//		productBean.setProductstatus("1");
//		return productRepository.save(productBean);
//	}
////////////////////////////////////////////////////////////////////////////////////////////////////////
	// 修改資料
	public ProductBean saveProduct(ProductBean productBean) {
		ProductBean Bean = productRepository.save(productBean);
		psr.delSptextNull();

		return Bean;
	}

///////////////////////////////////////////////////////////////////////////////////////////////////
	// 讀取資料
	public ProductBean getProduct(Integer productId) {
		Optional<ProductBean> optional = productRepository.findById(productId);
		if (optional.isEmpty()) {
			return null;
		} else {
			return optional.get();
		}

	}

///////////////////////////////////////////////////////////////////////////////////////////////////
// 新增分類
	public boolean saveType(String l1, String l2) {
		ProductTypeBean productTypeBean = new ProductTypeBean();
		productTypeBean.setLove1(l1);
		productTypeBean.setLove2(l2);
		ptr.save(productTypeBean);
		return true;
	}

///////////////////////////////////////////////////////////////////////////////////////////////////
//刪除分類
	public boolean delType(Integer typeid) {
		ProductTypeBean productTypeBean = new ProductTypeBean();
		productTypeBean.setType(typeid);
		ptr.delete(productTypeBean);
		return true;
	}

///////////////////////////////////////////////////////////////////////////////////////////////////
//新增規格
	public boolean savegroup(ProductOptionBean pob) {
		productOptionRepository.save(pob);
		return true;
	}

///////////////////////////////////////////////////////////////////////////////////////////////////
//刪除規格
	public boolean delGroup(String group) {
		productOptionRepository.deletegroup(group);
		return true;
	}

///////////////////////////////////////////////////////////////////////////////////////////////////
//刪除規格
	public boolean delOptionNull() {
		productOptionRepository.delNull();
		return true;
	}

///////////////////////////////////////////////////////////////////////////////////////////////////
//新增pdf
	public boolean saveUrl(PdfUrlBean pdfUrlBean) {
		pdfUrlRepository.save(pdfUrlBean);
		return true;
	}

///////////////////////////////////////////////////////////////////////////////////////////////////
//刪除pdf
	public void delPDF(String url, Integer productId) {
		PdfUrlBean pdfUrlBean = pdfUrlRepository.findByUrlAndProductid(url, productId);
		pdfUrlRepository.delete(pdfUrlBean);
	}

///////////////////////////////////////////////////////////////////////////////////////////////////
//儲存留言
	public boolean saveMessage(MessageInBean bean) {
		MessageBean mb = new MessageBean();
		mb.setCompany(bean.getCompany());
		mb.setEmail(bean.getEmail());
		mb.setFirstname(bean.getFirstname());
		mb.setLastname(bean.getLastname());
		mb.setPhone(bean.getPhone());
		mb.setCountry(bean.getCountry());
		mb.setProduct_model(bean.getProduct_model());
		mb.setMessage(bean.getMessage());
		mb.setState("1");

		if (bean.getProductType() != null) {
			if (bean.getProductType().equals("otherQ")) {
				mb.setProductType(bean.getOtherQ());
			} else {
				mb.setProductType(bean.getProductType());
				;
			}

		}

		if (bean.getIndustry() != null) {
			if (bean.getIndustry().equals("orderIndustry")) {
				mb.setIndustry(bean.getOrderIndustry());
			} else {
				mb.setIndustry(bean.getIndustry());
			}
		}

		messageRepository.save(mb);

		return true;
	}

//////////////////////////////////////////////////////////////////////////////////////////////////////////
//儲存Email
	public String saveEmail(EmailBean bean) {
		if (emailRepository.existsByEmail(bean.getEmail())) {
			return "email已經存在";
		} else {
			UUID uuid = UUID.randomUUID();
			bean.setId(uuid.toString());
			emailRepository.save(bean);
		}
		return "save ok 感謝訂閱";

	}

//////////////////////////////////////////////////////////////////////////////////////////////////////////
//員工列表
	public List<AdminBean> findAdmin() {
		return adminRepository.findAll();

	}

//////////////////////////////////////////////////////////////////////////////////////////////////////////
//員工細節
	public AdminBean findAdminDetail(Integer id) {
		return adminRepository.getById(id);
	}

//////////////////////////////////////////////////////////////////////////////////////////////////////////
//員工儲存
	public AdminBean saveAdmin(AdminBean adminBean) {
		return adminRepository.save(adminBean);
	}

///////////////////////////////////////////////////////////////////////////////////////////////////
//刪除pdf
	public void delOption(Integer Optionid) {
		productOptionRepository.deleteById(Optionid);
	}

}
