package com.jetec.shop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.jetec.shop.model.OrderBean;

public interface OrderRepository extends JpaRepository<OrderBean, Integer>{
	List<OrderBean> findByOrderstatus(String orderstatus);
	List<OrderBean> findByUserid(Integer userid );
	@Query(value ="SELECT DISTINCT * FROM `orders` WHERE userid = ?1 GROUP BY address ORDER BY createdate DESC  ", nativeQuery=true)
	List<OrderBean> selectAddress(Integer userId);
	
	@Query(value ="SELECT  * FROM `orders` WHERE userid = ?1  ORDER BY createdate DESC  ", nativeQuery=true)
	List<OrderBean> findByUseridDESC(Integer userId);
}
