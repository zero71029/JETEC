package com.jetec.shop.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.jetec.shop.model.AdminBean;

public interface AdminRepository  extends JpaRepository<AdminBean, Integer>{

}
