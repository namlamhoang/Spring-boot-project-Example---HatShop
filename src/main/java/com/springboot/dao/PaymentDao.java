package com.springboot.dao;



import org.springframework.data.jpa.repository.JpaRepository;

import com.springboot.model.Payment;

public interface PaymentDao extends JpaRepository<Payment, Integer>  {
	
}
