package com.jetec.shop.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.jetec.shop.model.PdfUrlBean;

public interface PdfUrlRepository extends JpaRepository<PdfUrlBean,Integer>{
	
	PdfUrlBean findByUrlAndProductid(String url,Integer ProductId); 

}
