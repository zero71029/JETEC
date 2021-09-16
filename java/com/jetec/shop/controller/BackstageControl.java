package com.jetec.shop.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.jetec.shop.Tools.ZeroTools;
import com.jetec.shop.model.AdminBean;
import com.jetec.shop.model.MessageBean;
import com.jetec.shop.model.OrderBean;
import com.jetec.shop.model.OrderDetail;
import com.jetec.shop.model.PdfUrlBean;
import com.jetec.shop.model.ProductBean;
import com.jetec.shop.model.ProductOptionBean;
import com.jetec.shop.model.ProductTypeBean;
import com.jetec.shop.model.UserBean;
import com.jetec.shop.repository.MessageRepository;
import com.jetec.shop.repository.OrderDetailRepository;
import com.jetec.shop.repository.OrderRepository;
import com.jetec.shop.repository.ProductOptionRepository;
import com.jetec.shop.repository.ProductRepository;
import com.jetec.shop.repository.ProductSpecificationRepository;
import com.jetec.shop.repository.ProductTypeRepository;
import com.jetec.shop.repository.UserRepository;
import com.jetec.shop.repository.service.BackstageService;

@Controller
@RequestMapping("/backstage")
public class BackstageControl {
	@Autowired
	OrderRepository orderRepository;
	@Autowired
	OrderDetailRepository orderDetailRepository;
	@Autowired
	ProductRepository productRepository;
	@Autowired
	BackstageService backstageService;
	@Autowired
	ProductSpecificationRepository psr;
	@Autowired
	UserRepository userRepository;
	@Autowired
	ProductTypeRepository ptr;
	@Autowired
	MessageRepository messageRepository;
	@Autowired
	ProductOptionRepository por;
	@Autowired
	ZeroTools zTools;

//////////////////////////////////////////////////////////////////////////////////////////////////////////
	// 訂單查詢
	@RequestMapping("/selectOrder")
	public String selectOrder(Model model, @RequestParam("state") String state) {
		System.out.println("*****查詢訂單*****" + state);
		model.addAttribute("orderList", orderRepository.findByOrderstatus(state));
		return "/backstage/order";
	}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// 訂單細節
	@RequestMapping("/orderDetail/{id}")
	@ResponseBody
	public List<Map<String, String>> orderDetail(@PathVariable("id") Integer orderid) {
		System.out.println("*****搜索訂單細節 *****");
		Optional<OrderBean> optional = orderRepository.findById(orderid);
		OrderBean orderBean = optional.get();
		List<OrderDetail> list = orderBean.getOrderDetail();

//        List<OrderDetail> list = orderDetailRepository.findByOrderid(orderid);
		List<Map<String, String>> result = new ArrayList<>();
		for (OrderDetail odb : list) {
			Map<String, String> map = new HashMap<>();
			map.put("orderId", odb.getOrderid() + "");
			ProductOptionBean productOptionBean = por.getById(odb.getProductid());
			Optional<ProductBean> op = productRepository.findById(productOptionBean.getProductid());
			ProductBean b = op.get();
			map.put("product_type", productOptionBean.getProduct_type());
			map.put("product_group", productOptionBean.getProduct_group());
			map.put("product_option", productOptionBean.getProduct_option());
			map.put("product_group2", productOptionBean.getProduct_group2());
			map.put("product_option2", productOptionBean.getProduct_option2());
			map.put("product_group3", productOptionBean.getProduct_group3());
			map.put("product_option3", productOptionBean.getProduct_option3());

			map.put("productname", b.getName());
			map.put("SellingPrice", productOptionBean.getProduct_price() + "");
			map.put("Unit", odb.getQuantity() + "");
			result.add(map);
		}
		System.out.println(result);
		return result;
	}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//修改訂單狀態
	@RequestMapping("/state/{orderId}")
	public String state(@PathVariable("orderId") Integer orderId, @RequestParam("orderStatus") String orderStatus) {
		Optional<OrderBean> op = orderRepository.findById(orderId);
		OrderBean bean = op.get();
		bean.setOrderstatus(orderStatus);
		orderRepository.save(bean);
		if (orderStatus.equals("4"))
			orderStatus = "3";
		return "redirect:/backstage/selectOrder?pag=1&state=" + orderStatus;
	}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//讀取商品資訊 和分頁
	@RequestMapping("/product")
	public String productList(Model model, @RequestParam("pag") Integer p, @RequestParam("state") String state) {
		System.out.println("*****讀取商品資訊 *****");
//		Page<ProductBean> page = productRepository.findByProductstatus(state, PageRequest.of(p - 1, 20));
//		List<ProductBean> result = page.getContent();
		List<ProductBean> result = productRepository.findAll();
		model.addAttribute("productList", result);
		return "/backstage/productList";
	}

// 讀取商品詳細
	@RequestMapping("/product/{productId}")
	public String product(Model model, @PathVariable("productId") Integer productId) {
		System.out.println("*****讀取商品詳細 *****" + productId);
		// 讀取類別
		List<String> love1 = ptr.findLove1();
		List<ProductTypeBean> love2 = ptr.findAll();
		model.addAttribute("love1", love1);
		model.addAttribute("love2", love2);

		ProductBean productBean = backstageService.getProduct(productId);
		// 讀取規格
		try {
			System.out.println(productBean.getProductOptionBean());
			model.addAttribute("group", productBean.getProductOptionBean().get(0).getProduct_group());
			model.addAttribute("group2", productBean.getProductOptionBean().get(0).getProduct_group2());
			model.addAttribute("group3", productBean.getProductOptionBean().get(0).getProduct_group3());

		} catch (Exception e) {
			// TODO: handle exception
		}

//		Optional<ProductBean> optional = productRepository.findById(productId);
//		ProductBean productBean = optional.get();		
		model.addAttribute("product", productBean);
		return "/backstage/product";
	}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//上傳商品資料
	@RequestMapping("/updataProduct/{productId}")
	public String updataProduct(Model model, @PathVariable("productId") Integer productId, ProductBean productBean) {
		System.out.println("*****上傳商品資料 *****");
		System.out.println(productBean);
		// 使有輸入的資料能返回
		model.addAttribute("product", productBean);
		// 接收資料
		// 轉換資料
		Map<String, String> errors = new HashMap<>();
		model.addAttribute("errors", errors);

		// 判斷欄位輸入
		if (productBean.getName() == null || productBean.getName().length() == 0) {
			errors.put("name", "沒有名稱");
		}
		if (productBean.getType() == null) {
			errors.put("type", "沒有類別");
		}
		if (productBean.getModel() == null || productBean.getModel().length() == 0) {
			errors.put("model", "沒有貨號");
		}
		if (productBean.getQuantity() == null) {
			errors.put("quantity", "沒有庫存");
		}
		if (productBean.getSellprice() == null) {
			errors.put("sellprice", "沒有售價");
		}
		if (productBean.getPurchaseprice() == null) {
			errors.put("purchaseprice", "沒有進價");
		}
		if (productBean.getProducttext() == null || productBean.getProducttext().length() == 0) {
			errors.put("producttext", "沒有描述");
		}
		if (productId == 0)
			if (productRepository.existsByModel(productBean.getModel()) && productId == 0)
				errors.put("model2", "貨號重複");

		// 如果有錯 回原本頁面
		if (errors != null && !errors.isEmpty()) {
			System.out.println("errors");
			// 讀取類別
			List<String> love1 = ptr.findLove1();
			List<ProductTypeBean> love2 = ptr.findAll();
			model.addAttribute("love1", love1);
			model.addAttribute("love2", love2);
			return "/backstage/product";
		}
		productBean.setVendorid(1);
		productBean.setProductcategoryid(1);
		ProductBean saveBean = null;
		// 判斷新資料還是修改資料
		if (productId == 0) {
			productBean.setCount(0);
			productBean.setProductstatus("1");
			saveBean = backstageService.saveProduct(productBean);
			ProductOptionBean pob = new ProductOptionBean();
			pob.setProductid(saveBean.getId());
			pob.setProduct_group("1");
			pob.setPurchase_price(saveBean.getPurchaseprice());
			pob.setProduct_price(saveBean.getSellprice());
			pob.setProduct_quantity(saveBean.getQuantity());
			backstageService.savegroup(pob);
			System.out.println("saveBean =" + saveBean);

		} else {
			productBean.setProductOptionBean(productRepository.getById(productId).getProductOptionBean());
			productBean.setId(productId);
			productBean.setPictureurl(productRepository.getById(productId).getPictureurl());
			productBean.setCount(productRepository.getById(productId).getCount());
			saveBean = backstageService.saveProduct(productBean);
			productRepository.delNull();
			System.out.println(saveBean);
		}
		productRepository.delNull2();
		return "redirect:/backstage/product/" + saveBean.getId();
	}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//上傳圖片
	@RequestMapping("/addPic/{Productid}")
	@ResponseBody
	public String pic(MultipartHttpServletRequest multipartRequest, @PathVariable("Productid") Integer Productid,
			Model model) {
		System.out.println("*****上傳圖片 *****");
		Map<String, MultipartFile> fileMap = multipartRequest.getFileMap();
		System.out.println(fileMap);
		Optional<ProductBean> op = productRepository.findById(Productid);
		ProductBean bean = op.get();
		String Productmodel = bean.getModel();
		// 圖片儲存
		try {
			for (int i = 0; i <= fileMap.size(); i++) {
				// 2. 儲存圖片到資料夾
				if (fileMap.get("file" + i) != null) {
					System.out.println(fileMap.get("file" + i).getOriginalFilename());
					// 改名+存檔
					String lastname = fileMap.get("file" + i).getOriginalFilename()
							.substring(fileMap.get("file" + i).getOriginalFilename().indexOf("."));
					System.out.println(lastname);
					fileMap.get("file" + i).transferTo(new File(
							"E:\\shop\\src\\main\\resources\\static\\images\\product\\" + Productmodel + lastname));
//                    fileMap.get("file" + i).transferTo(new File("classpath:/resources/static\\images\\product\\" + Productmodel + ".jpg"));
					// 3. 儲存檔案名稱到資料庫
					bean.setPictureurl(Productmodel + lastname);
					productRepository.save(bean);

//                    ProductPictureBean pBean = productPictureJpaReposit.findProducturl(Productmodel + "-" + i);
//                    if (pBean == null) {
//                        pBean = new ProductPictureBean();
//                    }
//                    pBean.setProducturl(Productmodel + "-" + i);
//                    pBean.setProductid(Productid);
//                    productPictureJpaReposit.save(pBean);
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

		return "ok";

	}

//////////////////////////////////////////////////////////////////////////////////////////////////////////
// 商品查詢
	@RequestMapping("/selectProduct/{product}")
	public String selectProduct(Model model, @PathVariable("product") String product) {
		System.out.println("*****查詢商品*****" + product);
		ProductBean productBean = null;
		List<ProductBean> list = new ArrayList<ProductBean>();
		// 判斷數字
		try {
			System.out.println(Integer.parseInt(product));
		} catch (Exception e) {
			// 不是數字 搜索貨號
			list = productRepository.findByModelLikeIgnoreCase("%" + product + "%");
			// 搜不到貨號 用名稱
			if (list.isEmpty())
				list = productRepository.findByNameLikeIgnoreCase("%" + product + "%");
			model.addAttribute("productList", list);
			return "/backstage/productList";
		}
		// 搜索貨號
		list = productRepository.findByModelLikeIgnoreCase("%" + product + "%");
		// 搜不到貨號 用ID搜索
		if (list.isEmpty()) {
			productBean = backstageService.getProduct(Integer.parseInt(product));
			list.add(productBean);
		}
		model.addAttribute("productList", list);
		return "/backstage/productList";
	}

//////////////////////////////////////////////////////////////////////////////////////////////////////////
//會員列表
	@RequestMapping("/userList/{AAA}")
	public String userList(Model model, @PathVariable("AAA") String product) {
		System.out.println("*****會員列表*****" + product);
		model.addAttribute("userList", userRepository.findAll());
		return "/backstage/userList";
	}

//////////////////////////////////////////////////////////////////////////////////////////////////////////
//會員查詢
	@RequestMapping("/selectUser/{userId}")
	public String selectUser(Model model, @PathVariable("userId") Integer userId) {
		System.out.println("*****會員查詢*****");
		List<UserBean> userList = new ArrayList<UserBean>();
		if (userRepository.existsById(userId)) {
			userList.add(userRepository.getById(userId));
			model.addAttribute("userList", userList);
		}
		System.out.println(userList);
		return "/backstage/userList";
	}

//////////////////////////////////////////////////////////////////////////////////////////////////////////
//定單查詢
	@RequestMapping("/selectOrder/{userId}")
	public String selectOrder(Model model, @PathVariable("userId") Integer userId) {
		System.out.println("*****定單查詢by會員*****");
		model.addAttribute("orderList", orderRepository.findByUserid(userId));
		return "/backstage/order";
	}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////55
//請求分類
	@RequestMapping("/addType")
	public String addType(Model model) {
		System.out.println("*****請求分類*****");
		List<String> love1 = ptr.findLove1();
		List<ProductTypeBean> love2 = ptr.findAll();
		model.addAttribute("love1", love1);
		model.addAttribute("love2", love2);
		return "/backstage/addType";
	}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////55
//新增子類
	@RequestMapping("/saveLove2/{l1}")
	public String saveLove2(Model model, @RequestParam("love2") String l2, @PathVariable("l1") String l1) {
		System.out.println("*****新增子類*****");
		if (l2 == null || l2.length() == 0) {
			model.addAttribute("mess", "沒有輸入,新增失敗");
			return "/backstage/addType";
		}
		backstageService.saveType(l1, l2);
		return "redirect:/backstage/addType";
	}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////55
//新增主類
	@RequestMapping("/saveLove1")
	public String saveLove1(Model model, @RequestParam("love1") String l1) {
		System.out.println("*****新增主類*****");

		if (l1 == null || l1.length() == 0) {
			model.addAttribute("mess", "沒有輸入,新增失敗");
			return "/backstage/addType";
		}
		backstageService.saveType(l1, null);
		return "redirect:/backstage/addType";
	}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////55
//刪除子類
	@RequestMapping("/delLove2/{typeid}")
	public String delLove2(Model model, @PathVariable("typeid") Integer typeid) {
		System.out.println("*****刪除子類*****");
		if (productRepository.existsByType(typeid)) {
			model.addAttribute("mess", "類別有商品,不能刪除");
			return "/backstage/addType";
		}
		backstageService.delType(typeid);
		List<String> love1 = ptr.findLove1();
		List<ProductTypeBean> love2 = ptr.findAll();
		model.addAttribute("love1", love1);
		model.addAttribute("love2", love2);
		model.addAttribute("mess", "刪除成功");
		return "/backstage/addType";
	}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////55
//讀取留言
	@RequestMapping("/messList")
	public String messList(Model model, @RequestParam("state") String state) {
		System.out.println("*****讀取留言*****");
		List<MessageBean> messageBeans = messageRepository.findByState(state);
		model.addAttribute("mess", messageBeans);
		return "/backstage/messList";
	}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////55
//讀取留言細節
	@RequestMapping("/mess/{messid}")
	public String mess(Model model, @PathVariable("messid") Integer messid) {
		System.out.println("*****讀取留言細節*****");
		MessageBean messageBeans = messageRepository.getById(messid);
		model.addAttribute("mess", messageBeans);
		return "/backstage/mess";
	}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////55
//回覆留言
	@RequestMapping("/reply")
	public String reply(Model model, @RequestParam("reply") String reply, @RequestParam("id") Integer id) {
		System.out.println("*****回覆留言*****");
		MessageBean messageBean = messageRepository.getById(id);
		messageBean.setReply(reply);
		messageBean.setState("2");
		messageRepository.save(messageBean);
		model.addAttribute("mess", messageBean);
		model.addAttribute("susses", "回覆成功");

		String Subject = "留言回覆";// 主題
		String text = reply;// 內容
		zTools.mail(messageBean.getEmail(), text, Subject);

		return "/backstage/mess";
	}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////55
//新增規格
	@RequestMapping("/addGroup")
	public String addGroup(Model model, ProductOptionBean pob) {
		System.out.println("*****新增規格*****");
		if (pob.getProduct_group() == null || pob.getProduct_group().length() == 0) {
			model.addAttribute("mess", "沒有輸入,新增失敗");
			return "/backstage/addType";
		}
		if (pob.getProduct_option() != null) {
			backstageService.delOptionNull();
		}
		backstageService.savegroup(pob);
		return "redirect:/backstage/product/" + pob.getProductid();
	}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////55
//刪除規格
	@RequestMapping("/delgroup/{group}/{productid}")
	public String delgroup(Model model, @PathVariable("group") String group,
			@PathVariable("productid") String productid) {
		System.out.println("*****刪除規格*****");
		backstageService.delGroup(group);
		return "redirect:/backstage/product/" + productid;
	}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////55
//新增子項
	@RequestMapping("/saveOption/{productId}")
	@ResponseBody
	public String saveOption(ProductOptionBean pob, @PathVariable("productId") Integer productId) {
		System.out.println("*****新增子項*****");
		System.out.println(pob);
		if (pob.getProduct_group3().isEmpty() && !pob.getProduct_option3().isEmpty()) {
			return "須先輸入類別名稱3";
		}
		if (pob.getProduct_group2().isEmpty() && !pob.getProduct_option2().isEmpty()) {
			return "須先輸入類別名稱2";
		}
		if (pob.getProduct_group().isEmpty() && !pob.getProduct_option().isEmpty()) {
			return "須先輸入類別名稱1";
		}

		if (pob.getPurchase_price() == null || pob.getProduct_price() == null || pob.getProduct_quantity() == null) {
			return "進價	價格	庫存 不能空白";
		}
		if (!pob.getProduct_option3().isEmpty() && pob.getProduct_option2().isEmpty()
				&& pob.getProduct_option().isEmpty()) {
			return "前2項不能為空";
		}
		if (!pob.getProduct_option2().isEmpty() && pob.getProduct_option().isEmpty()) {
			return "前1項不能為空";
		}
		pob.setProduct_model(pob.getProduct_option() + "-" + pob.getProduct_option2() + "-" + pob.getProduct_option3());
		pob.setProductid(productId);
		System.out.println(pob);
		backstageService.savegroup(pob);
		return "save ok";
	}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////55
//新增類別
	@RequestMapping("/saveGroup/{productId}")
	@ResponseBody
	public String saveGroup(ProductOptionBean pob, @PathVariable("productId") Integer productId) {
		System.out.println("*****新增類別*****");
		System.out.println(pob);
		System.out.println(por.existsByProductid(productId));
		if (por.existsByProductid(productId)) {
			if (!pob.getProduct_group().isEmpty()) {
				por.saveGroup1(pob.getProduct_group(), productId);
			}
			if (!pob.getProduct_group2().isEmpty()) {
				por.saveGroup2(pob.getProduct_group2(), productId);
			}
			if (!pob.getProduct_group3().isEmpty()) {
				por.saveGroup3(pob.getProduct_group3(), productId);
			}
			return "修改成功";
		} else {
			pob.setProductid(productId);
			backstageService.savegroup(pob);
			return "save ok";
		}

//		backstageService.savegroup(pob);
//		return "失敗";
	}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//上傳型錄
	@RequestMapping("/upFile/{Productid}")
	@ResponseBody
	public String upFile(MultipartHttpServletRequest multipartRequest, @PathVariable("Productid") Integer Productid,
			Model model) {
		System.out.println("*****上傳型錄*****");
		Map<String, MultipartFile> fileMap = multipartRequest.getFileMap();
		System.out.println("fileMap " + fileMap);
		Optional<ProductBean> op = productRepository.findById(Productid);
		ProductBean bean = op.get();
		String Productmodel = bean.getModel();
// 圖片儲存
		try {
			for (int i = 0; i <= fileMap.size(); i++) {
// 2. 儲存圖片到資料夾
				if (fileMap.get("file" + i) != null) {
					System.out.println(fileMap.get("file" + i).getOriginalFilename());
// 改名+存檔
					String lastname = fileMap.get("file" + i).getOriginalFilename()
							.substring(fileMap.get("file" + i).getOriginalFilename().indexOf("."));
					System.out.println(lastname);
					fileMap.get("file" + i).transferTo(new File("E:\\shop\\src\\main\\resources\\static\\PDF\\"
							+ fileMap.get("file" + i).getOriginalFilename()));
//fileMap.get("file" + i).transferTo(new File("classpath:/resources/static\\images\\product\\" + Productmodel + ".jpg"));
// 3. 儲存檔案名稱到資料庫
					PdfUrlBean pdfUrlBean = new PdfUrlBean();
					pdfUrlBean.setProductid(Productid);
					pdfUrlBean.setUrl(fileMap.get("file" + i).getOriginalFilename());
					backstageService.saveUrl(pdfUrlBean);

//ProductPictureBean pBean = productPictureJpaReposit.findProducturl(Productmodel + "-" + i);
//if (pBean == null) {
//pBean = new ProductPictureBean();
//}
//pBean.setProducturl(Productmodel + "-" + i);
//pBean.setProductid(Productid);
//productPictureJpaReposit.save(pBean);
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

		return "ok";

	}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////55
//刪除pdf
	@RequestMapping("removePDF/{url}/{productid}")
	public String removePDF(@PathVariable("url") String url, @PathVariable("productid") Integer productid) {
		System.out.println("*****刪除pdf*****");
		backstageService.delPDF(url, productid);
		return "redirect:/backstage/product/" + productid;
	}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////55
//員工列表
	@RequestMapping("admin")
	public String admin(Model model) {
		System.out.println("*****員工列表*****");
		model.addAttribute("admin", backstageService.findAdmin());
		return "/backstage/admin";
	}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////55
//員工細節
	@RequestMapping("admin/{id}")
	public String admindetail(Model model, @PathVariable("id") Integer id) {
		System.out.println("*****員工細節*****");
		if (id == 0) {

		} else {
			model.addAttribute("admin", backstageService.findAdminDetail(id));
		}
		return "/backstage/adminDetail";
	}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////55
//修改儲存員工
	@RequestMapping("saveAdmin")
	public String saveAdmin(Model model, AdminBean adminBean) {
		System.out.println("*****修改/儲存細節*****");
		adminBean = backstageService.saveAdmin(adminBean);
		model.addAttribute("admin", adminBean);
		return "redirect:/backstage/admin/" + adminBean.getId();
	}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////55
//刪除Option
	@RequestMapping("removeOption/{Optionid}/{productid}")
	public String removeOption(@PathVariable("Optionid") Integer Optionid,
			@PathVariable("productid") Integer productid) {
		System.out.println("*****刪除Option*****");
		backstageService.delOption(Optionid);
		return "redirect:/backstage/product/" + productid;
	}

//////////////////////////////////////////////////////////////////////////////////////////////////////////
//搜索訂單
	@RequestMapping("/findOrder/{orderId}")
	public String findOrder(Model model, @PathVariable("orderId") Integer orderId) {
		System.out.println("*****搜索訂單*****" );
		List<OrderBean> list = new ArrayList<OrderBean>();		
		list.add(orderRepository.getById(orderId));
		model.addAttribute("orderList", list);
		return "/backstage/order";
	}
}
