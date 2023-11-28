package com.springboot.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="orderdetail")
public class OrderDetail {

	@Id
	@Column(name="order_code")
	private int orderCode;
	
	@Column(name="product_code")
	private int productCode;
	
	@Column(name="price")
	private double price;
	
	@Column(name="quantity")
	private int quantity;
	
	@Column(name="is_delete")
	private int isDelete;
	
	private String productName;
	
	private String image;
	
	@JsonIgnore
	@ManyToOne
	@JoinColumn(name="order_code",insertable = false,updatable = false)
	private Order order;	
	
	public OrderDetail() {
		// TODO Auto-generated constructor stub
	}
	
	public OrderDetail(int productCode,String image,String productName,int orderCode, double price, int quantity, int isDelete) {
		this.productCode = productCode;
		this.orderCode = orderCode;
		this.price = price;
		this.quantity = quantity;
		this.isDelete = isDelete;
		this.productName = productName;
		this.image = image;
	}

	public int getProductCode() {
		return productCode;
	}

	public void setProductCode(int productCode) {
		this.productCode = productCode;
	}

	public int getOrderCode() {
		return orderCode;
	}

	public void setOrderCode(int orderCode) {
		this.orderCode = orderCode;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(int isDelete) {
		this.isDelete = isDelete;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}
	
}
