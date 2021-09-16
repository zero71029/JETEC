package com.jetec.shop.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import com.jetec.shop.model.ProductBean;



public interface ProductRepository extends JpaRepository<ProductBean, Integer>{
	
	Page<ProductBean> findByProductstatus(String state,Pageable pageable);
	ProductBean findByModel(String model);
	boolean existsByModel(String model);
	List<ProductBean> findByNameLikeIgnoreCase(String name);
	List<ProductBean> findByModelLikeIgnoreCase(String model);
	Page<ProductBean> findByProductstatusAndType(String state,Integer type,Pageable pageable);
	boolean existsByType(Integer type);


	@Transactional
	@Modifying
	@Query(value ="DELETE FROM product_specification where id is null ", nativeQuery=true)
	void delNull();
	@Transactional
	@Modifying
	@Query(value ="DELETE FROM product_specification where sptext =''", nativeQuery=true)
	void delNull2();
	
	@Query(value ="select  sellprice from product where id = ?1", nativeQuery=true)
	Integer finPiceById(String  id);

}
