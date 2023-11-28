package com.springboot.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="`order`")
public class Order {
	
	@Id
	@Column(name="order_code")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int orderCode;
	
	@Column(name="order_date")
	private String orderDate;
	
	@Column(name="address")
	private String address;
	
	@Column(name="status")
	private int status;
	
	@Column(name="user_name")
	private String userName;
	
	@Column(name="payment_code")
	private int paymentCode;
	
	@Column(name="is_delete")
	private int isDelete;
	
	@OneToMany(cascade = CascadeType.ALL,fetch = FetchType.EAGER,mappedBy = "order")
    private List<OrderDetail> orderDetail = new ArrayList<>();

	public Order() {
		// TODO Auto-generated constructor stub
	}
	
	public Order(int orderCode, String orderDate, String address, int status, String userName, int paymentCode,
			int isDelete) {
		this.orderCode = orderCode;
		this.orderDate = orderDate;
		this.address = address;
		this.status = status;
		this.userName = userName;
		this.paymentCode = paymentCode;
		this.isDelete = isDelete;
	}
	
	public int getOrderCode() {
		return orderCode;
	}

	public void setOrderCode(int orderCode) {
		this.orderCode = orderCode;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int isStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getPaymentCode() {
		return paymentCode;
	}

	public void setPaymentCode(int paymentCode) {
		this.paymentCode = paymentCode;
	}

	public int getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(int isDelete) {
		this.isDelete = isDelete;
	}

	public List<OrderDetail> getOrderDetail() {
		return orderDetail;
	}

	public void setOrderDetail(List<OrderDetail> orderDetail) {
		this.orderDetail = orderDetail;
	}

	public int getStatus() {
		return status;
	}
	
}
