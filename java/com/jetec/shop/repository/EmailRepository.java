package com.jetec.shop.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.jetec.shop.model.EmailBean;

public interface EmailRepository extends JpaRepository<EmailBean, String>{
	
	boolean existsByEmail(String email);
}
