package com.jetec.shop.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jetec.shop.Tools.BCrypt;
import com.jetec.shop.Tools.ZeroTools;
import com.jetec.shop.model.OrderBean;
import com.jetec.shop.model.OrderDetail;
import com.jetec.shop.model.ProductBean;
import com.jetec.shop.model.ProductOptionBean;
import com.jetec.shop.model.UserBean;
import com.jetec.shop.repository.OrderDetailRepository;
import com.jetec.shop.repository.OrderRepository;
import com.jetec.shop.repository.ProductOptionRepository;
import com.jetec.shop.repository.ProductRepository;
import com.jetec.shop.repository.UserRepository;

@Controller
public class UserControl {
	@Autowired
	private ZeroTools zTools;
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private OrderRepository orderRepository;
	@Autowired
	private ProductRepository productRepository;
	@Autowired
	private OrderDetailRepository orderDetailRepository;
	@Autowired
	private ProductOptionRepository por;

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// 登入檢查
	@RequestMapping("/signup/{action}")
	public String signup(UserBean bean, Model model, Locale locale, @PathVariable("action") String action,
			HttpSession session, @RequestParam("g-recaptcha-response") String token) {
		System.out.println("*****登入/註冊*****");
		System.out.println(bean);		

		boolean recaptcha = zTools.recaptcha(token);// 機器人判斷
		// 使有輸入的資料能返回
		model.addAttribute("email", bean.getEmail());
		model.addAttribute("userfirstname", bean.getFirstname());
		model.addAttribute("userlastname", bean.getLastname());
		model.addAttribute("userpassword", bean.getPassword());
		model.addAttribute("userphone", bean.getPhone());
		model.addAttribute("company", bean.getCompany());
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
		if (bean.getPhone() == null || bean.getPhone().length() == 0) {
			if (action.equals("phoneLogin") || action.equals("signup"))
				errors.put("userpassword", "沒有號碼");
		}
		if (bean.getEmail() == null || bean.getEmail().length() == 0) {
			if (action.equals("login") || action.equals("signup"))
				errors.put("email", "沒有Email");
		}
		if (bean.getFirstname() == null || bean.getFirstname().length() == 0) {
			if (action.equals("signup"))
				errors.put("firstname", "沒有Firstname");
		}
		if (bean.getLastname() == null || bean.getLastname().length() == 0) {
			if (action.equals("signup"))
				errors.put("lastname", "沒有Lastname");
		}
		if (bean.getPassword() == null || bean.getPassword().length() == 0) {
			errors.put("userpassword", "沒有密碼");
		}

		// 如果有錯 回原本頁面
		if (errors != null && !errors.isEmpty()) {
			System.out.println("errors");
			if (action.equals("login")) {
				return action;
			} else if (action.equals("signup")) {
				return action;
			} else {
				return action;
			}

		}
		// 登入 判斷email,密碼是否正確
		if (action != null && action.equals("login")) {
			if (userRepository.existsByemail(bean.getEmail())) {
				UserBean dataBean = userRepository.findByEmail(bean.getEmail());
				if (BCrypt.checkpw(bean.getPassword(), dataBean.getPassword())) {
					System.out.println("***********登入成功**************");
					bean = userRepository.findByEmail(bean.getEmail());
//					session.setAttribute("state", bean.getState());
					session.setAttribute("user", bean);
					session.setMaxInactiveInterval(30 * 60);
					// 如果購物車 沒有東西 回首頁
					Map<String, Integer> icart = (Map<String, Integer>) session.getAttribute("cart");
					if (icart == null)
						return "redirect:/shop.jsp";
					// 如果購物車 有東西 回購物車
					if (icart.isEmpty() || icart.size() == 0)
						return "redirect:/shop.jsp";
					System.out.println(icart);
					return "redirect:/shopCart";

				} else {
					System.out.println("密碼錯誤");
					System.out.println("密碼錯誤");
					errors.put("userpassword", "密碼錯誤");
					return action;
				}

			} else {
				System.out.println("Email錯誤");
				errors.put("email", "Email錯誤");
				return action;
			}

		}
		// 註冊 判斷email是否重複
		if (action != null && action.equals("signup")) {
			if (!userRepository.existsByemail(bean.getEmail())) {//	                
				System.out.println("存資料");
				bean.setState("0");
				bean.setPassword(BCrypt.hashpw(bean.getPassword(), BCrypt.gensalt()));
				UserBean uBean = userRepository.save(bean);
				// 發送註冊信
				String text = "<p><a href='http://192.168.11.114:8080/JETEC/welcome/" + uBean.getUserid()
						+ "'>點擊認證 </a></p>";
//				bean.setEmail("jeter.tony56@gmail.com");
				
				
				String Subject = "註冊成功,";//主題
				zTools.mail(bean.getEmail(), text,Subject);
				bean.setState("0");
				model.addAttribute("email", bean.getEmail());
				return "register";

//	                } else {
//	                    System.out.println("名稱已經存在");
//	                    errors.put("username", "名稱已經存在");
//	                    return "/views/user/" + action;
//	                }
			} else {
				System.out.println("Email重複");
				errors.put("emails", "Email重複");
				return action;
			}
		}
//	        // 判斷電話
		if (action != null && action.equals("phoneLogin")) {
			if (userRepository.existsByPhone(bean.getPhone())) {
				UserBean dataBean = userRepository.findByPhone(bean.getPhone());

				if (!BCrypt.checkpw(bean.getPassword(), dataBean.getPassword())) {
					System.out.println("密碼錯誤");
					errors.put("userpassword", "密碼錯誤");
					return action;
				} else {
					bean = userRepository.findByPhone(bean.getPhone());
					session.setAttribute("state", bean.getState());
					session.setAttribute("user", bean);
					System.out.println("登入成功");
					return "redirect:/shop.jsp";
				}

			} else {
				System.out.println("電話錯誤");
				errors.put("userphone", "電話錯誤");
				return action;
			}

		}
		if (action.equals("cat")) {
			session.setAttribute("id", bean.getUserid());
			return "/views/shop/address";
		}

		// 成功後去向
		if (action.equals("login")) {
			return "/index";
		} else {
			return "/index";
		}
	}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// 忘記密碼
	@RequestMapping("/forget")
	public String forget(UserBean bean, Model model, Locale locale, HttpSession session,
			@RequestParam("g-recaptcha-response") String token) {
		System.out.println("*****忘記密碼******");
		System.out.println(bean);
		Map<String, String> errors = new HashMap<>();
		model.addAttribute("errors", errors);
		model.addAttribute("email", bean.getEmail());
		// 機器人判斷
        if (token == "" || !zTools.recaptcha(token)) {
            System.out.println("errors.put(\"recaptcha\", \"需要驗證\");");
            errors.put("recaptcha", "需要驗證");
        }
		// 郵件格式判斷
		if (bean.getEmail() == null || bean.getEmail().length() == 0) {
			errors.put("email", "Email錯誤");
//			return "/views/forget";
		}
		if (!bean.getEmail().contains("@"))
			errors.put("email", "Email錯誤");

		if (errors != null && !errors.isEmpty())
			return "/forget";

		// 寄發郵件
		String text = "<p><a href='http://192.168.11.114:8080/JETEC/reset/" + bean.getEmail() + "'>從新設定密碼</a></p>";
//		bean.setEmail("jeter.tony56@gmail.com");
		String Subject = "從新設定密碼";//主題
		zTools.mail(bean.getEmail(), text,Subject);
		return "/register";
	}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//重設密碼跳轉
	@RequestMapping("/reset/{email}")
	public String resetJump(@PathVariable("email") String email) {
		System.out.println("*****重設密碼跳轉******");
		return "redirect:/resetPassword.jsp?email=" + email;
	}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//密碼修改
	@RequestMapping("/resetPassword")
	public String resetPassword(UserBean bean) {
		System.out.println("*****密碼修改******" + bean);
		UserBean dataBean = userRepository.findByEmail(bean.getEmail());
		dataBean.setPassword(BCrypt.hashpw(bean.getPassword(), BCrypt.gensalt()));
		UserBean uBean = userRepository.save(dataBean);
		return "redirect:/resetPasswordOK.jsp";
	}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//點擊驗證
	@RequestMapping("/welcome/{userId}")
	public String welcome(@PathVariable("userId") Integer userId) {
		System.out.println("*****welcome******" + userId);
		UserBean bean = userRepository.getById(userId);
		bean.setState("1");
		userRepository.save(bean);
		return "redirect:/emailVerify.jsp";
	}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// 重寄驗證信(未寫)
	@RequestMapping("/reSend/{email}")
	public String reSend(@PathVariable("email") String email) {
		return null;

	}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//登出
	@RequestMapping("/Signout")
	public String Signout(HttpSession session) {
		System.out.println("*****登出******");
		session.invalidate();
		return "redirect:/shop.jsp";
	}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//個人資料
	@RequestMapping("/user/userHome")
	public String userHome(HttpSession session, Model model) {
		System.out.println("*****個人資料******");
		UserBean bean = (UserBean) session.getAttribute("user");

		List<OrderBean> list = orderRepository.findByUseridDESC(bean.getUserid());
		List<Map<String, String>> orderList = new ArrayList<Map<String, String>>();
		Map<String, String> order;
		//定單列表
		for (OrderBean orderBean : list) {
			order = new HashMap<>();
			// 日期
			SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
			order.put("time", sdf.format(orderBean.getCreatedate()));
			// 商品圖片 名稱
			
			
			ProductOptionBean  productOptionBean =por.getById(orderBean.getOrderDetail().get(0).getProductid());
				
			Optional<ProductBean> op = productRepository.findById(productOptionBean.getProductid());
			ProductBean productBean = op.get();
			order.put("name", productBean.getName());
			order.put("PicUrl", productBean.getPictureurl());
			// 定單編號
			order.put("orderId", orderBean.getOrderid() + "");
			// 總價	
			
			
//			算總價
			List<OrderDetail> d = orderBean.getOrderDetail();
			int total = 0;
			int q = 0;
			for (OrderDetail detail : d) {
				q += detail.getQuantity();
				total += detail.getQuantity() * detail.getSellingprice();
			}
			order.put("q", q + "");
			order.put("total", total + "");

			switch (orderBean.getOrderstatus()) {
			case "1":
				order.put("state", "訂單成立,未出貨");
				break;
			case "2":
				order.put("state", "訂單成立,已出貨");
				break;
			case "3":
				order.put("state", "訂單完成");
				break;
			}

			orderList.add(order);
		}
		model.addAttribute("orderList", orderList);
		return "/user/userHome";
	}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//定單細節
	@RequestMapping("/user/showDetail/{OrderId}")
	public String showDetail(Model model,@PathVariable("OrderId") Integer orderId) {
		System.out.println("*****定單細節******");
		OrderBean orderBean = orderRepository.getById(orderId);
		List<OrderDetail> list = orderBean.getOrderDetail();
		List<Map<String, String>> orderDetailList = new ArrayList<Map<String,String>>();
		Map<String, String> m;
		int total = 0;
		int num = 0;
		for(OrderDetail detail : list) {
			m=new HashMap<String, String>();
			ProductOptionBean productOptionBean = por.getById(detail.getProductid());
			ProductBean  product= productRepository.getById(productOptionBean.getProductid());			
			m.put("PicUrl",product.getPictureurl());
			m.put("name" ,product.getName());
			m.put("sellingprice" ,String.valueOf(detail.getSellingprice()));
			m.put("quantity" ,String.valueOf(detail.getQuantity()));
			m.put("type" ,productOptionBean.getProduct_type());
			m.put("product_group", productOptionBean.getProduct_group());
			m.put("product_option", productOptionBean.getProduct_option());
			m.put("product_group2", productOptionBean.getProduct_group2());
			m.put("product_option2", productOptionBean.getProduct_option2());
			m.put("product_group3", productOptionBean.getProduct_group3());
			m.put("product_option3", productOptionBean.getProduct_option3());
			total+= detail.getSellingprice()*detail.getQuantity();
			num += detail.getQuantity();
			orderDetailList.add(m);
		}
		
		model.addAttribute("orderId", orderId);
		model.addAttribute("total", total);
		model.addAttribute("num", num);		
		model.addAttribute("orderDetail", orderDetailList);
		return "/user/showDetail";
	}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//修改會員資料
	@RequestMapping("/user/updataUser")
	public String updataUser(UserBean userBean,HttpSession session) {
		System.out.println("*****修改會員資料******");
		System.out.println(userBean);
		UserBean bean = userRepository.getById(userBean.getUserid());
		userBean.setPassword(bean.getPassword());
		userBean.setState(bean.getState());
		UserBean save = userRepository.save(userBean);
		session.removeAttribute("uuser");
		session.setAttribute("user", save);
		System.out.println(userRepository.save(userBean));
		return "redirect:/user/userHome";		
	}
}
