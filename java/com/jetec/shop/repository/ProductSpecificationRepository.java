package com.jetec.shop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import com.jetec.shop.model.ProductSpecificationBean;

public interface ProductSpecificationRepository extends JpaRepository<ProductSpecificationBean,Integer>{
	@Transactional
	@Modifying
	@Query(value ="DELETE FROM product_specification where id is null ", nativeQuery=true)
	void delNull();
	@Transactional
	@Modifying
	@Query(value ="DELETE FROM product_specification where sptext is null ", nativeQuery=true)
	void delSptextNull();

}
