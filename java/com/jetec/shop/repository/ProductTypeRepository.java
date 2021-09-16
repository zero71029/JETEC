package com.jetec.shop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import com.jetec.shop.model.ProductTypeBean;

public interface ProductTypeRepository extends JpaRepository<ProductTypeBean,Integer>{
	@Query(value ="SELECT DISTINCT love1 FROM `product_type`", nativeQuery=true)
	List<String> findLove1();
	boolean existsByLove2(String love2);
}
