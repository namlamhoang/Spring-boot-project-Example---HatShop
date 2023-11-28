package com.springboot.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="payment")
public class Payment {

	@Id
	@Column(name="payment_code")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int paymentCode;
	
	@Column(name="payment_name")
	private String paymentName;
	
	@Column(name="is_delete")
	private int isDelete;
	
	public Payment() {
		// TODO Auto-generated constructor stub
	}
	
	public Payment(int paymentCode, String paymentName, int isDelete) {
		this.paymentCode = paymentCode;
		this.paymentName = paymentName;
		this.isDelete = isDelete;
	}

	public int getPaymentCode() {
		return paymentCode;
	}

	public void setPaymentCode(int paymentCode) {
		this.paymentCode = paymentCode;
	}

	public String getPaymentName() {
		return paymentName;
	}

	public void setPaymentName(String paymentName) {
		this.paymentName = paymentName;
	}

	public int getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(int isDelete) {
		this.isDelete = isDelete;
	}
	
}
