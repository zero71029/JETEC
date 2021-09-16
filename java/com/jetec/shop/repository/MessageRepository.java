package com.jetec.shop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.jetec.shop.model.MessageBean;

public interface MessageRepository extends JpaRepository<MessageBean,Integer>{
	
	List<MessageBean> findByState(String state);
	

}
