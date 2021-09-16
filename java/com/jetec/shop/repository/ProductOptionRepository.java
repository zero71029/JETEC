package com.jetec.shop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import com.jetec.shop.model.ProductOptionBean;
import java.lang.String;

public interface ProductOptionRepository extends JpaRepository<ProductOptionBean,Integer>{
	
	
	
	

	boolean existsByProductid(Integer productId);
	List<ProductOptionBean> findByProductid(Integer productid);
	
	@Query(value ="select product_option3 from product_option where product_option2 = ?1  ", nativeQuery=true)
	List<String> findO3ByK2(String k2);
	@Query(value ="select product_option2 from product_option where product_option = ?1  ", nativeQuery=true)
	List<String> findO2ByK1(String k1);
	
	
	
	
//	@Query("from ProductOptionBean where product_option is null")
//	List<ProductOptionBean> findByOptionNull();

	@Transactional
	@Modifying
	@Query(value ="DELETE FROM product_option where product_option is null", nativeQuery=true)
	void delNull();

	@Transactional
	@Modifying
	@Query(value ="DELETE FROM product_option where product_group = ?1", nativeQuery=true)
	void deletegroup(String group);
	
	@Transactional
	@Modifying
	@Query(value ="UPDATE product_option SET product_group = ?1 WHERE productid = ?2", nativeQuery=true)
	void saveGroup1(String group ,Integer productid);
	
	@Transactional
	@Modifying
	@Query(value ="UPDATE product_option SET product_group2 = ?1 WHERE productid = ?2", nativeQuery=true)
	void saveGroup2(String group2 ,Integer productid);
	@Transactional
	@Modifying
	@Query(value ="UPDATE product_option SET product_group3 = ?1 WHERE productid = ?2", nativeQuery=true)
	void saveGroup3(String group3 ,Integer productid);
	
}
