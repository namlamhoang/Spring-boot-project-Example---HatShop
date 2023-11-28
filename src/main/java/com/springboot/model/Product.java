package com.springboot.model;

import java.util.Base64;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="product")
public class Product {
	
	@Id
	@Column(name="product_code")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int productCode;
	
	@Column(name="product_name")
	private String productName;
	
	@Column(name="price")
	private double price;
	
	@Column(name="quantity")
	private int quantity;
	
	@Column(name="image")
	private byte[] image;
	
	@Column(name="is_delete")
	private int isDelete;
	
	@Column(name="category_code")
	private int categoryCode;
	
	@Column(name="brand_code")
	private int brandCode;
	
	@Column(name="description")
	private String description;
	
	public Product() {
		// TODO Auto-generated constructor stub
	}

	public Product(int productCode, String productName, double price, int quantity, byte[] image, int isDelete,
			int categoryCode,int brandCode, String description) {
		this.productCode = productCode;
		this.productName = productName;
		this.price = price;
		this.quantity = quantity;
		this.image = image;
		this.isDelete = isDelete;
		this.categoryCode = categoryCode;
		this.brandCode = brandCode;
		this.description = description;
	}
	
	public int getProductCode() {
		return productCode;
	}

	public void setProductCode(int productCode) {
		this.productCode = productCode;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
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

	public String getImage() {
		if(image == null) return null;
		return Base64.getEncoder().encodeToString(image);
	}
	
	public byte[] getImageByte() {
		return image;
	}

	public void setImage(byte[] image) {
		this.image = image;
	}

	public int getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(int isDelete) {
		this.isDelete = isDelete;
	}

	public int getCategoryCode() {
		return categoryCode;
	}

	public void setCategoryCode(int categoryCode) {
		this.categoryCode = categoryCode;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getBrandCode() {
		return brandCode;
	}

	public void setBrandCode(int brandCode) {
		this.brandCode = brandCode;
	}
	
}
