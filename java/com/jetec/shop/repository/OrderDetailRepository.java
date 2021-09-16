package com.jetec.shop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;


import com.jetec.shop.model.OrderDetail;

public interface OrderDetailRepository extends JpaRepository<OrderDetail, Integer>{

		
	List<OrderDetail> findByOrderid(Integer orderid);
}
