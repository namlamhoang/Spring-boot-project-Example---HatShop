package com.springboot.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="category")
public class Category {

	@Id
	@Column(name="category_code")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int categoryCode;
	
	@Column(name="category_name")
	private String categoryName;
	
	@Column(name="is_delete")
	private String isDelete;
	
	public Category() {
		// TODO Auto-generated constructor stub
	}
	
	public Category(int categoryCode, String categoryName, String isDelete) {
		this.categoryCode = categoryCode;
		this.categoryName = categoryName;
		this.isDelete = isDelete;
	}

	public int getCategoryCode() {
		return categoryCode;
	}

	public void setCategoryCode(int categoryCode) {
		this.categoryCode = categoryCode;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(String isDelete) {
		this.isDelete = isDelete;
	}
	
}
