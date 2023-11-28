package com.springboot.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="brand")
public class Brand {
	
	@Id
	@Column(name="brand_code")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int brandCode;
	
	@Column(name="brand_name")
	private String brandName;
	
	@Column(name="is_delete")
	private String isDelete;

	public Brand() {
		// TODO Auto-generated constructor stub
	}

	public Brand(int brandCode, String brandName, String isDelete) {
		super();
		this.brandCode = brandCode;
		this.brandName = brandName;
		this.isDelete = isDelete;
	}

	public int getbrandCode() {
		return brandCode;
	}

	public void setbrandCode(int brandCode) {
		this.brandCode = brandCode;
	}

	public String getbrandName() {
		return brandName;
	}

	public void setbrandName(String brandName) {
		this.brandName = brandName;
	}

	public String getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(String isDelete) {
		this.isDelete = isDelete;
	}
}
