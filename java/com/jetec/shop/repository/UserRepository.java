package com.jetec.shop.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.jetec.shop.model.UserBean;


public interface UserRepository extends JpaRepository<UserBean, Integer>{
	boolean existsByemail(String email);
	boolean existsByPhone(String phone);
	UserBean findByEmail(String email);
	UserBean findByPhone(String phone);
	UserBean findByEmailAndPassword(String email,String password);
	UserBean findByPhoneAndPassword(String phone,String password);
}
