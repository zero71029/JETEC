package com.jetec.shop.repository.service;

import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jetec.shop.model.OrderBean;
import com.jetec.shop.model.OrderDetail;
import com.jetec.shop.model.ProductBean;
import com.jetec.shop.model.ProductOptionBean;
import com.jetec.shop.repository.OrderDetailRepository;
import com.jetec.shop.repository.OrderRepository;
import com.jetec.shop.repository.ProductOptionRepository;
import com.jetec.shop.repository.ProductRepository;



@Service
@Transactional
public class OrderService {
	@Autowired
	OrderRepository orderRepository;
	@Autowired
	OrderDetailRepository detailRepository;
	@Autowired
	ProductRepository productRepository ;
	@Autowired
	ProductOptionRepository por;
	
	public OrderBean saveOrder(OrderBean order, Map<String, Integer> cart) {
		
//		OrderBean save = orderRepository.save(order);
//		OrderDetail orderDetailBean;
//	    for (Object key : cart.keySet()){	 
//			Optional<ProductBean> op =productRepository.findById(Integer.parseInt((String)key));
//			ProductBean productBean =op.get();			
//            orderDetailBean = new OrderDetail();
//            orderDetailBean.setOrderid(save.getOrderid());
//            orderDetailBean.setProductid(productBean.getId());
//            orderDetailBean.setSellingprice(productBean.getSellprice());
//            orderDetailBean.setQuantity(cart.get(key));
//            orderDetailBean.setDiscount("1");        
//            detailRepository.save(orderDetailBean);            
  
//        }
		OrderDetail orderDetailBean;
	    for (Object key : cart.keySet()){
	    	ProductOptionBean productOptionBean = por.getById(Integer.parseInt((String)key));
	    	
	    	//設定訂單細節 後儲存
            orderDetailBean = new OrderDetail();          
            orderDetailBean.setProductid(productOptionBean.getId());
            orderDetailBean.setSellingprice(productOptionBean.getProduct_price());
            orderDetailBean.setQuantity(cart.get(key));
            orderDetailBean.setDiscount("1");        
            order.getOrderDetail().add(orderDetailBean);
            //修改庫存數量
            productOptionBean.setProduct_quantity(productOptionBean.getProduct_quantity()-cart.get(key));
            por.save(productOptionBean);
            
        }	
	    OrderBean save = orderRepository.save(order);
	    System.out.println("order"+save);
		return order;
	}
}
