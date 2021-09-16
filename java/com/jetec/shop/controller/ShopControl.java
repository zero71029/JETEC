package com.jetec.shop.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jetec.shop.Tools.ZeroTools;
import com.jetec.shop.model.CartBean;
import com.jetec.shop.model.EmailBean;
import com.jetec.shop.model.MessageInBean;
import com.jetec.shop.model.OrderBean;
import com.jetec.shop.model.ProductBean;
import com.jetec.shop.model.ProductOptionBean;
import com.jetec.shop.model.ProductTypeBean;
import com.jetec.shop.model.UserBean;
import com.jetec.shop.repository.OrderRepository;
import com.jetec.shop.repository.ProductOptionRepository;
import com.jetec.shop.repository.ProductRepository;
import com.jetec.shop.repository.ProductTypeRepository;
import com.jetec.shop.repository.UserRepository;
import com.jetec.shop.repository.service.BackstageService;
import com.jetec.shop.repository.service.OrderService;

@Controller
public class ShopControl {

	@Autowired
	private ZeroTools zTools;
	@Autowired
	ProductRepository productRepository;
	@Autowired
	OrderService orderService;
	@Autowired
	BackstageService backstageService;

	@Autowired
	OrderRepository orderRepository;
	@Autowired
	ProductTypeRepository ptr;
	@Autowired
	UserRepository UserRepository;
	@Autowired
	ProductOptionRepository por;

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//讀取商品分類
	@RequestMapping("/shopSort")
	public String shopSort(Model model, @RequestParam("ptype") Integer ptype, @RequestParam("pag") Integer pag) {
		System.out.println("**************商品分類********************");
		if (pag < 1)pag = 1;
		pag--;
		Page<ProductBean> page = productRepository.findByProductstatusAndType("1", ptype, PageRequest.of(pag, 12));
//		page.getSize();每頁條數
//		page.getNumber();當前頁
//		page.getNumberOfElements();本頁條數
//		page.getTotalElements();全部幾筆
//		page.getTotalPages();全部有幾頁		
		List<ProductBean> result = page.getContent();
		model.addAttribute("maxPage", result);
		model.addAttribute("TotalPages", page.getTotalPages());
		return "/shop/shopSort";
	}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//讀取商品詳細
	@RequestMapping("/product/{model}")
	public String product(@PathVariable("model") String productModel, Model model) {
		System.out.println("**************商品詳細********************");
		// 讀取類別
		List<String> love1 = ptr.findLove1();
		List<ProductTypeBean> love2 = ptr.findAll();
		model.addAttribute("love1", love1);
		model.addAttribute("love2", love2);
		// 根據貨號讀取商品
		ProductBean productBean = productRepository.findByModel(productModel);

		// 讀取規格
		try {
//			System.out.println(productBean.getProductOptionBean());
			model.addAttribute("group", productBean.getProductOptionBean().get(0).getProduct_group());
			model.addAttribute("group2", productBean.getProductOptionBean().get(0).getProduct_group2());
			model.addAttribute("group3", productBean.getProductOptionBean().get(0).getProduct_group3());
			Set<String> optionSet = new HashSet<String>();
			Set<String> optionSet2 = new HashSet<String>();
			Set<String> optionSet3 = new HashSet<String>();
			for (ProductOptionBean productOptionBean : productBean.getProductOptionBean()) {
				optionSet.add(productOptionBean.getProduct_option());
				optionSet2.add(productOptionBean.getProduct_option2());
				optionSet3.add(productOptionBean.getProduct_option3());
			}
			model.addAttribute("option", optionSet);
			model.addAttribute("option2", optionSet2);
			model.addAttribute("option3", optionSet3);

		} catch (Exception e) {
			// TODO: handle exception
		}

		// 點擊數+1
		productBean.setCount(productBean.getCount() + 1);
		backstageService.saveProduct(productBean);
		model.addAttribute("product", productBean);

		return "/shop/product";
	}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// 加入購物車
	@SuppressWarnings("finally")
	@RequestMapping("/cart/{optionId}")
	public String addProduct(@PathVariable("optionId") Integer optionId, @RequestParam("num") Integer num,
			HttpSession session) {
		System.out.println("*****加入購物車*****商品id:" + optionId);

		ProductOptionBean productOptionBean = por.getById(optionId);

		//
//		Optional<ProductBean> op = productRepository.findById(id);
//		ProductBean bean = op.get();
		Map<String, Integer> cart = new HashMap<>();
		// 取資料
		Map<String, Integer> icart = (Map<String, Integer>) session.getAttribute("cart");
		if (icart != null)
			cart = icart;
		Integer SSS = null;// 紀錄的數量

		try {
			// 判斷有沒有當筆資料
			SSS = (Integer) icart.get(Integer.toString(optionId));
//            System.out.println("SSS" + SSS);
			num = SSS + num;
		} catch (Exception e) {
//			沒資料 把數量加入
			System.out.println(e);
		} finally {
			//取得商品庫存
			int  quantity =   por.getById(optionId).getProduct_quantity();
			//判斷有無大於庫存
			if(num >= quantity ) {
				num =quantity;
			}
			if(num == 0) {
				return "redirect:/product/" + productRepository.getById(productOptionBean.getProductid()).getModel();
			}
			
			
			cart.put(Integer.toString(optionId), num);
			session.setAttribute("cart", cart);
			session.setAttribute("cartNum", cartNum(cart));
			return "redirect:/product/" + productRepository.getById(productOptionBean.getProductid()).getModel();
		}
	}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// 讀取購物車(進購物車頁面)
	@RequestMapping("/shopCart")
	public String shopCart(HttpSession session, Model model) {
		// 檢查狀態
		// ..............
		// 讀取購物車 轉換成商品資料輸出
		Map<String, Integer> cart = (Map<String, Integer>) session.getAttribute("cart");
		System.out.println("cart = " + cart);
		// 檢查購物車是否為null
		if (cart == null) {
			return "redirect:/shopSort?ptype=1";
		}
		if (cart.isEmpty() || cart.size() == 0)
			return "redirect:/shopSort?ptype=1";

		// 呼叫catChange(cart) 做資料轉換
		model.addAttribute("productList", catChange(cart));
		return "/shop/shopCart";
	}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// 讀取購物車
	@RequestMapping("/catData")
	@ResponseBody
	public ArrayList<CartBean> catData(HttpSession session) {
		System.out.println("*****讀取購物車*****");
		Map<String, Integer> cart = (Map<String, Integer>) session.getAttribute("cart");
		// 檢查購物車是否為null
		if (cart == null) {
			return null;
		}
		// 呼叫catChange(cart) 做資料轉換
		return catChange(cart);
	}

//*********************************************************************************************************
//購物車資料轉換
	public ArrayList<CartBean> catChange(Map<String, Integer> cart) {
		ArrayList<CartBean> cartList = new ArrayList<CartBean>();
		Set keyset = cart.keySet();
		for (Object id : keyset) {
			CartBean cartBean = new CartBean();
			cartBean.setNum(cart.get(id));
			ProductOptionBean productOptionBean = por.getById(Integer.parseInt((String) id));

			Optional<ProductBean> ot = productRepository.findById(productOptionBean.getProductid());
			ProductBean productBean = ot.get();
			cartBean.setId(productOptionBean.getId());
			cartBean.setModel(productBean.getModel());
			cartBean.setName(productBean.getName());
			cartBean.setPictureurl(productBean.getPictureurl());
			cartBean.setSellprice(productOptionBean.getProduct_price());
			cartBean.setSpecification(productBean.getSpecification());
			cartBean.setProduct_group(productOptionBean.getProduct_group());
			cartBean.setProduct_option(productOptionBean.getProduct_option());
			cartBean.setProduct_group2(productOptionBean.getProduct_group2());
			cartBean.setProduct_option2(productOptionBean.getProduct_option2());
			cartBean.setProduct_group3(productOptionBean.getProduct_group3());
			cartBean.setProduct_option3(productOptionBean.getProduct_option3());
			cartBean.setProduct_type(productOptionBean.getProduct_type());
			cartList.add(cartBean);
		}
		return cartList;
	}

//******************************************************************************************************
//購物車數量
	public Integer cartNum(Map<String, Integer> cart) {
		Integer result = 0;
		for (Object key : cart.keySet()) {
			result += cart.get(key);
		}
		return result;
	}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//刪除購物車商品
	@RequestMapping("delCart/{id}")
	public String delCart(@PathVariable("id") String id, HttpSession session) {
		System.out.println("********************Cart刪除物品**********************" + id);
		Map<String, Integer> body = (Map<String, Integer>) session.getAttribute("cart");
		body.remove(id);
		session.setAttribute("cart", body);
		session.setAttribute("cartNum", cartNum(body));
		return "redirect:/shopCart";
	}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//++購物車商品
	@RequestMapping("addCart/{id}")
	@ResponseBody
	public Map<String, Integer> addCart(@PathVariable("id") String id, HttpSession session) {
		System.out.println("********************Cart數量增加**************************" + id);
		Map<String, Integer> body = (Map<String, Integer>) session.getAttribute("cart");
		int AAA = body.get(id);//購物車數量	
		//取得商品庫存
		int  quantity =   por.getById(Integer.parseInt(id)).getProduct_quantity();
		//判斷有無大於庫存
		if(AAA >= quantity ) {
			AAA =quantity;
		}else {
			AAA++;
		}

		body.put(id, AAA);
		session.setAttribute("cart", body);
		session.setAttribute("cartNum", cartNum(body));
		return body;
	}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////55
//---購物車商品
	@RequestMapping("cutCart/{id}")
	@ResponseBody
	public Map<String, Integer> cutCart(@PathVariable("id") String id, HttpSession session) {
		System.out.println("********************Cart數量減少*****************************************" + id);
		Map<String, Integer> body = (Map<String, Integer>) session.getAttribute("cart");
		int AAA = body.get(id);
		AAA--;
		body.put(id, AAA);
		session.setAttribute("cart", body);
		session.setAttribute("cartNum", cartNum(body));
		return body;
	}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////55
//修改購物車數量
	@RequestMapping("changeCart/{id}")
	@ResponseBody
	public Map<String, Integer> changeCart(@PathVariable("id") String id, HttpSession session,
			@RequestBody Integer body) {
		System.out.println("********************修改購物車數量*****************************************" + id);
		Map<String, Integer> cart = (Map<String, Integer>) session.getAttribute("cart");
		//取得商品庫存
		int  quantity =   por.getById(Integer.parseInt(id)).getProduct_quantity();
		//判斷有無大於庫存
		if(body >= quantity ) {
			body =quantity;
		}
		cart.put(id, body);
		session.setAttribute("cart", cart);
		session.setAttribute("cartNum", cartNum(cart));
		return cart;
	}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//去付帳(填寫資料)
	@RequestMapping("/checkout")
	public String checkout(HttpSession session, Model model) {
		System.out.println("*****填寫資料*****");

		UserBean userBean = (UserBean) session.getAttribute("user");
		OrderBean bean = new OrderBean();
		// 讀取會員資料 自動填寫用 須修改資料庫設定才能使用
//		if (userBean != null) {
//			System.out.println("userBean"+userBean);
//			List<OrderBean> orderList = orderRepository.selectAddress(userBean.getUserid());
//			model.addAttribute("orderList", orderList);
//			System.out.println("*****orderList*****"+orderList);
//		}

		Map<String, Integer> cart = (Map<String, Integer>) session.getAttribute("cart");
		int total = 0;
		System.out.println(cart);
		for (Object key : cart.keySet()) {
			Integer price = por.getById(Integer.parseInt((String) key)).getProduct_price();
			total += price * cart.get(key);
		}
		model.addAttribute("total", total);

		System.out.println("*****total*****" + total);

		// 呼叫catChange(cart) 做資料轉換
		model.addAttribute("productList", catChange(cart));
		return "/shop/Checkout";
	}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//去付帳(Paypal)
	@RequestMapping("/Payment")
	public String Payment(HttpSession session, Model model, OrderBean bean) {
		System.out.println("*****付帳*****");

		// 使有輸入的資料能返回
		List<OrderBean> orderList = new ArrayList<OrderBean>();
		orderList.add(bean);
		model.addAttribute("orderList", orderList);
		// 購物車資料
		Map<String, Integer> cart = (Map<String, Integer>) session.getAttribute("cart");
		// 呼叫catChange(cart) 做資料轉換
		model.addAttribute("productList", catChange(cart));

		// 接收資料
		// 轉換資料
		Map<String, String> errors = new HashMap<>();
		model.addAttribute("errors", errors);

		// 判斷欄位輸入
		if (bean.getPhone() == null || bean.getPhone().length() == 0) {
			errors.put("phone", "need phone");
		}
		if (bean.getEmail() == null || bean.getEmail().length() == 0) {
			errors.put("email", "need Email");
		}
		if (bean.getFirstname() == null || bean.getFirstname().length() == 0) {
			errors.put("firstname", "need Firstname");
		}
		if (bean.getLastname() == null || bean.getLastname().length() == 0) {
			errors.put("lastname", "need Lastname");
		}
		if (bean.getAddress() == null || bean.getAddress().length() == 0) {
			errors.put("address", "need Address");
		}
		if (bean.getCountry() == null || bean.getCountry().length() == 0) {
			errors.put("country", "need Country");
		}
		if (bean.getOrder_name() == null || bean.getOrder_name().length() == 0) {
			errors.put("order_name", "need name");
		}
		if (bean.getOrder_address() == null || bean.getOrder_address().length() == 0) {
			errors.put("order_address", "need address");
		}
		if (bean.getOrder_postalcode() == null || bean.getOrder_postalcode().length() == 0) {
			errors.put("order_postalcode", "need postalcode");
		}
		if (bean.getOrder_phone() == null || bean.getOrder_phone().length() == 0) {
			errors.put("order_phone", "need phone");
		}

		UserBean userBean = UserRepository.findByEmail(bean.getEmail());
		if (userBean != null)
			bean.setUserid(userBean.getUserid());
		//算總價
		int total = 0;
		for (Object key : cart.keySet()) {
			Integer price = por.getById(Integer.parseInt((String) key)).getProduct_price();
			total += price * cart.get(key);
		}		
		model.addAttribute("total", total);
		// 如果有錯 回原本頁面
		if (errors != null && !errors.isEmpty()) {
			System.out.println("errors");
			return "/shop/Checkout";
		}
		session.setAttribute("order", bean);
		return "/shop/Payment";
	}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//回付帳(修改資料)
	@RequestMapping("/change")
	public String change(HttpSession session, Model model) {
		System.out.println("*****回付帳(修改資料)*****");
//		UserBean userBean = (UserBean) session.getAttribute("user");
		// 使有輸入的資料能返回
		OrderBean bean = (OrderBean) session.getAttribute("order");
		List<OrderBean> orderList = new ArrayList<OrderBean>();
		orderList.add(bean);
		model.addAttribute("orderList", orderList);
		Map<String, Integer> cart = (Map<String, Integer>) session.getAttribute("cart");
		int total = 0;
		for (Object key : cart.keySet()) {
			Integer price =por.getById(Integer.parseInt((String)key)).getProduct_price();     //finPiceById((String) key);
			total += price * cart.get(key);
		}
		model.addAttribute("total", total);

		System.out.println("*****total*****" + total);

// 呼叫catChange(cart) 做資料轉換
		model.addAttribute("productList", catChange(cart));
		return "/shop/Checkout";
	}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////55
//付款成功 存檔
	@RequestMapping("/review")
	public String review(HttpSession session,Model model) {
		System.out.println("**************付款成功 存檔***********************");
		OrderBean orderBean = (OrderBean) session.getAttribute("order");
		UserBean userBean = (UserBean) session.getAttribute("user");
		if (userBean != null) {
			orderBean.setUserid(userBean.getUserid());
		} else {
			orderBean.setUserid(1);
		}
		
		
		
		
		
		orderBean.setOrderstatus("1");
		Map<String, Integer> cart = (Map<String, Integer>) session.getAttribute("cart");
		
		

		OrderBean save = orderService.saveOrder(orderBean, cart);
		// 發送email
		String text = "我們收到了你的訂單,會盡快安排幫您出貨";
		String Subject = "定單通知";
		zTools.mail(orderBean.getEmail(), text, Subject);


		session.removeAttribute("order");
		session.removeAttribute("cart");
		session.setAttribute("cartNum", 0);
		model.addAttribute("id",save.getOrderid());
		return "/shop/review";
	}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////55
//付款成功
//	@RequestMapping("/review")
//	@ResponseBody
//	public Map<String, Integer> review(@PathVariable("id") String id, HttpSession session, @RequestBody Integer body) {
//		System.out.println("********************修改購物車數量*****************************************" + id);
//		Map<String, Integer> cart = (Map<String, Integer>) session.getAttribute("cart");
//		cart.put(id, body);
//		session.setAttribute("cart", cart);
//		session.setAttribute("cartNum", cartNum(cart));
//		return cart;
//	}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////55
//儲存留言
	@RequestMapping("/message")
	public String message(Model model, MessageInBean bean, @RequestParam("g-recaptcha-response") String token) {
		System.out.println("*****留言*****");
		System.out.println(bean);

		boolean recaptcha = zTools.recaptcha(token);// 機器人判斷
		// 使有輸入的資料能返回
		model.addAttribute("email", bean.getEmail());
		model.addAttribute("firstname", bean.getFirstname());
		model.addAttribute("lastname", bean.getLastname());
		model.addAttribute("phone", bean.getPhone());
		model.addAttribute("company", bean.getCompany());
		model.addAttribute("message", bean.getMessage());
		model.addAttribute("product_model", bean.getProduct_model());

		// 接收資料
		// 轉換資料
		Map<String, String> errors = new HashMap<>();
		model.addAttribute("errors", errors);
		// 機器人判斷
		if (!recaptcha) {
			System.out.println("errors.put(recaptcha, 需要驗證)");
			errors.put("recaptcha", "需要驗證");
		}
		// 判斷欄位輸入
//		if (bean.getPhone() == null || bean.getPhone().length() == 0) {			
//				errors.put("phone", "沒有號碼");
//		}
		if (bean.getEmail() == null || bean.getEmail().length() == 0) {
			errors.put("email", "沒有Email");
		}
		if (bean.getFirstname() == null || bean.getFirstname().length() == 0) {
			errors.put("firstname", "沒有Firstname");
		}
		if (bean.getLastname() == null || bean.getLastname().length() == 0) {
			errors.put("lastname", "沒有Lastname");
		}
		// 如果有錯 回原本頁面
		if (errors != null && !errors.isEmpty()) {
			return "/shop/message";
		}

		backstageService.saveMessage(bean);
		// 返回未寫
		return "/shop/receive";
	}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////55
//請求分類
	@RequestMapping("/shop/love1")
	@ResponseBody
	public List<String> love1() {
		System.out.println("*****請求分類*****");
		List<String> love1 = ptr.findLove1();
		return love1;
	}

	@RequestMapping("/shop/love2")
	@ResponseBody
	public List<ProductTypeBean> love2() {
		System.out.println("*****請求分類*****");
		List<ProductTypeBean> love2 = ptr.findAll();
		return love2;
	}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////55
//findOption
	@RequestMapping("/shop/findOption/{productid}")
	@ResponseBody
	public List<ProductOptionBean> findOption(@PathVariable("productid") Integer productid) {
		List<ProductOptionBean> list = productRepository.getById(productid).getProductOptionBean();
//		System.out.println("");
//		System.out.println("list");
//		System.out.println(list);
//		
//		Set<String> keySet  = new HashSet<String>();
//		Set<String> keySet2  = new HashSet<String>();		
//		for(ProductOptionBean ob : list) {			
//			keySet.add(ob.getProduct_option());			
//			keySet2.add(ob.getProduct_option2());		
//		}
//		
//		
//		
//		
//		
//		List<List<String>> optionList = new ArrayList<List<String>>();
//		List<List<String>> option2List = new ArrayList<List<String>>();
//		
//		for(String k :keySet) {
//			List<String> option2=  por.findO2ByK1(k);
//			if(option2 == null) {
//				option2.add(k);
//				optionList.add(option2);
//			}else {
//				optionList.add(option2);
//			}
//		}
//		
//		System.out.println("optionList   .."+optionList);
//		
//		
//		
//		
//		
//		
//		
//		
//		
//		for(String k2 :keySet2) {
//			List<String> option3List =  por.findO3ByK2(k2);
//			if(option3List == null) {
//				option3List.add(k2);
//				option2List.add(option3List);
//			}else {
//				option2List.add(option3List);
//			}
//		}
//		System.out.println("option2List   .."+option2List);
//		
//		
//		
//		
//		List<String> option3 =new ArrayList<String>();
//		
//		
//		
//		
//		

		return list;
	}

//////////////////////////////////////////////////////////////////////////////////////////////////////////
//商品查詢
	@RequestMapping("/searchProduct/{product}")
	public String searchProduct(Model model, @PathVariable("product") String product) {
		System.out.println("*****查詢商品*****" + product);
		List<ProductBean> list = null;
		
//判斷數字
		try {
			System.out.println(Integer.parseInt(product));
		} catch (Exception e) {
//不是數字 搜索貨號
			 list = productRepository.findByModelLikeIgnoreCase("%" + product + "%");
//搜不到貨號 用名稱搜索
			if (list.isEmpty())
				list = productRepository.findByNameLikeIgnoreCase("%" + product + "%");
			model.addAttribute("maxPage", list);
			return "/shop/shopSort";
		}
		 list = productRepository.findByModelLikeIgnoreCase("%" + product + "%");
//搜不到貨號 用ID搜索
		if (list.isEmpty()) {
			ProductBean productBean = backstageService.getProduct(Integer.parseInt(product));
			 list = new ArrayList<ProductBean>();
			if (productBean != null)
				list.add(productBean);
			
		}	
		model.addAttribute("maxPage", list);
		return "/shop/shopSort";
	}

	// 商品查詢 沒輸入東西
	@RequestMapping("/searchProduct")
	public String sP() {
		return "redirect:/shop.jsp";

	}
//////////////////////////////////////////////////////////////////////////////////////////////////////////
//儲存Email
	@RequestMapping("/saveEmail")
	@ResponseBody
	public String saveEmail(EmailBean bean) {
		System.out.println(bean);
		return backstageService.saveEmail(bean);
		
	}

}
